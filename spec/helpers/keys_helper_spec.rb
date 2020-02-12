# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::KeysHelper, type: :helper do
  describe 'helper' do
    it 'returns Array of types' do
      expect(helper.types_filters).to eql([%w[All all],
                                           %w[String string],
                                           %w[Hash hash],
                                           %w[Set set],
                                           %w[Zset zset],
                                           %w[List list]])
    end

    it 'returns Array of expiration' do
      expect(helper.expiry_date_filters).to eq(
        [%w[All all],
         ['No expiry', -1],
         ['Less than 1 hour', 3600],
         ['Less than 1 week', 604_800],
         ['Less than 1 month', 2_592_000],
         ['Less than 6 months', 15_552_000]]
      )
    end
  end
end
