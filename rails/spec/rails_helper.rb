ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)

require "spec_helper"
require "rspec/rails"

Dir[File.join(File.dirname(__FILE__), "support/extensions/rails/**/*.rb")].each { |file| require file }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include AbstractController::Translation
  config.include ActiveSupport::Testing::TimeHelpers
  config.include ActiveJob::TestHelper, type: :job
  config.infer_spec_type_from_file_location!
end
