# frozen_string_literal: true

module RedisWebManager
  class Info < Base
    def status
      @status ||= redis.ping == 'PONG'
    end

    def stats
      @stats ||= redis.info
    end

    def search(query)
      query.blank? ? redis.keys : redis.scan_each(match: "*#{query}*").to_a
    end

    def type(key)
      redis.type(key)
    end

    def expiry(key)
      redis.ttl(key)
    end

    def memory_usage(key)
      redis.memory(:usage, key)
    end

    def get(key)
      redis.get(key)
    end

    def llen(key)
      redis.llen(key)
    end

    def lrange(key, start, stop)
      redis.lrange(key, start, stop)
    end

    def smembers(key)
      redis.smembers(key)
    end

    def zrange(key, start, stop, options = {})
      if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('3.0.0')
        return redis.zrange(key, start, stop, **options)
      end

      redis.zrange(key, start, stop, options)
    end

    def hgetall(key)
      redis.hgetall(key)
    end

    def dbsize
      @dbsize ||= redis.dbsize
    end

    def configuration
      @configuration ||= redis.config(:get, '*')
    end

    def clients
      @clients ||= redis.client(:list)
    end
  end
end
