require 'gosu'

require 'yaaib/simulation'
require 'yaaib/player_loader'
require 'yaaib/universe_factory'

module YaAIB
  module VisualRunner
    class Hud
      PADDING = Vector.new(5, 5)
      BG_COLOR = Gosu::Color.rgba(0, 0, 0, 128)
      TEXT_COLOR = Gosu::Color.rgba(255, 255, 255, 255)
      FONT = Gosu::Font.new(20)

      def initialize(position, size, simulation)
        @position = position
        @size = size
        @simulation = simulation
      end

      def draw
        color = Gosu::Color.rgba(0, 0, 0, 128)
        Gosu.draw_rect(@position.x, @position.y, @size.x, @size.y, color)
        bottom_text('PAUSED', 1) if @paused
        bottom_text("T/s: #{@game_speed}", 0)
      end

      def pause(active:)
        @paused = active
      end

      def update_speed(speed)
        @game_speed = speed
      end

      private

      def bottom_text(text, line)
        x = @position.x + @size.x / 2
        y = @position.y + @size.y - PADDING.y - (FONT.height * line * 1.1)
        FONT.draw_rel(text, x, y, 1, 0.5, 1.0, 1, 1, TEXT_COLOR)
      end
    end
  end
end
