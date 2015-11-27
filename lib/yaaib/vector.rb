module YaAIB
  class Vector
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def length
      @length ||= Math.sqrt(x*x + y*y)
    end

    def normalized
      self / length
    end

    def to_vector
      self
    end

    def +(other)
      Vector.new(x + other.x, y + other.y)
    end

    def -(other)
      Vector.new(x - other.x, y - other.y)
    end

    def *(scalar)
      Vector.new(x * scalar, y * scalar)
    end

    def /(scalar)
      Vector.new(x / scalar, y / scalar)
    end
  end
end
