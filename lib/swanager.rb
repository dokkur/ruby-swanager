require 'json'
require 'excon'
require 'rubygems/package'
require 'uri'
require 'open-uri'

module Swanager
  attr_accessor :creds, :logger

  require 'swanager/error'
  require 'swanager/connection'
  require 'swanager/base'
  require 'swanager/version'

  require 'swanager/user'

  def env_url
    ENV['SWANAGER_URL'] || 'http://localhost:4945'
  end

  def env_options
    {}
  end

  def url
    @url ||= env_url
  end

  def options
    @options ||= env_options
  end

  def url=(new_url)
    @url = new_url
    reset_connection!
  end

  def options=(new_options)
    @options = env_options.merge(new_options || {})
    reset_connection!
  end

  def connection
    @connection ||= Connection.new(url, options)
  end

  def reset!
    @url = nil
    @options = nil
    reset_connection!
  end

  def reset_connection!
    @connection = nil
  end

  module_function :env_url, :url, :url=, :env_options,
                  :options, :options=, :creds, :creds=, :logger, :logger=,
                  :connection, :reset!, :reset_connection!
end
