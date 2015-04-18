RSpec.configure do |config|
  config.before(:suite) { Rails.application.load_tasks }
end
