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

    def expiry_filters
      [%w[All all],
       ['No expiry', -1],
       ['Less than 1 hour', 3600],
       ['Less than 1 week', 604_800],
       ['Less than 1 month', 2_592_000],
       ['Less than 6 months', 15_552_000]]
    end

    def memory_filters
      [%w[All all],
       ['Less than 1 KB', 1000],
       ['Less than 10 KB', 10_000],
       ['Less than 100 KB', 100_000],
       ['Less than 1 MB', 1_000_000],
       ['Less than 10 MB', 10_000_000],
       ['Less than 100 MB', 100_000_000]]
    end

    def clear_filters_link
      return unless (params.keys & %w[query type expiry memory]).any?

      link_to 'Clear filters', keys_path, class: 'badge badge-secondary'
    end
  end
end
