require 'swanager-api/api/service'

module Swanager
  class ServiceList < ApiBase
    include Enumerable

    attr_accessor :items, :app_id

    def initialize connection, app_id=nil
      super connection

      @app_id = app_id
      @items = []
    end

    def load
      @items = []

      response = request method: :get, path: '/services', query: (@app_id ? { app_id: @app_id } : {})

      response['services'].each do |service|
        @items << Service.new(@connection, service)
      end

      self
    end

    def create params
      response = request method: :post, path: '/services', body: params.to_json

      Service.new(@connection, response['service'])
    end

    def delete id
      response = request method: :delete, path: "/services/#{id}"

      true
    end

    def each &block
      @items.each{|item| block.call(item)}
    end
  end
end
