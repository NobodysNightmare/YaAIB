require 'gosu'

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
        draw_background
        draw_players
        draw_info
      end

      def pause(active:)
        @paused = active
      end

      def update_speed(speed)
        @game_speed = speed
      end

      private

      def draw_background
        Gosu.draw_rect(@position.x, @position.y, @size.x, @size.y, BG_COLOR)
      end

      def draw_players
        @simulation.players.each_with_index do |player, index|
          player_text(player, index)
        end
      end

      def draw_info
        bottom_text('PAUSED', 1) if @paused
        bottom_text("T/s: #{@game_speed}", 0)
      end

      def player_text(player, line)
        x = @position.x
        y = @position.y + PADDING.y + (FONT.height * line * 1.1)
        Gosu.draw_rect(x, y, @size.x, FONT.height, make_color(player))
        FONT.draw(player.name, x, y, 1, 1, 1, TEXT_COLOR)
      end

      def bottom_text(text, line)
        x = @position.x + @size.x / 2
        y = @position.y + @size.y - PADDING.y - (FONT.height * line * 1.1)
        FONT.draw_rel(text, x, y, 1, 0.5, 1.0, 1, 1, TEXT_COLOR)
      end

      def make_color(player)
        rgb = player.color
        Gosu::Color.rgba(rgb[0], rgb[1], rgb[2], 255)
      end
    end
  end
end
