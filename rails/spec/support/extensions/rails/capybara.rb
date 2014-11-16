RSpec.configure do |config|
  config.before(:suite) do
    Capybara.javascript_driver = :poltergeist
    Capybara.asset_host = "http://localhost:3000"
  end
end
