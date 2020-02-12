# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::KeysHelper, type: :helper do
  describe 'helper' do
    it 'returns Array of types value' do
      expect(helper.types).to eql([%w[All all],
                                   %w[String string],
                                   %w[Hash hash],
                                   %w[Set set],
                                   %w[Zset zset],
                                   %w[List list]])
    end

    it 'returns Hash of duration' do
      expect(helper.expiry_date_filters).to eq(
        all: 'All',
        no_expiry: 'No Expiry',
        less_than_one_hour: 'Less Than One Hour',
        less_than_one_week: 'Less Than One Week',
        less_than_one_month: 'Less Than One Month'
      )
    end
  end
end
