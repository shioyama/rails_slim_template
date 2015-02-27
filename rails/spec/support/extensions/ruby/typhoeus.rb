RSpec.configure do |config|
  config.before { Typhoeus::Expectation.clear }
end

VCR.configure do |config|
  config.hook_into :typhoeus
end
