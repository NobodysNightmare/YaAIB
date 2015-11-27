require 'yaaib/traits/positioned'

module YaAIB
  class Fleet
    include Positioned

    MOVEMENT_SPEED = 10

    attr_reader :size, :owner, :target

    def initialize(owner:, size:, position:, target:)
      @owner = owner
      @size = size
      @position = position
      @target = target
    end

    def fly
      move_distance = [MOVEMENT_SPEED, distance_to(target)].min
      direction = direction_to(target)
      @position += direction * distance
    end
  end
end
