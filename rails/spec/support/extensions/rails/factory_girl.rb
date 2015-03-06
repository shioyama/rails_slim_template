RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) { FactoryGirl.lint }
  config.before { FactoryGirl.reload }
end
