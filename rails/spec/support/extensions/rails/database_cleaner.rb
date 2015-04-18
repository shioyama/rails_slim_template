RSpec.configure do |config|
  config.before(:suite) { DatabaseCleaner.clean_with :truncation }
  config.before { DatabaseCleaner.strategy = :transaction }

  config.before type: :feature do
    if Capybara.current_driver == :rack_test
      # The Rack driver shares the app's database connection so the transaction strategy can be used for speed.
      DatabaseCleaner.strategy = :transaction
    else
      # Other drivers (generally JavaScript related) don't share the database connection so truncation is required.
      DatabaseCleaner.strategy = :truncation
    end
  end

  config.before { DatabaseCleaner.start }
  config.after { DatabaseCleaner.clean }
end
