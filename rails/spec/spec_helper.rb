require "capybara-extensions"
require "capybara/poltergeist"
require "vcr"
require "pry"
require "pry-byebug"
require "pry-remote"
require "pry-rescue"
require "pry-stack_explorer"

Dir[File.join(File.dirname(__FILE__), "support/extensions/**/*.rb")].each { |file| require file }
Dir[File.join(File.dirname(__FILE__), "support/kit/**/*.rb")].each { |file| require file }

RSpec.configure do |config|
  # NOTE: Add app specific configuration here. For the default configuration, see the "support" folder.
end
