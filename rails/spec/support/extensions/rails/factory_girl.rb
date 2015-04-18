RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before :suite do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
      FactoryGirl.reload
    ensure
      DatabaseCleaner.clean
    end
  end
end
