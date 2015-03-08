module RSpec
  module Kit
    module Helpers
      def also message
        block_given? ? yield : skip(message)
      end
    end
  end
end

RSpec.configure do |config|
  config.include RSpec::Kit::Helpers type: :feature
end
