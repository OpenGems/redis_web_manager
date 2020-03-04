# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::DashboardController, type: :routing do
  routes { RedisWebManager::Engine.routes }

  let(:default) do
    RedisWebManager.redises.keys[0]
  end

  describe 'routing' do
    it 'routes to #index' do
      expect(get: "/#{default}/dashboard").to(
        route_to('redis_web_manager/dashboard#index', instance: default.to_s)
      )
    end
  end
end
