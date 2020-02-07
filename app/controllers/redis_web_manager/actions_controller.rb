# frozen_string_literal: true

module RedisWebManager
  class ActionsController < ApplicationController
    # DELETE /flushdb
    def flushdb; end

    # DELETE /flushall
    def flushall; end
  end
end