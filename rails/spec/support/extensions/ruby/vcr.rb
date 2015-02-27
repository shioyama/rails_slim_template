require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.configure_rspec_metadata!
end
