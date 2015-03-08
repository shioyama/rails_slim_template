require "capybara/rails"
require "capybara-extensions"
require "capybara/poltergeist"

RSpec.configure do |config|
  config.before(:suite) do
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
