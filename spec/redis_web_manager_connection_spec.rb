# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::Connection do
  let(:connection) do
    RedisWebManager::Connection.new(RedisWebManager.redises.keys[0])
  end

  describe 'connection' do

    it 'returns a host' do
      expect(connection.host).to eql('127.0.0.1')
    end

    it 'returns a port' do
      expect(connection.port).to eql(6379)
    end

    it 'returns a db' do
      expect(connection.db).to eql(0)
    end

    it 'returns an id' do
      expect(connection.id).to eql('redis://127.0.0.1:6379/0')
    end

    it 'returns a location' do
      expect(connection.location).to eql('127.0.0.1:6379')
    end

  end
end
