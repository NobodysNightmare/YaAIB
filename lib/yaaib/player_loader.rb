require 'yaaib/player'

module YaAIB
  class PlayerLoader
    class << self
      def find_players()
        Dir['lib/yaaib/players/*.rb'].each { |file| require File.absolute_path(file) }

        player_classes = ObjectSpace.each_object(Class)
                         .select { |klass| klass < YaAIB::Player  && klass != YaAIB::Player }

        players = player_classes.map { |klass| klass.new }
        log_players(players)

        players
      end

      private

      def log_players(players)
        puts "Loaded #{players.count} players:"
        players.each do |player|
          puts " - #{player.name}"
        end
      end
    end
  end
end
