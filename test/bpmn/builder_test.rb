# frozen_string_literal: true
require "test_helper"

module Bpmn
  describe Builder do
    let(:source) { fixture_source("execution_test.bpmn") }
    let(:moddle) { ProcessableServices::ProcessReader.call(source) }
    let(:builder) { Builder.new(moddle) }
    let(:process) { builder.process_by_id("Process") }

    it "should parse the process" do
      #File.write('moddle.json', moddle.to_json)
      _(process).wont_be_nil
    end
  end
end
