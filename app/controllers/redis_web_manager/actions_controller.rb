# frozen_string_literal: true

module RedisWebManager
  class ActionsController < ApplicationController
    # DELETE /reset
    def reset
      perform_unless_readonly { data.flush }
      redirect_to root_url
    end

    # DELETE /flushdb
    def flushdb
      perform_unless_readonly { action.flushdb }
      redirect_to root_url
    end

    # DELETE /flushall
    def flushall
      perform_unless_readonly { action.flushall }
      redirect_to root_url
    end
  end
end
