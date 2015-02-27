require "vcr"

VCR.configure do |config|
  config.default_cassette_options = {
    record: :new_episodes,
    re_record_interval: 7.days
  }
  config.cassette_library_dir = "spec/cassettes"
  config.ignore_localhost = true
  config.configure_rspec_metadata!
end
