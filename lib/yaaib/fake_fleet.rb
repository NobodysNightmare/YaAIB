require 'delegate'

module YaAIB
  class FakeFleet < SimpleDelegator
    attr_reader :target

    def initialize(environment, fleet)
      super(fleet)
      @target = environment.find_planet(fleet.target.position)
    end
  end
end
