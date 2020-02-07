# frozen_string_literal: true

module RedisWebManager
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :authenticated?, if: :authenticate

    private

    def authenticated?
      instance_exec(&authenticate)
    end

    def authenticate
      RedisWebManager.authenticate
    end

    def info
      @info ||= RedisWebManager::Info.new
    end

    def connection
      @connection ||= RedisWebManager::Connection.new
    end

    def action
      @action ||= RedisWebManager::Action.new
    end

    def data
      @data ||= RedisWebManager::Data.new
    end
  end
end
