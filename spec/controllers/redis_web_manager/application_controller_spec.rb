# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::ApplicationController, type: :controller do
  describe 'Methods' do
    it 'returns a raise value (authenticated?)' do
      expect do
        controller.send(:authenticated?)
      end.to raise_error(LocalJumpError)
    end

    it 'returns a nil value (authenticate)' do
      expect(controller.send(:authenticate)).to eql(nil)
    end

    it 'returns a Info class (info)' do
      expect(controller.send(:info)).to be_a_kind_of(RedisWebManager::Info)
    end

    it 'returns a Connection class (connection)' do
      expect(controller.send(:connection)).to be_a_kind_of(RedisWebManager::Connection)
    end

    it 'returns a Action class (action)' do
      expect(controller.send(:action)).to be_a_kind_of(RedisWebManager::Action)
    end
  end
end
