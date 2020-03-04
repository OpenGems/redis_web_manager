# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::KeysController, type: :routing do
  routes { RedisWebManager::Engine.routes }

  let(:default) do
    RedisWebManager.redises.keys[0]
  end

  describe 'routing' do
    it 'routes to #index' do
      expect(get: "/#{default}/keys").to(
        route_to('redis_web_manager/keys#index', instance: default.to_s)
      )
    end

    it 'routes to #show' do
      expect(get: "/#{default}/key").to(
        route_to('redis_web_manager/keys#show', instance: default.to_s)
      )
    end

    it 'routes to #edit' do
      expect(get: "/#{default}/key/edit").to(
        route_to('redis_web_manager/keys#edit', instance: default.to_s)
      )
    end

    it 'routes to #update' do
      expect(put: "/#{default}/keys").to(
        route_to('redis_web_manager/keys#update', instance: default.to_s)
      )
    end

    it 'routes to #destroy' do
      expect(delete: "/#{default}/keys").to(
        route_to('redis_web_manager/keys#destroy', instance: default.to_s)
      )
    end
  end
end
