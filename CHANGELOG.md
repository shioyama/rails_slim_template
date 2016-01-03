# v4.1.0 (2016-01-02)

- Added [Pragmater](https://github.com/bkuhlmann/pragmater) support.
- Added [Tocer](https://github.com/bkuhlmann/tocer) support.
- Updated README with Tocer generated Table of Contents.
- Updated template to use "release" branch.
- Updated to Ruby 2.3.0.

# v4.0.0 (2015-11-06)

- Fixed Factory Girl reloading so it only happens before a suite.
- Fixed README typos.
- Fixed RSpec Kit feature helpers.
- Fixed VCR re-record interval to be seconds.
- Fixed template referencing old garbage collection file.
- Fixed template root for initializers.
- Added API inflection so API namespaces and routes will load.
- Added ActiveSupport time helpers to the Rails helper.
- Added Patreon badge to README.
- Added Priscilla initializer.
- Added Puma configuration.
- Added RSpec Rails ActiveJob configuration.
- Added RSpec Rails Rake tasks configuration.
- Added Rakefile default tasks for RSpec and Rubocop.
- Added Rubocop support.
- Added [Code Climate](https://github.com/codeclimate/ruby-test-reporter) gem.
- Added [Milestoner](https://github.com/bkuhlmann/milestoner) gem.
- Added [Rails Best Practices](http://rails-bestpractices.com).
- Added [SCSS Lint](https://github.com/brigade/scss-lint) support.
- Added [Pry State](https://github.com/SudhagarS/pry-state) support.
- Added application screenshot to README.
- Added code of conduct documentation.
- Added project name to README.
- Added table of contents to README.
- Added the [Puma](http://puma.io) gem requirement.
- Updated Capybara RSpec default settings (including Poltergeist).
- Updated Code of Conduct 1.3.0.
- Updated Gemfile to use RSpec 3.3.x or higher.
- Updated RSpec Factory Girl configuration to use Database Cleaner.
- Updated RSpec Factory Girl to reload before the suite is run.
- Updated RSpec Kit "also" helper to only be included in feature specs.
- Updated RSpec configuration to persist example statuses.
- Updated RSpec database cleaner configuration.
- Updated RSpec default config to profile top five examples.
- Updated RSpec kit helpers and contexts to use Kit module.
- Updated RSpec support kit with new Gemsmith changes.
- Updated VCR default settings.
- Updated database.yml to use DB_POOL ENV for pool settings.
- Updated development environment to disable asset debugging.
- Updated gem install order for puma and launchy gems.
- Updated template to apply quiet Bundler installs.
- Updated template to apply quiet Git commits.
- Updated to Code of Conduct 1.2.0.
- Updated to Ruby 2.2.3.
- Removed GitTip badge from README.
- Removed RSpec Typhoeus support.
- Removed RSpec garbage collection support.
- Removed Spring support.
- Removed commented RSpec configuration code.
- Removed default RSpec configuration.
- Removed generation of application.css.
- Removed humans.txt from public folder.
- Removed the Capybara extensions gem requirement.
- Removed the RSpec Matchers gem requirement.
- Removed the Timecop gem.
- Removed unnecessary exclusions from .gitignore.
- Refactored RSpec Ruby/Rails extension requirements to distinct files.
- Refactored RSpec extension support from "core" to "ruby" folder.
- Refactored Rails helper RSpec config include order.

# v3.0.0 (2014-12-29)

- Updated to Ruby 2.2.0.
- Updated to Rails 4.2.x.
- Updated spec helper to comment custom config until needed.
- Added [Jasmine jQuery Rails](https://github.com/travisjeffery/jasmine-jquery-rails) gem.
- Added application.js to Jasmine source files.
- Added the [Climate Control](https://github.com/thoughtbot/climate_control) gem.
- Refactored RSpec use of `pending` to be `skip` instead.
- Refactored RSpec `it_also` helper to simply `also`.
- Refactored RSpec support extensions into core and rails specific extensions.

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
