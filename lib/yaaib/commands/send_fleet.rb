require 'yaaib/fleet'
require 'yaaib/invalid_move_error'

module YaAIB
  module Commands
    class SendFleet
      def initialize(player:, source:, target:, size:)
        fail InvalidMoveError, "Fleets can't have negative size" if size < 0

        @player = player
        @source_position = source.position
        @target_position = target.position
        @size = size
      end

      def execute(environment)
        source = find_planet(environment, @source_position, 'source')
        target = find_planet(environment, @target_position, 'target')
        fail InvalidMoveError, 'Source planet is not yours' if source.owner != @player
        fail InvalidMoveError, 'Not enough supplies' if @size > source.supply
        return if @size == 0

        environment.fleets << Fleet.new(owner: @player,
                                        position: source.position,
                                        size: @size,
                                        target: target)
        source.supply -= @size
      end

      private

      def find_planet(environment, position, label)
        result = environment.find_planet(position)
        fail "Could not find #{label} planet" unless result
        result
      end
    end
  end
end
