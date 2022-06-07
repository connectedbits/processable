# frozen_string_literal: true
require "test_helper"

module ProcessableServices
  describe FeelEvaluator do
    let(:service) { FeelEvaluator }

    describe :arithmetic do
      let(:expression) { "a + b + c" }
      let(:variables) { { a: 3, b: -1, c: 10 } }
      let(:result) { service.call(expression: expression, variables: variables) }

      it "should do math" do
        _(result).must_equal(12)
      end
    end

    describe :value do
      let(:expression) { "name" }
      let(:variables) { { name: "Eric" } }
      let(:result) { service.call(expression: expression, variables: variables) }

      it "should return value" do
        _(result).must_equal("Eric")
      end
    end
  end
end
