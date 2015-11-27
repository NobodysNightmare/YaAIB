require 'yaaib/fleet'
require 'yaaib/invalid_move_error'

module YaAIB
  class PlayerInterface
    attr_reader :planets, :fleets, :player

    def initialize(planets, fleets, player)
      @planets = planets
      @fleets = fleets
      @player = player
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
      if source.owner != player
        fail InvalidMoveError, 'Source planet is not yours'
      end

      if size > source.supply
        fail InvalidMoveError, 'Not enough supplies'
      end

      @fleets << Fleet.new(owner: player,
                           position: source.position,
                           size: size,
                           target: target)
      source.supply -= size
    end
  end
end
