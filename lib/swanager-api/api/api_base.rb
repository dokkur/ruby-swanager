require 'json'
require 'swanager-api/version'

module Swanager
  class ApiBase

    BASE_PATH = "/api/v#{Swanager::API_VERSION}"

    def initialize connection
      @connection = connection
    end

  private

    def request params
      params[:path] = BASE_PATH + params[:path]
      params.merge!(headers: { 'authorization' => @connection.token })

      response = @connection.client.request params

      case response.status
        when 200, 201 then return JSON.parse(response.body)
        when 401 then raise Swanager::Error::Unauthorized
        else raise Swanager::Error::ServerError.new(response.body.to_s)
      end
    end

  end
end
