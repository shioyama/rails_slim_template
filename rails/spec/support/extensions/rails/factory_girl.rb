RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before :suite do
    FactoryGirl.lint
    FactoryGirl.reload
  end
end
