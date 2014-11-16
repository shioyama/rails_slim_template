RSpec.configure do |config|
  config.before(:suite) { DatabaseCleaner.clean_with :truncation }

  config.before do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.before(js: true) { DatabaseCleaner.strategy = :truncation }
  config.after { DatabaseCleaner.clean }
end
