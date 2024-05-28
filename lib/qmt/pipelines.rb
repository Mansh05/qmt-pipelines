# frozen_string_literal: true

require_relative "pipelines/version"
require_relative 'pipelines/errors'

module Qmt
  module Pipelines
    include Errors
    # All the workers that are registered withing the project or process are stored in this class
    # variable. This way we can maintain the state of the workers.
    @@workers = {}

    # We will add workers to the class variable and if already present, we will raise an error.
    # name string, klass A worker Class
    def AddWorker(name, klass)
      raise Qmt::Pipelines::WorkerAlreadyPresent unless @@workers[name].nil?

      @@workers[name] = {
        name: name,
        klass: klass
      }
    end

    # Get the worker from list of workers, if not found, will raise an error
    def GetWorker(name)
      raise Qmt::Pipelines::WorkerNotFoundError if @@workers[name].nil?

      @@workers[name]
    end
  end
end

