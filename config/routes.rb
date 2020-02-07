# frozen_string_literal: true

RedisWebManager::Engine.routes.draw do
  # Configuration
  get :configuration, to: 'configuration#index'

  # Information
  get :information, to: 'information#index'

  # Keys
  get 'keys' => 'keys#index'
  get 'key' => 'keys#show'
  get 'key/edit' => 'keys#edit', as: :edit_key
  put 'keys' => 'keys#update', as: :update_key
  delete 'keys' => 'keys#destroy', as: :destroy_key

  # Clients
  get :clients, to: 'clients#index'

  # Actions
  delete :flushdb, to: 'actions#flushdb'
  delete :flushall, to: 'actions#flushall'

  # Root
  root 'dashboard#index'
end
