
    # Override generator defaults
    config.generators do |generator|
      generator.assets false
      generator.controller_specs false
      generator.helper false
      generator.test_framework :rspec
      generator.view_specs false
    end

