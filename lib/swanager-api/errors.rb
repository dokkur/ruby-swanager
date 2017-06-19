module Swanager
  module Error
    class Unauthorized < ::StandardError; end
    class Unavailable < ::StandardError; end
    class ServerError < ::StandardError; end
  end
end
