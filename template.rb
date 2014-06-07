SLIM_TEMPLATE_NAME = "Rails Slim Template"
SLIM_TEMPLATE_ROOT = "https://raw.github.com/bkuhlmann/rails_slim_template/master"

# Ruby Version Management
get "#{SLIM_TEMPLATE_ROOT}/rails/ruby-version.txt", ".ruby-version"

# Bundler
get "#{SLIM_TEMPLATE_ROOT}/rails/Gemfile", "Gemfile"
run "bundle install"
run "spring stop"
generate "rspec:install --skip"
run "bundle exec spring binstub --all"

# Configuration -- Database
get "#{SLIM_TEMPLATE_ROOT}/rails/config/database.yml", "config/database.yml"

# Configuration -- Stage
run "cp config/environments/production.rb config/environments/stage.rb"

# Configuration -- Application
application_delta = "config/application.delta.rb"
get("#{SLIM_TEMPLATE_ROOT}/rails/config/application.delta.rb", application_delta)
insert_into_file "config/application.rb", open(application_delta).read, after: "  # config.i18n.default_locale = :de\n"
remove_file application_delta
gsub_file "config/application.rb", /# config.time_zone = \'Central Time \(US & Canada\)\'/, "config.time_zone = \"UTC\""
gsub_file "config/application.rb", /# config.i18n.default_locale = :de/, "config.i18n.default_locale = \"en-US\""
insert_into_file "config/environments/development.rb", "  config.action_mailer.smtp_settings = {address: \"localhost\", port: 1025}\n", after: "  config.action_mailer.raise_delivery_errors = false\n"
insert_into_file "config/environments/development.rb", "  config.action_mailer.delivery_method = :smtp\n", after: "  config.action_mailer.raise_delivery_errors = false\n"
insert_into_file "config/environments/development.rb", "\n  # Generate digests for assets URLs.\n  config.assets.digest = true\n", after: "  config.assets.debug = true\n"

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
get "#{SLIM_TEMPLATE_ROOT}/rails/rspec.txt", ".rspec"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/support/rspec_helpers.rb", "spec/support/rspec_helpers.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/spec_helper.rb", "spec/spec_helper.rb"
create_file "spec/factories.rb"

# Git
git :init
get "#{SLIM_TEMPLATE_ROOT}/rails/gitignore.txt", ".gitignore"
git add: '.', commit: "-n -a -m \"Added the #{SLIM_TEMPLATE_NAME}.\""

# End
say_status :end, "#{SLIM_TEMPLATE_NAME} Complete!"
