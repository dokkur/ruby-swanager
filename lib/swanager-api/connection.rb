require 'excon'

module Swanager
  class Connection

    attr_accessor :token, :client

    def initialize token=nil
      @token = token
      @client = Excon.new(url)
    end

  private

    def url
      ENV['SWANAGER_URL'] || 'http://localhost:4945'
    end

  end
end
