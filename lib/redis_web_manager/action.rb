# frozen_string_literal: true

module RedisWebManager
  class Action < Base
    def flushall
      redis.flushall
    end

    def flushdb
      redis.flushdb
    end

    def del(key)
      redis.del(key)
    end

    def rename(old_name, new_name)
      redis.rename(old_name, new_name)
    end
  end
end