module Qmt
  module Pipelines
    module Worker
      Classes = []

      # This module will be extended to the class directly so that we can use these
      # Functions directly in our extended pipeline
      module ClassMethods
        def chain_as(name)
          Qmt::Pipelines.AddWorker(name.to_s, klass)
        end
      end

      def self.included(base)
        base.extend ClassMethods
        Classes << base if base.is_a? Class
      end
    end
  end
end
