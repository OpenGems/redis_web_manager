# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::Info do
  let(:info) do
    RedisWebManager::Info.new(RedisWebManager.redises.keys[0])
  end

  let(:redis) do
    ::Redis.new
  end

  describe 'info' do
    it 'returns a true (status)' do
      expect(info.status).to eql(true)
    end

    it 'returns a Hash class (stats)' do
      expect(info.stats).to be_a_kind_of(Hash)
    end


    it 'returns a string value (type)' do
      redis.set('test', 'test', ex: 20.seconds)
      expect(info.type('test')).to eql('string')
    end

    it 'returns a Arary of keys (search)' do
      redis.set('testtesttest', 'testtesttest')
      expect(info.search('testtesttest')).to eql(['testtesttest'])
    end

    it 'returns a ttl value (expire)' do
      expect(info.expiry('test')).to eql(20)
    end

    it 'returns a memory usage value (memory_usage)' do
      expect(info.memory_usage('test')).to eql(52)
    end

    it 'returns a test value (get)' do
      expect(info.get('test')).to eql('test')
    end

    it 'returns a Integer value (llen)' do
      redis.lpush('llen', '1')
      redis.lpush('llen', '2')
      expect(info.llen('llen')).to eql(2)
    end

    it 'returns a Array value (lrange)' do
      redis.lpush('lrange', '1')
      redis.lpush('lrange', '2')
      expect(info.lrange('lrange', 0, -1)).to eql(%w[2 1])
    end

    it 'returns a Array value (smembers)' do
      redis.sadd('smembers', 'smembers')
      expect(info.smembers('smembers')).to eql(%w[smembers])
    end

    it 'returns a Array value (zrange)' do
      redis.zadd('zrange', 10, '1')
      redis.zadd('zrange', 20, '2')
      redis.zadd('zrange', 30, '3')
      expect(info.zrange('zrange', 0, -1)).to eql(%w[1 2 3])
    end

    it 'returns a Hash value (hgetall)' do
      redis.hset('hgetall', 'name', 'hgetall')
      expect(info.hgetall('hgetall')).to eql('name' => 'hgetall')
    end

    it 'returns a Integer class (dbsize)' do
      expect(info.dbsize).to be_a_kind_of(Integer)
    end

    it 'returns a Hash class (configuration)' do
      expect(info.configuration).to be_a_kind_of(Hash)
    end

    it 'returns a Array class (clients)' do
      expect(info.clients).to be_a_kind_of(Array)
    end
  end
end
