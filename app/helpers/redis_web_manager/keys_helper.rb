# frozen_string_literal: true

module RedisWebManager
  module KeysHelper
    def types
      [%w[All all],
       %w[String string],
       %w[Hash hash],
       %w[Set set],
       %w[Zset zset],
       %w[List list]]
    end
  end
end
