# frozen_string_literal: true

module Processable
  class ExecutionError < StandardError
    attr_reader :execution

    def initialize(msg, execution: nil)
      @execution = execution
      super(msg)
    end
  end
end
