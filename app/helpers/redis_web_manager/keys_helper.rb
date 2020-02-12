# frozen_string_literal: true

module RedisWebManager
  module KeysHelper
    def types_filters
      [%w[All all],
       %w[String string],
       %w[Hash hash],
       %w[Set set],
       %w[Zset zset],
       %w[List list]]
    end

    def expiry_date_filters
      [%w[All all],
       ['No expiry', -1],
       ['Less than 1 hour', 3600],
       ['Less than 1 week', 604_800],
       ['Less than 1 month', 2_592_000],
       ['Less than 6 months', 15_552_000]]
    end
  end
end
