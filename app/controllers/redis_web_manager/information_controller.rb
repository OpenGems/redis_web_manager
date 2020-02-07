# frozen_string_literal: true

module RedisWebManager
  class InformationController < ApplicationController
    # GET /information
    def index
      @information = stats.map { |k, v| { name: k.to_s.humanize, value: v } }
      @status = info.status
      @url = connection.id
    end

    private

    def stats
      @stats ||= info.stats.symbolize_keys
    end
  end
end
