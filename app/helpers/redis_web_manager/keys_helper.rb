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

    def expiry_date_filters
      {
        all: 'All',
        no_expiry: 'No Expiry',
        less_than_one_hour: 'Less Than One Hour',
        less_than_one_week: 'Less Than One Week',
        less_than_one_month: 'Less Than One Month'
      }
    end
  end
end
