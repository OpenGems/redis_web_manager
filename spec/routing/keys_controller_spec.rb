# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::KeysController, type: :routing do
  routes { RedisWebManager::Engine.routes }

  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/keys').to(
        route_to('redis_web_manager/keys#index')
      )
    end

    it 'routes to #show' do
      expect(get: '/key').to(
        route_to('redis_web_manager/keys#show')
      )
    end

    it 'routes to #edit' do
      expect(get: '/key/edit').to(
        route_to('redis_web_manager/keys#edit')
      )
    end

    it 'routes to #update' do
      expect(put: '/keys').to(
        route_to('redis_web_manager/keys#update')
      )
    end

    it 'routes to #destroy' do
      expect(delete: '/keys').to(
        route_to('redis_web_manager/keys#destroy')
      )
    end
  end
end
