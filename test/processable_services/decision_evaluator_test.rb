# frozen_string_literal: true
require "test_helper"

module ProcessableServices
  describe DecisionEvaluator do
    describe(:example_one) do
      let(:source) { fixture_source("dish.dmn") }
      let(:decision_name) { "Dish" }

      describe :evaluate do
        let(:context) {
          {
            season: "Spring",
            guests: 7,
          }
        }
        let(:result) { DecisionEvaluator.call(decision_name, source, context) }

        it "should correctly parse and eval a dmn rule" do
          _(result["dish"]).must_equal "Steak"
        end
      end
    end

    describe(:example_two) do
      let(:source) { fixture_source("choose_greeting.dmn") }
      let(:decision_name) { "ChooseGreeting" }

      describe :evaluate do
        let(:context) {
          {
            language: "fr",
            formal:   true,
          }
        }
        let(:result) { DecisionEvaluator.call(decision_name, source, context) }

        it "should correctly parse and eval a dmn rule" do
          _(result["greeting"]).must_equal "Bonjour"
        end
      end
    end
  end
end
