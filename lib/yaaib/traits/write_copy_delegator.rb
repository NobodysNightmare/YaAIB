require 'delegate'
require 'yaaib/vector'

module YaAIB
  class WriteCopyDelegator < ::SimpleDelegator
    def self.write_copy(*methods)
      methods.each do |method|
        class_eval(<<-Ruby
          def #{method}
            return @#{method}_copy if defined? @#{method}_copy
            super
          end

          def #{method}=(value)
            @#{method}_copy = value
          end
        Ruby
        )
      end
    end
  end
end
