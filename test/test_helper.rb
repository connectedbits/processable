# frozen_string_literal: true

GEM_ROOT = File.join(File.dirname(__FILE__), "..")

require_relative "../lib/processable"

require "minitest/autorun"
require "minitest/reporters"
require "minitest-spec-rails"
require "active_support/testing/time_helpers"

Time.zone_default = Time.find_zone!("UTC")

Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new(color: true),
    ENV,
    Minitest.backtrace_filter,
)

class Minitest::Spec
  include ActiveSupport::Testing::TimeHelpers

  before :each do
  end

  after :each do
  end

  def fixture_source(filename)
    File.read(File.join(GEM_ROOT, "/test/fixtures/files", filename))
  end
end
