require "vcr"

VCR.configure do |config|
  config.default_cassette_options = {
    record: :new_episodes,
    re_record_interval: 604_800 # 7 days in seconds (60 * 60 * 24 * 7).
  }
  config.cassette_library_dir = "spec/cassettes"
  config.ignore_localhost = true
  config.configure_rspec_metadata!
end
