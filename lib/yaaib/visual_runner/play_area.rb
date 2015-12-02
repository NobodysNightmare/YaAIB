require 'gosu'

require 'yaaib/visual_runner/fleet_renderer'
require 'yaaib/visual_runner/planet_renderer'

module YaAIB
  module VisualRunner
    class PlayArea
      PADDING = Vector.new(5, 5)

      PLANET_Z = 1
      FLEET_Z = 2

      NEUTRAL_COLOR = Gosu::Color.from_hsv(0, 0, 1)

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
        size = 6 * @scale
        @simulation.planets.each do |planet|
          screen_position = @position + (planet.position * @scale)
          color = planet.owner ? make_color(planet.owner) : NEUTRAL_COLOR
          PlanetRenderer.draw(screen_position, PLANET_Z, size, color, planet.supply)
        end
      end

      def draw_fleets
        size = 1.5 * @scale
        @simulation.fleets.each do |fleet|
          screen_position = @position + (fleet.position * @scale)
          color = make_color(fleet.owner)
          FleetRenderer.draw(screen_position, PLANET_Z, size, color, fleet.size)
        end
      end

      def make_color(player)
        rgb = player.color
        Gosu::Color.rgba(rgb[0], rgb[1], rgb[2], 255)
      end
    end
  end
end
