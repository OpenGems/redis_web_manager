# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::KeysHelper, type: :helper do
  describe 'helper' do
    it 'returns Array of types value' do
      expect(helper.types).to eql(%w[All string hash set zset list])
    end
  end
end
