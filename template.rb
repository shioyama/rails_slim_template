# frozen_string_literal: true

require "open-uri"

SLIM_TEMPLATE_NAME = "Rails Slim Template"
SLIM_TEMPLATE_ROOT = "https://raw.github.com/bkuhlmann/rails_slim_template/release"

# Gemfile
get "#{SLIM_TEMPLATE_ROOT}/rails/Gemfile", "Gemfile"

# Ruby Version Management
get "#{SLIM_TEMPLATE_ROOT}/rails/ruby-version.txt", ".ruby-version"

# Bundler
run "bundle install --quiet"

# Ruby Version Check
say_status(:error, "Invalid Ruby version. Use: 2.4.x.", :red) and abort unless RUBY_VERSION.match?(/2\.4\.\d+/)

# Rails Version Check
say_status(:error, "Invalid Rails version. Use: 5.x.x.", :red) and abort unless `rails -v`.match?(/Rails\s5.*/)

# Bin
get "#{SLIM_TEMPLATE_ROOT}/rails/bin/setup", "bin/setup"
run "cp bin/setup bin/update"

# Configuration - Initializers
get "#{SLIM_TEMPLATE_ROOT}/rails/config/initializers/inflections.rb", "config/initializers/inflections.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/config/initializers/backtrace_silencers.rb", "config/initializers/backtrace_silencers.rb"

