# frozen_string_literal: true

RedisWebManager::Engine.routes.draw do
  # Configuration
  get :configuration, to: 'configuration#index'

  # Information
  get :information, to: 'information#index'

  # Clients
  get :clients, to: 'clients#index'

  # Actions
  delete :flushdb, to: 'actions#flushdb'
  delete :flushall, to: 'actions#flushall'

  # Root
  root 'dashboard#index'
end
