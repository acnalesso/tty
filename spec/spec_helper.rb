module Extra
  class << self

    def require_files(files)
      rails_files_joiner(files).each { |f| require f }
    end

    def load_files(files)
      rails_files_joiner(files).each { |f| load f }
    end

    def rails_routes
      Rails.application.routes.url_helpers
    end

    # this file path is the default
    def expand_path(path)
      File.expand_path("../#{path.to_s}", __FILE__)
    end

  private
    def rails_files_joiner(files)
      Dir[Rails.root.join(files)]
    end

  end
end

require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)

  require 'rspec/autorun'
  require 'capybara/rspec'
  require 'capybara/rails'


  Extra.require_files('spec/support/**/*.rb')

  RSpec.configure do |c|
    c.order = "random"
    c.include Features::Helpers, type: :feature

    c.treat_symbols_as_metadata_keys_with_true_values = true
    c.run_all_when_everything_filtered = true

    c.include(Extra.rails_routes)

  end
end

Spork.each_run do
  #'reloads' routes.rb - work around
  Extra.load_files('config/routes.rb')

  Extra.load_files('spec/support/**/*.rb')

end
