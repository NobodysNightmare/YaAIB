require 'gosu'

module YaAIB
  module VisualRunner
    class FleetRenderer
      class << self
        FONT = Gosu::Font.new(10)

        def draw(position, z, size, color, text)
          Gosu.draw_rect(position.x - (size / 2), position.y - (size / 2), size, size, color)
          FONT.draw_rel(text, position.x, position.y, 1, 0.5, 0.5)
        end
      end
    end
  end
end
