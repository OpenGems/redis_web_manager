# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::DashboardHelper, type: :helper do
  describe 'helper' do
    it 'returns graph_canvas tag (div)' do
      expect(helper.graph_canvas(nil, :test)).to match(/div/)
    end

    it 'returns graph_canvas tag (canvas)' do
      expect(helper.graph_canvas([1], :test)).to match(/canvas/)
    end
  end
end