# frozen_string_literal: true

Rails.application.routes.draw do
  mount RedisWebManager::Engine => '/redis_web_manager'
end
