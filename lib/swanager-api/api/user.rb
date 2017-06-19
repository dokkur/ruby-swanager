module Swanager
  class User < ApiBase

    def signin email, password
      response = request method: :post,
                         path: '/session',
                         body: { email: email, password: password }.to_json

      @connection.token = response['token']['token'] rescue nil
    end

    def signup email, password
      response = request method: :post,
                         path: '/users',
                         body: { email: email,
                                 password: password,
                                 password_confirmation: password }.to_json

    end

  end
end
