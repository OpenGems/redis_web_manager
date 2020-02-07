# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::ConfigurationController, type: :routing do
  routes { RedisWebManager::Engine.routes }

  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/configuration').to(
        route_to('redis_web_manager/configuration#index')
      )
    end
  end
end
