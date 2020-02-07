# frozen_string_literal: true

module RedisWebManager
  module DashboardHelper
    def graph_canvas(data, id)
      if data.nil? || data.empty?
        content_tag(:div,
                    'You don\'t have any RedisWebManager keys yet into your redis database',
                    class: 'm-5 text-center')
      else
        content_tag(:canvas,
                    nil,
                    id: id,
                    width: 800,
                    height: 400,
                    data: { canvas: data.to_json })
      end
    end
  end
end