SLIM_TEMPLATE_NAME = "Rails Slim Template"
SLIM_TEMPLATE_ROOT = "https://raw.github.com/bkuhlmann/rails_slim_template/master"

# Ruby Version Management
get "#{SLIM_TEMPLATE_ROOT}/rails/ruby-version.txt", ".ruby-version"

# Bundler
get "#{SLIM_TEMPLATE_ROOT}/rails/Gemfile", "Gemfile"
run "bundle install"
generate "rspec:install --skip"
generate "jasmine:install"

# Configuration - Initializers
get "#{SLIM_TEMPLATE_ROOT}/rails/config/initializers/inflections.rb", "config/initializers/inflections.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/config/initializers/priscilla.rb", "config/initializers/priscilla.rb"

# Configuration -- Database
get "#{SLIM_TEMPLATE_ROOT}/rails/config/database.yml", "config/database.yml"

# Configuration -- Application
application_delta = "config/application.delta.rb"
get("#{SLIM_TEMPLATE_ROOT}/rails/config/application.delta.rb", application_delta)
insert_into_file "config/application.rb", open(application_delta).read, after: "  # config.i18n.default_locale = :de\n"
remove_file application_delta
gsub_file "config/application.rb", /# config.time_zone = \'Central Time \(US & Canada\)\'/, "config.time_zone = \"UTC\""
gsub_file "config/application.rb", /# config.i18n.default_locale = :de/, "config.i18n.default_locale = :en"
insert_into_file "config/environments/development.rb", "  config.action_mailer.smtp_settings = {address: \"localhost\", port: 1025}\n", after: "  config.action_mailer.raise_delivery_errors = false\n"
insert_into_file "config/environments/development.rb", "  config.action_mailer.delivery_method = :smtp\n", after: "  config.action_mailer.raise_delivery_errors = false\n"

# Configuration -- Stage
run "cp config/environments/production.rb config/environments/stage.rb"

# Configuration - Development
uncomment_lines "config/environments/development.rb", /config.action_view.raise_on_missing_translations/
insert_into_file "config/environments/development.rb", "\n  # Raise error when receiving unauthorized parameters.\n", after: "config.action_controller.perform_caching = false\n"
insert_into_file "config/environments/development.rb", "  config.action_controller.action_on_unpermitted_parameters = :raise\n", after: "# Raise error when receiving unauthorized parameters.\n"

# Configuration - Test
uncomment_lines "config/environments/test.rb", /config.action_view.raise_on_missing_translations/
insert_into_file "config/environments/test.rb", "\n  # Raise error when receiving unauthorized parameters.\n", after: "config.action_controller.allow_forgery_protection = false\n"
insert_into_file "config/environments/test.rb", "  config.action_controller.action_on_unpermitted_parameters = :raise\n", after: "# Raise error when receiving unauthorized parameters.\n"

# Configuration -- Secrets
get "#{SLIM_TEMPLATE_ROOT}/rails/config/secrets.yml", "config/secrets.yml"
get "#{SLIM_TEMPLATE_ROOT}/rails/env.txt", ".env"
run "echo \"SECRET_KEY_BASE=$(bin/rake secret)\" >> .env"

# Controllers
insert_into_file "app/controllers/application_controller.rb", "  helper :all\n", after: "class ApplicationController < ActionController::Base\n"
get "#{SLIM_TEMPLATE_ROOT}/rails/app/controllers/home_controller.rb", "app/controllers/home_controller.rb"

# Routes
route "resource :home, controller: \"home\""
route "root \"home#show\""

# Helpers
remove_file "app/helpers/application_helper.rb"

# Views
remove_file "app/views/layouts/application.html.erb"
get "#{SLIM_TEMPLATE_ROOT}/rails/app/views/layouts/application.html.slim", "app/views/layouts/application.html.slim"
get "#{SLIM_TEMPLATE_ROOT}/rails/app/views/home/show.html.slim", "app/views/home/show.html.slim"

# Images
remove_file "app/assets/images/rails.png"
get "#{SLIM_TEMPLATE_ROOT}/rails/public/apple-touch-icon-114x114.png", "public/apple-touch-icon-114x114.png"
get "#{SLIM_TEMPLATE_ROOT}/rails/public/apple-touch-icon.png", "public/apple-touch-icon.png"
get "#{SLIM_TEMPLATE_ROOT}/rails/public/favicon.ico", "public/favicon.ico"

# JavaScripts
gsub_file "app/assets/javascripts/application.js", /\/\/= require turbolinks\n/, ''

# Doc
remove_file "README.rdoc"
get "#{SLIM_TEMPLATE_ROOT}/rails/README.md", "README.md"
get "#{SLIM_TEMPLATE_ROOT}/rails/public/humans.txt", "public/humans.txt"

# Specs
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/support/extensions/ruby/pry.rb", "spec/support/extensions/ruby/pry.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/support/extensions/ruby/vcr.rb", "spec/support/extensions/ruby/vcr.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/support/extensions/rails/capybara.rb", "spec/support/extensions/rails/capybara.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/support/extensions/rails/database_cleaner.rb", "spec/support/extensions/rails/database_cleaner.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/support/extensions/rails/factory_girl.rb", "spec/support/extensions/rails/factory_girl.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/support/extensions/rails/rake.rb", "spec/support/extensions/rails/rake.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/support/kit/default_config.rb", "spec/support/kit/default_config.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/support/kit/helpers.rb", "spec/support/kit/helpers.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/support/kit/stderr.rb", "spec/support/kit/stderr.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/support/kit/stdout.rb", "spec/support/kit/stdout.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/support/kit/temp_dir.rb", "spec/support/kit/temp_dir.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/rails_helper.rb", "spec/rails_helper.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/spec_helper.rb", "spec/spec_helper.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/javascripts/support/jasmine.yml", "spec/javascripts/support/jasmine.yml"
create_file "spec/factories.rb"

# Git
git :init
get "#{SLIM_TEMPLATE_ROOT}/rails/gitignore.txt", ".gitignore"
git add: '.', commit: "-n -a -m \"Added the #{SLIM_TEMPLATE_NAME}.\""

# End
say_status :end, "#{SLIM_TEMPLATE_NAME} Complete!"
