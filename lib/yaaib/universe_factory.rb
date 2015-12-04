require 'yaaib/planet'

module YaAIB
  class UniverseFactory
    attr_reader :planets, :width, :height

    DEFAULT_WIDTH = 150
    DEFAULT_HEIGHT = 110
    MIN_DISTANCE = 5

    def initialize(planets_per_player, players, random, width: DEFAULT_WIDTH, height: DEFAULT_HEIGHT)
      @planets_per_player = planets_per_player
      @width = width
      @height = height
      @players = players
      @random = random
      @planets = []
    end

    def build
      @players.each do |player|
        @planets << create_planet(owner: player)

        (1..@planets_per_player).each do |_|
          position = random_position
          @planets << create_planet
        end
      end
    end

    def size
      Vector.new(width, height)
    end

    private

    def create_planet(owner: nil)
      position = random_position
      Planet.new(position: position,
                 regeneration: 1,
                 owner: owner,
                 initial_supply: 10)
    end

    def random_position
      position = Vector.new(@random.rand(width), @random.rand(height))
      if planets.any? { |planet| planet.distance_to(position) < MIN_DISTANCE }
        random_position
      else
        position
      end
    end
  end
end
