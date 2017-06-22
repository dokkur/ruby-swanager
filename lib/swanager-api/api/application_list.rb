require 'swanager-api/api/application'

module Swanager
  class ApplicationList < ApiBase
    include Enumerable

    attr_accessor :items

    def initialize connection
      super

      @items = []
    end

    def load
      @items = []

      response = request method: :get, path: '/apps'

      response['applications'].each do |apps|
        @items << Application.new(@connection, apps)
      end

      self
    end

    def create params
      response = request method: :post, path: '/apps', body: params.to_json

      Application.new(@connection, response['application'])
    end

    def each &block
      @items.each{|item| block.call(item)}
    end
  end
end
