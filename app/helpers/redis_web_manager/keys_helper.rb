# frozen_string_literal: true

module RedisWebManager
  module KeysHelper
    def types
      %w[All String Hash Set Zset List]
    end
  end
end
