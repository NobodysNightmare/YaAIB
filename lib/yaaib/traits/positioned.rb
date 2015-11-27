require 'yaaib/vector'

module YaAIB
  module Positioned
    def position
      @position
    end

    def distance_to(other)
      other = other.to_vector
      (position - other).length
    end

    def direction_to(other)
      other = other.to_vector
      (other - position).normalized
    end

    def to_vector
      position
    end
  end
end
