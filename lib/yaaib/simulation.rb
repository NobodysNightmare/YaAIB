require 'yaaib/player_interface'

module YaAIB
  class Simulation
    attr_reader :planets, :fleets, :players

    def initialize(planets, players)
      @planets = planets
      @players = players
      @fleets = []
    end

    def run_cycle
      players_think
      simulate_environment
    end

    private

    def players_think
      players.each do |player|
        interface = PlayerInterface.new(planets, fleets, player)
        player.think(interface)
      end
    end

    def simulate_environment
      planets.each do |planet|
        planet.resupply
      end

      fleets.each do |fleet|
        fleet.fly
      end

      fleets.reject!(&:dead?)
    end
  end
end
