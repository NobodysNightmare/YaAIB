require 'gosu'

module YaAIB
  module VisualRunner
    class PlanetRenderer
      class << self
        FONT = Gosu::Font.new(20)
        SIZE = 48

        def draw(position, z, color, text)
          scale = SIZE.to_f / overlay.width
          tint.draw(position.x - (SIZE / 2), position.y - (SIZE / 2), z, scale, scale, color)
          overlay.draw(position.x - (SIZE / 2), position.y - (SIZE / 2), z, scale, scale)
          FONT.draw_rel(text, position.x, position.y, 1, 0.5, 0.5)
        end

        private

        def tint
          @tint ||= Gosu::Image.new('assets/planet_tint_texture.png')
        end

        def overlay
          @overlay ||= Gosu::Image.new('assets/planet_overlay_texture.png')
        end
      end
    end
  end
end
