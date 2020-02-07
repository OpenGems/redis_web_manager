# frozen_string_literal: true

require 'pagy'
require 'pagy/extras/array'
require 'pagy/extras/bootstrap'

module RedisWebManager
  class KeysController < ApplicationController
    include ::Pagy::Backend

    # GET /keys
    def index
      query = params[:query].presence
      @keys = if query.present?
                info.search(query).map { |key| format_key(key) }
              else
                info.keys.map { |key| format_key(key) }
              end
      @status = info.status
      @url = connection.id
      @pagy, @keys = pagy_array(@keys)
    end

    # GET /key/:key
    def show
      key = params[:key].presence
      redirect_to keys_url if key.nil?
      @key = format_key(key)
    end

    # GET /key/:key
    def edit
      key = params[:key].presence
      redirect_to keys_url if key.nil?
      @key = format_key(key)
    end

    # PUT /key/:key
    def update
      old_key = params[:old_name].presence
      new_name = params[:new_name].presence
      redirect_to keys_url if old_key.nil? || new_name.nil?
      action.rename(old_key, new_name)
      redirect_to keys_url
    end

    # DELETE /key/:key
    def destroy
      key = params[:key].presence
      redirect_to keys_url if key.nil?
      action.del(key)
      redirect_to keys_url
    end

    private

    def item_type(value)
      ['json', JSON.parse(value)]
    rescue JSON::ParserError
      ['string', value]
    end

    # Get values for Redis List type
    def get_list(key)
      start = 0
      stop  = 99

      length = info.llen(key)
      values = info.lrange(key, start, stop).map.with_index do |e, i|
        type, value = item_type(e)
        { type: type, value: value, index: start + i }
      end

      { length: length, values: values }
    end

    # Get values for Redis Set type
    def get_set(key)
      values = info.smembers(key).map do |e|
        type, value = item_type(e)
        { type: type, value: value }
      end

      { values: values }
    end

    # Get values for Redis Zset type
    def get_zset(key)
      values = info.zrange(key, 0, -1, withscores: true).map do |e, score|
        type, value = item_type(e)
        { type: type, value: value, score: score }
      end

      { values: values }
    end

    # Get values for Redis Hash type
    def get_hash(key)
      value = Hash[info.hgetall(key).map do |k, v|
        type, value = item_type(v)
        [k, { type: type, value: value }]
      end]

      { value: value }
    end

    def get_value(key)
      type = info.type(key)
      case type
      when 'string'
        { value: info.get(key) }
      when 'list'
        get_list(key)
      when 'set'
        get_set(key)
      when 'zset'
        get_zset(key)
      when 'hash'
        get_hash(key)
      else
        { value: 'Not found' }
      end
    end

    def format_key(key)
      {
          key: key,
          expire: info.expire(key),
          node: get_value(key),
          type: info.type(key),
          memory: info.memory_usage(key)
      }
    end
  end
end