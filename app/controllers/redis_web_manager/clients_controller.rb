# frozen_string_literal: true

module RedisWebManager
  class ClientsController < ApplicationController
    # GET /clients
    def index
      @status = info.status
      @url = connection.id
      @clients = info.clients.map(&:symbolize_keys)
    end
  end
end
