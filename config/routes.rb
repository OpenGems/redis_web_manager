# frozen_string_literal: true

RedisWebManager::Engine.routes.draw do
  redises_keys = RedisWebManager.redises.keys
  scope ':instance', instance: /#{redises_keys.join('|')}/ do
    # Configuration
    get :configuration, to: 'configuration#index'

    # Information
    get :information, to: 'information#index'

    # Dashboard
    get :dashboard, to: 'dashboard#index'

    # Keys
    get 'keys' => 'keys#index'
    get 'key' => 'keys#show'
    get 'key/edit' => 'keys#edit', as: :edit_key
    put 'keys' => 'keys#update', as: :update_key
    delete 'keys' => 'keys#destroy', as: :destroy_key

    # Clients
    get :clients, to: 'clients#index'

    # Actions
    delete :reset, to: 'actions#reset'
    delete :flushdb, to: 'actions#flushdb'
    delete :flushall, to: 'actions#flushall'
  end

  # Root
  root 'dashboard#index'
end
