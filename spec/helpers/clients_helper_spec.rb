# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisWebManager::ClientsHelper, type: :helper do
  describe 'helper' do
    it 'returns age value' do
      expect(helper.age(86_400)).to eql('1 day')
    end

    it 'returns flags value' do
      expect(helper.flags(:A)).to eql('Connection to be closed ASAP')
    end

    it 'returns events value' do
      expect(helper.events(:r)).to eql('The client socket is readable')
    end
  end
end
