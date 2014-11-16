module RSpec
  module Helpers
    def also message
      block_given? ? yield : skip(message)
    end
  end
end

RSpec.configure do |config|
  config.include RSpec::Helpers
end
