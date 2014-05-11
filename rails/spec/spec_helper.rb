ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/autorun"
require "rspec/rails"
require "capybara/rails"
require "capybara-extensions"
require "vcr"
require "pry"
require "pry-byebug"
require "pry-remote"
require "pry-rescue"
require "pry-stack_explorer"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |file| require file }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

VCR.configure do |cassette|
  cassette.cassette_library_dir = "spec/cassettes"
  cassette.hook_into :typhoeus
  cassette.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.expect_with(:rspec) { |expectation| expectation.syntax = :expect }
  config.run_all_when_everything_filtered = true
  config.filter_run focus: true
  config.order = "random"
  config.infer_base_class_for_anonymous_controllers = false

  config.before(:suite) { DatabaseCleaner.clean_with :truncation }

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
