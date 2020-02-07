# frozen_string_literal: true

module RedisWebManager
  class Connection < Base
    def host
      @host ||= connection[:host]
    end

    def port
      @port ||= connection[:port]
    end

    def db
      @db ||= connection[:db]
    end

    def id
      @id ||= connection[:id]
    end

    def location
      @location ||= connection[:location]
    end

    private

    def connection
      @connection ||= redis.connection
    end
  end
end
