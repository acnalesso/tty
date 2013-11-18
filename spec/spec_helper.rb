# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
$: << File.expand_path("../../app", __FILE__)

module Rails
  class << self
    def env; ENV["RAILS_ENV"]; self; end

    def production?
      false
    end

    def backtrace_cleaner
      self
    end

    def version
      "4.0.1"
    end

    def application; self; end

    def root
      File.expand_path("../../", __FILE__)
      self
    end

    def join(args); args; end

  end
end

class ApplicationController

end

require 'active_support'
require 'action_view'

require 'rspec/core'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  # config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end
