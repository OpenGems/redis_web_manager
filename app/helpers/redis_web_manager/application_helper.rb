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

    def expiry(value)
      if value == -1
        'No expiration date'
      else
        distance_of_time_in_words(value)
      end
    end

    def active_if(path)
      current_page?(path) ? 'active' : ''
    end

    def disabled_if_readonly
      RedisWebManager.readonly ? 'disabled' : ''
    end

    def flash_class(level)
      {
        'primary' => 'alert alert-primary',
        'secondary' => 'alert alert-secondary',
        'success' => 'alert alert-success',
        'danger' => 'alert alert-danger',
        'warning' => 'alert alert-warning',
        'info' => 'alert alert-info',
        'light' => 'alert alert-light',
        'dark' => 'alert alert-dark'
      }[level]
    end
  end
end
