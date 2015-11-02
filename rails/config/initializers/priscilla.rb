if defined? Priscilla
  Priscilla.configure do |config|
    config.width = 80
    config.decorator = "-"
    config.presenter = ->(message) { Rails.logger.debug "\n#{message}" }
  end
end
