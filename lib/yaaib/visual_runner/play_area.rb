require 'gosu'

module YaAIB
  module VisualRunner
    class PlayArea
      PADDING = Vector.new(5, 5)

      NEUTRAL_COLOR = Gosu::Color.from_hsv(0, 0, 128)
      PLANET_FONT = Gosu::Font.new(20)
      FLEET_FONT = Gosu::Font.new(10)

      def initialize(position, size, simulation)
        @position = position + PADDING
        @simulation = simulation
        @scale = [(size.x - (2 * PADDING.x)) / universe_size.x,
                  (size.y - (2 * PADDING.y)) / universe_size.y].min
      end

      def draw
        draw_planets
        draw_fleets
      end

      private

      def universe_size
        width = @simulation.planets.map { |p| p.position.x }.max
        height = @simulation.planets.map { |p| p.position.y }.max
        Vector.new(width, height)
      end

      def draw_planets
        size = 5 * @scale
        @simulation.planets.each do |planet|
          screen_position = @position + (planet.position * @scale)
          color = planet.owner ? make_color(planet.owner) : NEUTRAL_COLOR
          Gosu.draw_rect(screen_position.x - (size / 2), screen_position.y - (size / 2), size, size, color)
          PLANET_FONT.draw_rel(planet.supply, screen_position.x, screen_position.y, 1, 0.5, 0.5)
        end
      end

      def draw_fleets
        size = 1.5 * @scale
        @simulation.fleets.each do |fleet|
          color = make_color(fleet.owner)
          screen_position = @position + (fleet.position * @scale)
          Gosu.draw_rect(screen_position.x - (size / 2), screen_position.y - (size / 2), size, size, color)
          FLEET_FONT.draw_rel(fleet.size, screen_position.x, screen_position.y, 1, 0.5, 0.5)
        end
      end

      def make_color(player)
        rgb = player.color
        Gosu::Color.rgba(rgb[0], rgb[1], rgb[2], 255)
      end
    end
  end
end
