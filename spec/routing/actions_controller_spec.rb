# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::ActionsController, type: :routing do
  routes { RedisWebManager::Engine.routes }

  describe 'routing' do
    it 'routes to #flushdb' do
      expect(delete: '/flushdb').to(
        route_to('redis_web_manager/actions#flushdb')
      )
    end

    it 'routes to #flushall' do
      expect(delete: '/flushall').to(
        route_to('redis_web_manager/actions#flushall')
      )
    end
  end
end
