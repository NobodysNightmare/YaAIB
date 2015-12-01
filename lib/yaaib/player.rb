module YaAIB
  class Player
    attr_reader :rng

    def initialize(rng)
      @rng = rng
    end

    def think(interface)
      fail 'implement your own think method'
    end

    def name
      self.class.name.split('::').last
    end

    def author
      'anonymous'
    end

    def color
      @color ||= [rng.rand(255), rng.rand(255), rng.rand(255)]
    end
  end
end
