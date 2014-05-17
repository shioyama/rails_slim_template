module RSpec
  module Helpers
    def it_also message
      block_given? ? yield : pending(message)
    end
  end
end
