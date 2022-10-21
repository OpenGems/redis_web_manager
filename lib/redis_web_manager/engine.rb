# frozen_string_literal: true

module RedisWebManager
  class Engine < ::Rails::Engine
    isolate_namespace RedisWebManager

    initializer 'redis_web_manager.assets.precompile' do |app|
      # check if Rails api mode
      if app.config.respond_to?(:assets)
        if defined?(Sprockets) && Sprockets::VERSION >= '4'
          app.config.assets.precompile << 'redis_web_manager/application.js'
          app.config.assets.precompile << 'redis_web_manager/application.css'
        else
          # use a proc instead of a string
          app.config.assets.precompile << proc { |path| path == 'redis_web_manager/application.js' }
          app.config.assets.precompile << proc { |path| path == 'redis_web_manager/application.css' }
        end
      end
    end

    config.generators do |generate|
      # Don't generate assets
      generate.assets false

      # Don't generate helper
      generate.helper false

      # Rspec
      generate.test_framework :rspec
    end
  end
end
