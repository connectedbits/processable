# frozen_string_literal: true
require "test_helper"

class ProcessableTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert Processable::VERSION
  end
end
