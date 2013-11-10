require "net/http"
require "net/https"
require "uri"

TEMPLATE_NAME = "Rails Slim Template"
TEMPLATE_ROOT = "https://raw.github.com/bkuhlmann/rails_slim_template/v1.0.0"

# Downloads a file, swiching to a secure connection if the source requires it. Also creates parent directories if they do not exist.
# ==== Parameters
# * +source+ - The remote source URL.
# * +destination+ - The local file destination path.
def download_file source, destination
  say_status :download, "#{source} to #{destination}."
  uri = URI.parse source
  http = Net::HTTP.new uri.host, uri.port
  http.use_ssl = uri.scheme == "https"
  request = Net::HTTP::Get.new uri.request_uri
  response = http.request request
  project_file = File.join destination_root, destination
  project_directory = File.dirname project_file
  FileUtils.mkdir_p(project_directory) unless File.exist?(project_directory)
  File.open(project_file, "w") {|file| file.write response.body}
end

# Ruby Version Management
download_file "#{TEMPLATE_ROOT}/rails/ruby-version.txt", ".ruby-version"

# Configurations
download_file "#{TEMPLATE_ROOT}/rails/config/database.yml", "config/database.yml"
run "cp config/environments/production.rb config/environments/stage.rb"

application_delta = "config/application.delta.rb"
download_file("#{TEMPLATE_ROOT}/rails/config/application.delta.rb", application_delta)
insert_into_file "config/application.rb", open(application_delta).read, after: "  # config.i18n.default_locale = :de\n"
remove_file application_delta
gsub_file "config/application.rb", /# config.time_zone = \'Central Time \(US & Canada\)\'/, "config.time_zone = \"UTC\""
gsub_file "config/application.rb", /# config.i18n.default_locale = :de/, "config.i18n.default_locale = \"en-US\""

# Gems
download_file "#{TEMPLATE_ROOT}/rails/Gemfile", "Gemfile"
generate "rspec:install"
download_file "#{TEMPLATE_ROOT}/rails/rspec.txt", ".rspec"

# Controllers
insert_into_file "app/controllers/application_controller.rb", "  helper :all\n", after: "class ApplicationController < ActionController::Base\n"
download_file "#{TEMPLATE_ROOT}/rails/app/controllers/home_controller.rb", "app/controllers/home_controller.rb"

# Routes
route "resource :home, controller: \"home\""
route "root \"home#show\""

# Helpers
remove_file "app/helpers/application_helper.rb"

# Views
download_file "#{TEMPLATE_ROOT}/rails/app/views/layouts/application.html.erb", "app/views/layouts/application.html.erb"
download_file "#{TEMPLATE_ROOT}/rails/app/views/home/show.html.erb", "app/views/home/show.html.erb"

# Images
remove_file "app/assets/images/rails.png"
download_file "#{TEMPLATE_ROOT}/rails/public/apple-touch-icon-114x114.png", "public/apple-touch-icon-114x114.png"
download_file "#{TEMPLATE_ROOT}/rails/public/apple-touch-icon.png", "public/apple-touch-icon.png"
download_file "#{TEMPLATE_ROOT}/rails/public/favicon.ico", "public/favicon.ico"

# Doc
download_file "#{TEMPLATE_ROOT}/rails/public/humans.txt", "public/humans.txt"

# Git
git :init
download_file "#{TEMPLATE_ROOT}/rails/gitignore.txt", ".gitignore"
git add: '.', commit: "-n -a -m \"Applied #{TEMPLATE_NAME}.\""

# End
say_status :end, "#{TEMPLATE_NAME} Complete!"
