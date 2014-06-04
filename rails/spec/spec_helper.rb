ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/autorun"
require "rspec/rails"
require "capybara/rails"
require "capybara-extensions"
require "capybara/poltergeist"
require "vcr"
require "pry"
require "pry-byebug"
require "pry-remote"
require "pry-rescue"
require "pry-stack_explorer"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |file| require file }

ActiveRecord::Migration.maintain_test_schema!

VCR.configure do |cassette|
  cassette.cassette_library_dir = "spec/cassettes"
  cassette.hook_into :typhoeus
  cassette.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.include RSpec::Helpers
  config.include FactoryGirl::Syntax::Methods

  config.expect_with(:rspec) { |expectation| expectation.syntax = :expect }
  config.run_all_when_everything_filtered = true
  config.filter_run focus: true
  config.order = "random"
  config.infer_base_class_for_anonymous_controllers = false

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    FactoryGirl.lint
    Capybara.javascript_driver = :poltergeist
    Capybara.asset_host = "http://localhost:3000"
  end

  config.before(:all) { GC.disable }
  config.after(:all) { GC.enable }

  config.before(:each) { DatabaseCleaner.strategy = :transaction }
  config.before(:each, js: true) { DatabaseCleaner.strategy = :truncation }

  config.before :each do
    DatabaseCleaner.start
    Typhoeus::Expectation.clear
  end

  config.after(:each) { DatabaseCleaner.clean }
end
