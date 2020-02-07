# frozen_string_literal: true

module RedisWebManager
  module ApplicationHelper
    require 'pagy'

    include ::Pagy::Frontend

    def expire(value)
      if value == -1
        'No expiration date'
      else
        distance_of_time_in_words(value)
      end
    end
  end
end
