# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::KeysController, type: :controller do
  routes { RedisWebManager::Engine.routes }
  let(:redis) do
    ::Redis.new
  end

  let(:default) do
    RedisWebManager.redises.keys[0]
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { instance: default.to_s }
      expect(response).to be_successful
      get :index, params: { query: 'test', instance: default.to_s }
      expect(response).to be_successful
      get :index, params: { type: 'string', instance: default.to_s }
      expect(response).to be_successful
      get :index, params: { expiry: '-1', instance: default.to_s }
      expect(response).to be_successful
      get :index, params: { expiry: '3600', instance: default.to_s }
      expect(response).to be_successful
      get :index, params: { memory: '1000', instance: default.to_s }
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      redis.set('test', 'test')
      get :show, params: { key: 'test', instance: default.to_s }
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      redis.set('test', 'test')
      get :edit, params: { key: 'test', instance: default.to_s }
      expect(response).to be_successful
    end
  end

  describe 'GET #update' do
    it 'returns a success response' do
      redis.set('test', 'test')
      put :update, params: { old_name: 'test', new_name: 'testtest', instance: default.to_s }
      expect(response).to be_redirect
    end
  end

  describe 'GET #destroy' do
    it 'returns a success response' do
      redis.set('test', 'test')
      delete :destroy, params: { key: 'test', instance: default.to_s }
      expect(response).to be_redirect
    end
  end

  describe 'Methods' do
    it 'returns a hash value (get_value - string)' do
      redis.set('test', 'test')
      eql = {
        value: 'test'
      }
      expect(controller.send(:get_value, 'test')).to eql(eql)
    end

    it 'returns a hash value (get_value - hgetall)' do
      eql = {
        value: {
          'name' => {
            type: 'string',
            value: 'hgetall'
          }
        }
      }
      redis.hset('hgetall', 'name', 'hgetall')
      expect(controller.send(:get_value, 'hgetall')).to eql(eql)
    end

    it 'returns a hash value (get_value - lrange)' do
      redis.lpush('lrange', '1')
      redis.lpush('lrange', '2')
      eql = {
        length: 2,
        values: [
          {
            index: 0,
            type: 'json',
            value: 2
          },
          {
            index: 1,
            type: 'json',
            value: 1
          }
        ]
      }
      expect(controller.send(:get_value, 'lrange')).to eql(eql)
    end

    it 'returns a hash value (get_value - set)' do
      redis.sadd('smembers', 'smembers')
      eql = {
        values: [{ type: 'string', value: 'smembers' }]
      }
      expect(controller.send(:get_value, 'smembers')).to eql(eql)
    end

    it 'returns a hash value (get_value - zset)' do
      redis.zadd('zrange', 10, '1')
      redis.zadd('zrange', 20, '2')
      redis.zadd('zrange', 30, '3')
      eql = {
        values: [
          {
            score: 10.0,
            type: 'json',
            value: 1
          },
          {
            score: 20.0,
            type: 'json',
            value: 2
          },
          {
            score: 30.0,
            type: 'json',
            value: 3
          }
        ]
      }
      expect(controller.send(:get_value, 'zrange')).to eql(eql)
    end

    it 'returns a hash value (get_value - not found)' do
      redis.zadd('zrange', 10, '1')
      redis.zadd('zrange', 20, '2')
      redis.zadd('zrange', 30, '3')
      eql = {
        value: 'Not found'
      }
      expect(controller.send(:get_value, 'testtesttesttesttest')).to eql(eql)
    end
  end
end
