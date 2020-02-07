# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::ConfigurationController, type: :controller do
  routes { RedisWebManager::Engine.routes }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end
end
