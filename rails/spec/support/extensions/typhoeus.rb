RSpec.configure do |config|
  config.before { Typhoeus::Expectation.clear }
end
