require 'yaaib/traits/write_copy_delegator'

module YaAIB
  class FakePlanet < WriteCopyDelegator
    write_copy :supply
  end
end
