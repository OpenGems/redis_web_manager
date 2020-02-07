# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::DashboardController, type: :routing do
  routes { RedisWebManager::Engine.routes }

  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/').to(
        route_to('redis_web_manager/dashboard#index')
      )
    end
  end
end
