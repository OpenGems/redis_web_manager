# frozen_string_literal: true

module RedisWebManager
  class Base
    attr_accessor :instance

    def initialize(instance)
      @instance = instance || redises.keys[0]
    end

    private

    def redis
      @redis ||= redises[instance.to_sym]
    end

    def redises
      @redises ||= RedisWebManager.redises
    end
  end
end
