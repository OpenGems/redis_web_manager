# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager do
  describe 'Test default configuration' do
    it 'returns a Redis class' do
      expect(RedisWebManager.redis).to be_a_kind_of(Redis)
    end

    it 'returns a nil class' do
      expect(RedisWebManager.authenticate).to eql(nil)
    end

    it 'returns a ActiveSupport::Duration class' do
      expect(RedisWebManager.lifespan).to be_a_kind_of(ActiveSupport::Duration)
    end
  end

  describe 'Test configuration' do
    it 'returns a raise error' do
      expect do
        RedisWebManager.configure do |c|
          c.redis = 1
          c.lifespan = 1
        end
      end.to raise_error(ArgumentError, 'Invalid Redis instance, use like that Redis.new')
    end

    it 'returns a raise error (redis)' do
      expect do
        RedisWebManager.configure do |c|
          c.redis = 1
        end
      end.to raise_error(ArgumentError, 'Invalid Redis instance, use like that Redis.new')
    end

    it 'returns a raise error (lifespan)' do
      expect do
        RedisWebManager.configure do |c|
          c.redis = ::Redis.new
          c.lifespan = 1
        end
      end.to raise_error(ArgumentError, 'Invalid lifespan, use like that 15.days, 15.minutes etc')
    end

    it 'returns a raise error (lifespan)' do
      expect do
        RedisWebManager.configure do |c|
          c.redis = ::Redis.new
          c.lifespan = -1.days
        end
      end.to raise_error(ArgumentError, 'Invalid lifespan, value must be greater than 0')
    end

  end
end
