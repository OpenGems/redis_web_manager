# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::ActionsController, type: :controller do
  routes { RedisWebManager::Engine.routes }

  describe 'DELETE #flushdb' do
  end

  describe 'DELETE #flushall' do
  end
end