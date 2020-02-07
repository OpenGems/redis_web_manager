# frozen_string_literal: true

module RedisWebManager
  class DashboardController < ApplicationController
    # GET /dashboard
    def index
      @information = stats.map { |k, v| { name: k.to_s.humanize, value: v } }
      @status = info.status
      @url = connection.id
      @memory = keys_by_type(data.keys, :memory)
      @cpu = keys_by_type(data.keys, :cpu)
      @client = keys_by_type(data.keys, :client)
    end

    private

    def stats
      @stats ||= info.stats.symbolize_keys.slice(:redis_version,
                                                 :redis_mode,
                                                 :arch_bits,
                                                 :process_id,
                                                 :os,
                                                 :role,
                                                 :connected_clients,
                                                 :blocked_clients,
                                                 :uptime_in_days,
                                                 :used_memory_human)
    end

    def keys_by_type(keys, value)
      keys.map { |key| key.slice(:date, value) }.sort_by { |key| key[:date] }
    end
  end
end
