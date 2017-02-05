# v6.0.0 (2017-02-05)

- Fixed README to mention correct Rails version.
- Fixed Rubocop issues.
- Fixed removal of `app/helpers` directory.
- Added Reek configuration.
- Added Ruby version check to template.
- Added code quality Rake task.
- Updated Gemfile configuration.
- Updated Gemfile with conservative versions.
- Updated Rakefile tasks.
- Updated Rubocop Metrics/LineLength to 100 characters.
- Updated Rubocop Metrics/ParameterLists max to three.
- Updated Rubocop to import from global configuration.
- Updated contributing documentation.
- Updated gem dependencies.
- Updated gems to be alpha-sorted by group.
- Updated gitignore syntax.
- Updated public assets.
- Updated to Ruby 2.4.0.
- Removed Code Climate FIXME engine.
- Removed Jasmine gems.
- Removed Rubocop Style/Documentation check.
- Removed controller spec generation from Rails application.
- Removed documentation for Rails classes.
- Removed jQuery Rails gem.
- Refactored Puma confguration.
- Refactored RSpec configuration.
- Refactored Rake tasks to be loaded from central location.

# v5.0.0 (2016-11-14)

- Fixed application setup.
- Fixed contributing guideline links.
- Fixed development environment settings placement.
- Added "fatal" logging level to test environment.
- Added "listen" gem to development group.
- Added Code Climate engine support.
- Added GitHub issue and pull request templates.
- Added PostgreSQL database support.
- Added Puma restart support.
- Added Rails version detection.
- Added Reek support.
- Added class comments for application record and mailer.
- Added class documentation for Rails channels.
- Added mailer layout templates.
- Added setup and update scripts.
- Added subresource integrity support to application layout.
- Added templates for application stylesheet and JavaScript.
- Added test environment null cache store.
- Updated .gitignore settings.
- Updated GitHub issue and pull request templates.
- Updated Pragmater options.
- Updated README screenshot.
- Updated README versioning documentation.
- Updated RSpec temp directory to use Bundler root path.
- Updated Rakefile require path.
- Updated Rubocop PercentLiteralDelimiters and AndOr styles.
- Updated gem dependencies.
- Updated gem requirements.
- Updated to Code Climate Test Reporter 1.0.0.
- Updated to Code of Conduct, Version 1.4.0.
- Updated to Rails 5.0.0.
- Updated to Rubocop 0.44.
- Updated to Ruby 2.3.1.
- Updated to release branch.
- Removed "home" controller.
- Removed "lib/assets" and "vendor" folders.
- Removed CHANGELOG.md (use CHANGES.md instead).
- Removed JavaScripts channels folder.
- Removed Priscilla gem support.
- Removed database cleaner support.
- Removed frozen string literal pragma from templates.
- Removed inflection initializer documentation.
- Removed requirements from `application.scss`.
- Removed unused Pry gems.
- Refactored RSpec spec helper configuration.
- Refactored SCSS Lint Rake file name.
- Refactored VCR cassettes to "spec/support" folder.

# v4.2.0 (2016-01-18)

- Added Pragmater whitelist to template.
- Added Rubocop Style/StringLiteralsInInterpolation setting.
- Removed RSpec default monkey patching behavior.
- Removed unnecessary words from Git commit message.

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
