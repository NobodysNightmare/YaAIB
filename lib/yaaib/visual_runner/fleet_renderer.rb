require 'gosu'

module YaAIB
  module VisualRunner
    class FleetRenderer
      class << self
        FONT = Gosu::Font.new(10)
        SIZE = 16

        def draw(position, z, color, text)
          Gosu.draw_rect(position.x - (SIZE / 2), position.y - (SIZE / 2), SIZE, SIZE, color)
          FONT.draw_rel(text, position.x, position.y, 1, 0.5, 0.5)
        end
      end
    end
  end
end
