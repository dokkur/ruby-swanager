require 'swanager-api/api/service_list'

module Swanager
  class Application < ApiObject

    ATTRS = [ :id, :name ]

    attr_accessor(*ATTRS)

    def update params
      response = request method: :put, path: "/apps/#{id}", body: params.to_json

      set_attr response['application']

      true
    end

    def start
      request method: :put, path: "/apps/#{id}/start"

      true
    end

    def stop
      request method: :put, path: "/apps/#{id}/stop"

      true
    end

    def services
      ServiceList.new(@connection, id).load
    end

  end
end
