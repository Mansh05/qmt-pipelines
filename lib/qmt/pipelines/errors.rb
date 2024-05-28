module Qmt
  module Pipelines
    module Errors
      class Error < StandardError; end

      class WorkerNotFoundError < StandardError
        def initialize(msg = 'Worker Not present')
          super
        end
      end

      class WorkerAlreadyPresent < StandardError
        def initialize(msg = 'Worker Already Present, Cannot add Worker with the same name')
          super
        end
      end
    end
  end
end
