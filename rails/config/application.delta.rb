
    # Override generator defaults
    config.generators do |generator|
      generator.assets false
      generator.controller_specs false
      generator.helper false
      generator.template_engine :slim
      generator.test_framework :rspec
      generator.view_specs false
      generator.orm :active_record, primary_key_type: :uuid
    end

