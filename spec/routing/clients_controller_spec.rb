# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::ClientsController, type: :routing do
  routes { RedisWebManager::Engine.routes }

  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/clients').to(
        route_to('redis_web_manager/clients#index')
      )
    end
  end
end
