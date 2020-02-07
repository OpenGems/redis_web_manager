# frozen_string_literal: true

module RedisWebManager
  class Base
    private

    def redis
      @redis ||= RedisWebManager.redis
    end
  end
end
