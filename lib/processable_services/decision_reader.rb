# frozen_string_literal: true

module ProcessableServices
  class DecisionReader < ApplicationService
    DECISION_READER_BIN = File.expand_path(File.dirname(__FILE__)) + "/decision_reader.js"

    def initialize(source)
      super()
      @source = source
    end

    def call
      command = [DECISION_READER_BIN, @source].shelljoin
      result = `#{command}`
      JSON.parse(result)
    end
  end
end
