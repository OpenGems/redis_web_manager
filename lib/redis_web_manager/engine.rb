# frozen_string_literal: true

module RedisWebManager
  class Engine < ::Rails::Engine
    isolate_namespace RedisWebManager

    path = Engine.root.join('app', 'assets', 'config')
    config.assets.precompile << "#{path}/redis_web_manager_manifest.js"

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
