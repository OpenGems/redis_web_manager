# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::ActionsController, type: :routing do
  routes { RedisWebManager::Engine.routes }

  let(:default) do
    RedisWebManager.redises.keys[0]
  end

  describe 'routing' do
    it 'routes to #reset' do
      expect(delete: "/#{default}/reset").to(
        route_to('redis_web_manager/actions#reset', instance: default.to_s)
      )
    end

    it 'routes to #flushdb' do
      expect(delete: "/#{default}/flushdb").to(
        route_to('redis_web_manager/actions#flushdb', instance: default.to_s)
      )
    end

    it 'routes to #flushall' do
      expect(delete: "/#{default}/flushall").to(
        route_to('redis_web_manager/actions#flushall', instance: default.to_s)
      )
    end
  end
end
