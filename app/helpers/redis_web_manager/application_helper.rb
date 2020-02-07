# frozen_string_literal: true

module RedisWebManager
  module ApplicationHelper
    def expire(value)
      if value == -1
        'No expiration date'
      else
        distance_of_time_in_words(value)
      end
    end
  end
end
