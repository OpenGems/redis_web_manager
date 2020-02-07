# frozen_string_literal: true

module RedisWebManager
  module ApplicationHelper
    require 'pagy'

    include ::Pagy::Frontend

    def status(value)
      if value
        content_tag(:kbd, 'ON', class: 'bg-success bounce')
      else
        content_tag(:kbd, 'OFF', class: 'bg-danger bounce')
      end
    end

    def url(value)
      content_tag(:kbd, value, class: 'bg-dark')
    end

    def expire(value)
      if value == -1
        'No expiration date'
      else
        distance_of_time_in_words(value)
      end
    end
  end
end