# Configuration - Boot
insert_into_file "config/boot.rb", open("#{SLIM_TEMPLATE_ROOT}/rails/config/boot.delta.rb").read, after: %(require "bundler/setup" # Set up gems listed in the Gemfile.\n)

# Configuration - Secrets
get "#{SLIM_TEMPLATE_ROOT}/rails/config/secrets.yml", "config/secrets.yml"
get "#{SLIM_TEMPLATE_ROOT}/rails/env.txt", ".env"
run "echo \"SECRET_KEY_BASE=$(bin/rake secret)\" >> .env"

# Configuration - Database
get "#{SLIM_TEMPLATE_ROOT}/rails/config/database.yml", "config/database.yml"

# Configuration - Application
insert_into_file "config/application.rb", open("#{SLIM_TEMPLATE_ROOT}/rails/config/application.delta.rb").read, after: "    # -- all .rb files in that directory are automatically loaded.\n"

# Configuration - Stage
run "cp config/environments/production.rb config/environments/stage.rb"

# Configuration - Development
insert_into_file "config/environments/development.rb", "  config.action_mailer.smtp_settings = {address: \"localhost\", port: 1025}\n", after: "  config.action_mailer.raise_delivery_errors = false\n"
insert_into_file "config/environments/development.rb", "  config.action_mailer.delivery_method = :smtp\n", after: "  config.action_mailer.raise_delivery_errors = false\n"
uncomment_lines "config/environments/development.rb", /config.action_view.raise_on_missing_translations/
insert_into_file "config/environments/development.rb", "  config.action_controller.action_on_unpermitted_parameters = :raise\n", after: "config.consider_all_requests_local = true\n"
insert_into_file "config/environments/development.rb", "\n  # Raise error when receiving unauthorized parameters.\n", after: "config.consider_all_requests_local = true\n"
gsub_file "config/environments/development.rb", %('tmp/caching-dev.txt'), %("tmp", "caching-dev.txt")

# Configuration - Test
uncomment_lines "config/environments/test.rb", /config.action_view.raise_on_missing_translations/
insert_into_file "config/environments/test.rb", "\n  # Raise error when receiving unauthorized parameters.\n", after: "config.action_controller.allow_forgery_protection = false\n"
insert_into_file "config/environments/test.rb", "  config.action_controller.action_on_unpermitted_parameters = :raise\n", after: "# Raise error when receiving unauthorized parameters.\n"
insert_into_file "config/environments/test.rb", "  config.cache_store = :null_store\n", after: "config.action_controller.perform_caching = false\n"
insert_into_file "config/environments/test.rb", "\n  config.log_level = :fatal\n", after: "config.action_view.raise_on_missing_translations = true\n"

# Configuration - Puma
get "#{SLIM_TEMPLATE_ROOT}/rails/config/puma.rb", "config/puma.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/Procfile", "Procfile"

# Database
get "#{SLIM_TEMPLATE_ROOT}/rails/db/migrate/20170101000000_enable_uuid_extension.rb", "db/migrate/20170101000000_enable_uuid_extension.rb"
create_file "db/seeds.rb"

# Helpers
remove_file "app/helpers"

# Views
remove_file "app/views/layouts/application.html.erb"
remove_file "app/views/layouts/mailer.html.erb"
remove_file "app/views/layouts/mailer.text.erb"
get "#{SLIM_TEMPLATE_ROOT}/rails/app/views/layouts/application.html.slim", "app/views/layouts/application.html.slim"
get "#{SLIM_TEMPLATE_ROOT}/rails/app/views/layouts/mailer.html.slim", "app/views/layouts/mailer.html.slim"
get "#{SLIM_TEMPLATE_ROOT}/rails/app/views/layouts/mailer.text.slim", "app/views/layouts/mailer.text.slim"

# Webpacker
run "rails webpacker:install"

# Stylesheets
remove_file "app/assets/stylesheets/application.css"
get "#{SLIM_TEMPLATE_ROOT}/rails/app/assets/stylesheets/application.scss", "app/assets/stylesheets/application.scss"

# JavaScripts
get "#{SLIM_TEMPLATE_ROOT}/rails/app/assets/javascripts/application.js", "app/assets/javascripts/application.js"
get "#{SLIM_TEMPLATE_ROOT}/rails/app/javascript/packs/application.js", "app/javascript/packs/application.js"

# Images
remove_file "app/assets/images/rails.png"
get "#{SLIM_TEMPLATE_ROOT}/rails/public/apple-touch-icon-114x114.png", "public/apple-touch-icon-114x114.png"
get "#{SLIM_TEMPLATE_ROOT}/rails/public/apple-touch-icon.png", "public/apple-touch-icon.png"
get "#{SLIM_TEMPLATE_ROOT}/rails/public/favicon.ico", "public/favicon.ico"

# Doc
remove_file "README.rdoc"
get "#{SLIM_TEMPLATE_ROOT}/rails/README.md", "README.md"
run "tocer --generate"

# Lib
remove_dir "lib/assets"

# Vendor
remove_dir "vendor"

# Specs
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/support/shared_contexts/temp_dir.rb", "spec/support/shared_contexts/temp_dir.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/rails_helper.rb", "spec/rails_helper.rb"
get "#{SLIM_TEMPLATE_ROOT}/rails/spec/spec_helper.rb", "spec/spec_helper.rb"
create_file "spec/factories.rb"

# Code Quality
get "#{SLIM_TEMPLATE_ROOT}/rails/codeclimate.yml", ".codeclimate.yml"
get "#{SLIM_TEMPLATE_ROOT}/rails/reek", ".reek"
get "#{SLIM_TEMPLATE_ROOT}/rails/rubocop.yml", ".rubocop.yml"
run "rubocop --auto-correct > /dev/null"

# Rake
get "#{SLIM_TEMPLATE_ROOT}/rails/Rakefile", "Rakefile"

# Pragma
run %(pragmater --add . --comments "# frozen_string_literal: true" --whitelist "Gemfile" "Guardfile" "Rakefile" "config.ru" "bin/**/*" ".gemspec" ".rake" ".rb")

# Workarounds
insert_into_file "bin/webpack", "  # rubocop:disable Security/YAMLLoad\n", after: "begin\n"
insert_into_file "bin/webpack-dev-server", "  # rubocop:disable Security/YAMLLoad\n", after: "begin\n"
gsub_file "bin/webpack", "YAML.safe_load", "YAML.load"
gsub_file "bin/webpack-dev-server", "YAML.safe_load", "YAML.load"

# Git
git init: "--quiet"
get "#{SLIM_TEMPLATE_ROOT}/rails/gitignore.txt", ".gitignore"
git add: ".", commit: %(--all --no-verify --quiet --message "Added #{SLIM_TEMPLATE_NAME}.")

# End
say_status :end, "#{SLIM_TEMPLATE_NAME} Complete!"
