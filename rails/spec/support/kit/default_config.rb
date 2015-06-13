RSpec.configure do |config|
  config.order = "random"
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.infer_spec_type_from_file_location!
  config.example_status_persistence_file_path = "./tmp/rspec/examples.txt"

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end
