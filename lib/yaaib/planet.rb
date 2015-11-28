require 'yaaib/traits/positioned'

module YaAIB
  class Planet
    include Positioned

    attr_reader :regeneration, :owner
    attr_accessor :supply

    def initialize(position:, regeneration:, owner: nil, initial_supply: 0)
      @position = position
      @regeneration = regeneration
      @owner = owner
      @supply = initial_supply
    end

    def resupply
      return if owner.nil?
      @supply += @regeneration
    end

    def accept_fleet(fleet)
      if fleet.owner == owner
        @supply += fleet.size
      else
        @supply -= fleet.size
      end

      if supply < 0
        @owner = fleet.owner
        @supply = @supply.abs
      end
    end
  end
end
