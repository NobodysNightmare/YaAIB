require 'gosu'

require 'yaaib/simulation'
require 'yaaib/player_loader'
require 'yaaib/universe_factory'
require 'yaaib/visual_runner/hud'
require 'yaaib/visual_runner/play_area'

module YaAIB
  module VisualRunner
    class Window < Gosu::Window
      def initialize(width, height, random)
        super(width, height)
        self.caption = "Game Window"

        players = YaAIB::PlayerLoader.find_players(random)
        factory = YaAIB::UniverseFactory.new(7, players, random)
        factory.build

        @simulation = YaAIB::Simulation.new(factory.planets, players)
        play_area_width = (factory.width.to_f / factory.height.to_f) * height.to_f
        @play_area = PlayArea.new(Vector.new(0, 0),
                                  Vector.new(play_area_width, height),
                                  @simulation)
        @hud = Hud.new(Vector.new(play_area_width, 0),
                       Vector.new(width - play_area_width, height),
                       @simulation)
        @last_update = Time.now
        @ticks_per_second = 10
        @hud.update_speed(@ticks_per_second)
        @background = Gosu::Image.new("assets/background.jpg")
      end

      def update
        now = Time.now
        return if @paused
        if (now - @last_update) > (1.0 / @ticks_per_second)
          @last_update = now
          @simulation.run_cycle
        end
      end

      def draw
        @background.draw(0, 0, 0)
        @play_area.draw
        @hud.draw
      end

      def button_up(id)
        if id == Gosu::KbComma
          @ticks_per_second /= 2.0
          @hud.update_speed(@ticks_per_second)
        elsif id == Gosu::KbPeriod
          @ticks_per_second *= 2.0
          @hud.update_speed(@ticks_per_second)
        elsif id == Gosu::KbSpace
          @paused = !@paused
          @hud.pause active: @paused
        elsif id == Gosu::KbEscape
          close
        end
      end
    end
  end
end
