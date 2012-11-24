ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  #fixtures :composers

  # Add more helper methods to be used by all tests here...

  # fixes to drop all data in mongodb after each test
  def teardown
    Mongoid.default_session.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
  def inherited(base)
    base.define_method teardown do
      super
    end
  end
end
