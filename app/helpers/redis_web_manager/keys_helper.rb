# frozen_string_literal: true

module RedisWebManager
  module KeysHelper
    def types
      %w[All string hash set zset list]
    end
  end
end
