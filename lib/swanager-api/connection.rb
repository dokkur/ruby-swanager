require 'excon'

module Swanager
  class Connection

    attr_accessor :token, :client, :url

    def initialize token=nil, url=nil
      @token = token
      @url = url
      @client = Excon.new(self.url)
    end

    def url
      @url || ENV['SWANAGER_URL'] || 'http://localhost:4945'
    end

  end
end
