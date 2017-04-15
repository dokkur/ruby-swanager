require 'json'

class Swanager::Connection
  include Swanager::Error

  attr_reader :url, :options

  def initialize(url, opts)
    @url, @options = url, opts
  end

  def resource
    Excon.new(url, options)
  end
  private :resource

  def request(*args)
    request_params = compile_request_params(*args)
    request = resource.request(request_params)
    body = request.body
    JSON.parse(body)
  end

  # Delegate all HTTP methods to the #request.
  [:get, :put, :post, :delete].each do |method|
    define_method(method) { |*args| request(method, *args) }
  end


private
  def compile_request_params(http_method, path, query = {}, body = {})
    {
      method:   http_method,
      path:     "/api/v#{Swanager::API_VERSION}#{path}",
      query:    query,
      body:     body.to_json.to_s,
      headers:  { 'Content-Type' => 'application/json',
                  'User-Agent'   => "Dokkur/Swanager-API-Ruby-Client #{Swanager::VERSION}" },
    }
  end
end
