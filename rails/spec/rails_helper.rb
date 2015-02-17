ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)

require "spec_helper"
require "rspec/rails"
require "capybara/rails"
require "capybara-extensions"
require "capybara/poltergeist"

Dir[File.join(File.dirname(__FILE__), "support/extensions/rails/**/*.rb")].each { |file| require file }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include AbstractController::Translation
  config.include ActiveSupport::Testing::TimeHelpers
  config.infer_spec_type_from_file_location!
end
