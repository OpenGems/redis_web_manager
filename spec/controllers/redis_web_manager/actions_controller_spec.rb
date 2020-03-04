# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::ActionsController, type: :controller do
  routes { RedisWebManager::Engine.routes }

  let(:default) do
    RedisWebManager.redises.keys[0]
  end

  describe 'DELETE #reset' do
    it 'returns a success response' do
      delete :reset, params: { instance: default.to_s }
      expect(response).to be_redirect
    end
  end

  describe 'DELETE #flushdb' do
    it 'returns a success response' do
      delete :flushdb, params: { instance: default.to_s }
      expect(response).to be_redirect
    end
  end

  describe 'DELETE #flushall' do
    it 'returns a success response' do
      delete :flushall, params: { instance: default.to_s }
      expect(response).to be_redirect
    end
  end
end
