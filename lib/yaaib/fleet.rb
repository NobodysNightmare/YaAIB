require 'yaaib/traits/positioned'

module YaAIB
  class Fleet
    include Positioned

    MOVEMENT_SPEED = 1

    attr_reader :size, :owner, :target

    def initialize(owner:, size:, position:, target:)
      @owner = owner
      @size = size
      @position = position
      @target = target
    end

    def dead?
      size == 0
    end

    def fly
      move_distance = [MOVEMENT_SPEED, distance_to(target)].min
      direction = direction_to(target)
      @position += direction * move_distance

      if distance_to(target) < 0.1
        target.accept_fleet(self)
        @size = 0
      end
    end
  end
end
