# frozen_string_literal: true

module RedisWebManager
  class DashboardController < ApplicationController
    # GET /dashboard
    def index
      @status = info.status
      @url = connection.id
      @memory = []
      @cpu = []
      @client = []
    end
  end
end
