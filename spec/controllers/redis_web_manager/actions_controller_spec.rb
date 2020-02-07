# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::ActionsController, type: :controller do
  routes { RedisWebManager::Engine.routes }

  describe 'DELETE #flushdb' do
    it 'returns a success response' do
      delete :flushdb
      expect(response).to be_redirect
    end
  end

  describe 'DELETE #flushall' do
    it 'returns a success response' do
      delete :flushall
      expect(response).to be_redirect
    end
  end
end