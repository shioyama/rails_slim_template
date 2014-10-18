# v2.0.0 (2014-10-18)

- Removed deprecated RSpec settings.
- Removed the Capistrano gem.
- Updated to Ruby 2.1.3.
- Updated spec helper to use ActiveRecord::Migration.maintain_test_schema! instead of
  ActiveRecord::Migration.check_pending!
- Updated Gemfile to be less restictive of gem versions.
- Updated CONTRIBUTING guidelines and documentation.
- Updated default language to be en instead of en-US.
- Updated application layout with better defaults.
- Updated RSpec config to verify partial doubles.
- Updated RSpec Rails config kit to infer spec type from file location.
- Added "config.assets.debug = true" to development.rb.
- Added email settings to development.rb.
- Added the [Poltergeist](https://github.com/teampoltergeist/poltergeist) gem.
- Added the [Jasmine](http://jasmine.github.io) gem.
- Added the [rspec-html-matchers](https://github.com/kucaahbe/rspec-html-matchers) gem.
- Added version information for sass-rails gem.
- Added errors for translations (and RSpec support).
- Added exceptions to development and test environments when a controller receives unauthorized parameters for enhanced
  debugging.
- Added RSpec chain clause expectation to spec helper.
- Refactored RSpec setup into extensions and kit configurations.
- Refactored Rails specific configuration to RSpec Rails helper.

# v1.2.0 (2014-05-18)

- Refactored the "download_file" method to use the native Thor "get" method instead.
- Updated to Ruby 2.1.2.
- Updated the Gemfile to use typhoeus instead of the webmock gem.
- Added the [Priscilla](https://github.com/Arkham/priscilla) gem.
- Added clearing of Typhoeus expectations before each RSpec spec.
- Added RSpec configuration to always use "expect" syntax.
- Added RSpec helper and FactoryGirl initialization support.

# v1.1.0 (2014-04-15)

- Updated to MRI 2.1.1.
- Updated to Rails 4.1.0.
- Added Gemfile version requirements.
- Added several development and test-specific gems.
- Added the README.md file to template generation.
- Added RSpec setup.

# v1.0.0 (2013-09-22)

- Initial version.
