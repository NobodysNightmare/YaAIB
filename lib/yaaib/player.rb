module YaAIB
  class Player
    def think(interface)
      fail 'implement your own think method'
    end

    def name
      self.class.name
    end

    def color
      @color ||= [rand(255), rand(255), rand(255)]
    end
  end
end
