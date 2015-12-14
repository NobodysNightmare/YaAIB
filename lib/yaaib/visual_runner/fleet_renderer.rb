require 'gosu'

module YaAIB
  module VisualRunner
    class FleetRenderer
      class << self
        FONT = Gosu::Font.new(10)
        SIZE = 16

        def draw(position, z, color, text)
          scale = SIZE.to_f / overlay.width
          tint.draw(position.x - (SIZE / 2), position.y - (SIZE / 2), z, scale, scale, color)
          overlay.draw(position.x - (SIZE / 2), position.y - (SIZE / 2), z, scale, scale)
          FONT.draw_rel(text, position.x + (SIZE / 2), position.y + (SIZE / 2), 1, 0, 0)
        end

        private

        def tint
          @tint ||= Gosu::Image.new('assets/fleet_tint_texture.png')
        end

        def overlay
          @overlay ||= Gosu::Image.new('assets/fleet_overlay_texture.png')
        end
      end
    end
  end
end
