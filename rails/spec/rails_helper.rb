# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)

require "spec_helper"
require "rspec/rails"
require "capybara/rails"
require "capybara/poltergeist"

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include AbstractController::Translation
  config.include ActiveSupport::Testing::TimeHelpers
  config.include ActiveJob::TestHelper, type: :job
  config.include FactoryGirl::Syntax::Methods
  config.infer_spec_type_from_file_location!

  config.before :suite do
    Rails.application.load_tasks

    FactoryGirl.lint
    FactoryGirl.reload

    Capybara.default_wait_time = 120 if ENV["CI"].present?
    Capybara.asset_host = "http://localhost:3000"
    Capybara.javascript_driver = :poltergeist
    Capybara.register_driver :poltergeist do |app|
      timeout = ENV["CI"].present? ? 120 : 30

      options = {
        js_errors: true,
        timeout: timeout,
        phantomjs_options: ["--local-to-remote-url-access=true"]
      }

      Capybara::Poltergeist::Driver.new app, options
    end
  end

  config.after js: true do
    Capybara.reset_sessions!
    page.driver.reset!
  end
end
