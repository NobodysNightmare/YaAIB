$LOAD_PATH << 'lib'

require 'gosu'

require 'yaaib/simulation'
require 'yaaib/player_loader'
require 'yaaib/universe_factory'

class GameWindow < Gosu::Window
  UPDATE_INTERVAL = 0.1

  NEUTRAL_COLOR = Gosu::Color.from_hsv(0, 0, 128)
  PLANET_FONT = Gosu::Font.new(20)
  FLEET_FONT = Gosu::Font.new(10)

  def initialize(width, height)
    super(width, height)
    self.caption = "Game Window"

    players = YaAIB::PlayerLoader.find_players
    factory = YaAIB::UniverseFactory.new(20, players)
    factory.build

    @simulation = YaAIB::Simulation.new(factory.planets, players)
    @scale = width / factory.width
    @last_update = Time.now
  end

  def update
    now = Time.now
    if (now - @last_update) > UPDATE_INTERVAL
      @last_update = now
      @simulation.run_cycle
    end
  end

  def draw
    draw_planets
    draw_fleets
  end

  private

  def draw_planets
    size = 5 * @scale
    @simulation.planets.each do |planet|
      screen_position = planet.position * @scale
      color = planet.owner ? make_color(planet.owner) : NEUTRAL_COLOR
      Gosu.draw_rect(screen_position.x - (size / 2), screen_position.y - (size / 2), size, size, color)
      PLANET_FONT.draw_rel(planet.supply, screen_position.x, screen_position.y, 1, 0.5, 0.5)
    end
  end

  def draw_fleets
    size = 1 * @scale
    @simulation.fleets.each do |fleet|
      color = make_color(fleet.owner)
      screen_position = fleet.position * @scale
      Gosu.draw_rect(screen_position.x - (size / 2), screen_position.y - (size / 2), size, size, color)
      FLEET_FONT.draw_rel(fleet.size, screen_position.x, screen_position.y, 1, 0.5, 0.5)
    end
  end

  def make_color(player)
    rgb = player.color
    Gosu::Color.rgba(rgb[0], rgb[1], rgb[2], 255)
  end
end

window = GameWindow.new(640, 640)
window.show
