module Swanager
  class Service < ApiObject

    ATTRS = [ :id, :application_id, :name, :image,
              :ns_name, :replicas, :parallelism,
              :published_ports, :status, :env, :volumes ]

    attr_accessor(*ATTRS)

    def update params
      response = request method: :put, path: "/services/#{id}", body: params.to_json

      set_attr response['service']

      true
    end

    def start
      request method: :put, path: "/services/#{id}/start"

      true
    end

    def stop
      request method: :put, path: "/services/#{id}/stop"

      true
    end

  end
end
