# frozen_string_literal: true

module RedisWebManager
  class Base
    attr_accessor :instance

    def initialize(instance)
      @instance = instance
    end

    private

    def redis
      @redis ||= redises[redises.index(instance)]
    end

    def redises
      @redises ||= RedisWebManager.redises
    end
  end
end
