# frozen_string_literal: true

module RedisWebManager
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :authenticated?, if: :authenticate
    before_action :valid_instance?
    helper_method :redises
    helper_method :instance

    private

    def authenticated?
      instance_exec(&authenticate)
    end

    def authenticate
      RedisWebManager.authenticate
    end

    def info
      @info ||= RedisWebManager::Info.new(instance)
    end

    def connection
      @connection ||= RedisWebManager::Connection.new(instance)
    end

    def action
      @action ||= RedisWebManager::Action.new(instance)
    end

    def data
      @data ||= RedisWebManager::Data.new(instance)
    end

    def default_url_options(options = {})
      options.merge(instance: instance)
    end

    def valid_instance?
      default_instance = redises.keys[0]
      redirect_to dashboard_url(instance: default_instance) if instance.nil?
    end

    def instance
      @instance ||= params[:instance].presence
    end

    def redises
      @redises ||= RedisWebManager.redises
    end
  end
end
