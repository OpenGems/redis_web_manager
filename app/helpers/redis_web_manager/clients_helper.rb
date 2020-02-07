# frozen_string_literal: true

module RedisWebManager
  module ClientsHelper
    def age(value)
      time_ago_in_words(Time.now - value.seconds).humanize
    end

    def flags(value)
      {
        A: 'Connection to be closed ASAP',
        b: 'The client is waiting in a blocking operation',
        c: 'Connection to be closed after writing entire reply',
        d: 'A watched keys has been modified - EXEC will fail',
        i: 'The client is waiting for a VM I/O (deprecated)',
        M: 'The client is a master',
        N: 'No specific flag set',
        O: 'The client is a client in MONITOR mode',
        P: 'The client is a Pub/Sub subscriber',
        r: 'The client is in readonly mode against a cluster node',
        S: 'The client is a replica node connection to this instance',
        u: 'The client is unblocked',
        U: 'The client is connected via a Unix domain socket',
        X: 'The client is in a MULTI/EXEC context'
      }[value.to_sym]
    end

    def events(value)
      {
        r: 'The client socket is readable',
        w: 'The client socket is writable'
      }[value.to_sym]
    end
  end
end
