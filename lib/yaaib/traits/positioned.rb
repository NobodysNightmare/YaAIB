module YaAIB
  module Positioned
    def position
      @position
    end

    def distance_to(other)
      (position - other.position).length
    end

    def direction_to(other)
      (position - other.positon).normalized
    end
  end
end
