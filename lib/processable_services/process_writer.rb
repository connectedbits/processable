# frozen_string_literal: true

module ProcessableServices
  class ProcessWriter < ApplicationService
    PROCESS_WRITER_BIN = File.expand_path(File.dirname(__FILE__)) + "/process_writer.js"

    def initialize(moddle)
      super()
      @moddle = moddle
    end

    def call
      command = [PROCESS_WRITER_BIN, @moddle].shelljoin
      result = `#{command}`
      JSON.parse(result)
    end

    private

    def write_moddle(key, moddle)
      File.open("#{key}.json","w") do |f|
        f.write(moddle.to_json)
      end
    end
  end
end
