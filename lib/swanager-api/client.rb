require 'swanager-api/connection'
require 'swanager-api/errors'
require 'swanager-api/api/api_base'
require 'swanager-api/api/api_object'
require 'swanager-api/api/application_list'
require 'swanager-api/api/service_list'
require 'swanager-api/api/user'

module Swanager
  class Client

    attr_accessor :connection

    def initialize token=nil, url=nil
      @connection = Connection.new token, url
    end

    def applications
      ApplicationList.new(@connection).load
    end

    def services app_id=nil
      ServiceList.new(@connection, app_id).load
    end

    def signin email, password
      User.new(@connection).signin email, password
    end

    def signup email, password
      User.new(@connection).signup email, password
    end

  end
end