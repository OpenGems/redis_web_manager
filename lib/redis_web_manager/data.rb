# frozen_string_literal: true

module RedisWebManager
  class Data < Base
    BASE = 'RedisWebManager'

    def keys
      data.map { |key| JSON.parse(redis.get(key), symbolize_names: true) }
    end

    def perform
      now = Time.now.to_i
      seconds = (now + lifespan.to_i) - now
      redis.setex("#{BASE}_#{instance}_#{now}", seconds, serialize.to_json)
    end

    def flush
      data.map { |key| redis.del(key) }
    end

    private

    def data
      @data ||= redis.scan_each(match: "#{BASE}_#{instance}_*").to_a
    end

    def lifespan
      @lifespan ||= RedisWebManager.lifespan
    end

    def serialize
      {
        date: Time.now,
        memory: memory,
        client: client,
        cpu: cpu
      }
    end

    def memory
      {
        used_memory: stats[:used_memory],
        used_memory_rss: stats[:used_memory_rss],
        used_memory_peak: stats[:used_memory_peak],
        used_memory_overhead: stats[:used_memory_overhead],
        used_memory_startup: stats[:used_memory_startup],
        used_memory_dataset: stats[:used_memory_dataset]
      }
    end

    def client
      {
        connected_clients: stats[:connected_clients],
        blocked_clients: stats[:blocked_clients]
      }
    end

    def cpu
      {
        used_cpu_sys: stats[:used_cpu_sys],
        used_cpu_user: stats[:used_cpu_user],
        used_cpu_sys_children: stats[:used_cpu_sys_children],
        used_cpu_user_children: stats[:used_cpu_user_children]
      }
    end

    def stats
      @stats ||= redis.info.symbolize_keys
    end
  end
end
