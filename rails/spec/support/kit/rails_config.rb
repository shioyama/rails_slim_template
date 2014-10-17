RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.include AbstractController::Translation
end
