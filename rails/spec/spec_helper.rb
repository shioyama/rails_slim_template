Dir[File.join(File.dirname(__FILE__), "support/extensions/ruby/**/*.rb")].each { |file| require file }
Dir[File.join(File.dirname(__FILE__), "support/kit/**/*.rb")].each { |file| require file }
