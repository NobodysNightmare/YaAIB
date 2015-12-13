require 'yaaib/commands/send_fleet'
require 'yaaib/fake_fleet'
require 'yaaib/fake_planet'

module YaAIB
  class PlayerInterface
    attr_reader :planets, :fleets, :player

    def initialize(planets, fleets, player)
      @planets = planets.map { |planet| FakePlanet.new(planet) }
      @fleets = fleets.map { |fleet| FakeFleet.new(self, fleet) }
      @player = player
      @commands = []
    end

    def find_planet(position)
      @planets.detect { |planet| planet.position == position }
    end

    def allied_planets
      planets.select { |planet| planet.owner == player }
    end

    def neutral_planets
      planets.select { |planet| planet.owner == nil }
    end

    def enemy_planets
      planets.reject { |planet| planet.owner == player || planet.owner == nil }
    end

    def send_fleet(source:, target:, size:)
      command = Commands::SendFleet.new source: source,
                                        target: target,
                                        size: size,
                                        player: player
      @commands << command
      command.execute(self)
    end

    def apply_commands(environment)
      @commands.each do |command|
        command.execute(environment)
      end
    end
  end
end
