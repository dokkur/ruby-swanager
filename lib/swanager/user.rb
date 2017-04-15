class Swanager::User
  def initialize()
  end

  class << self
    def login(data = nil, conn = Swanager.connection)
      body = conn.post('/session', nil, data)
    end
  end
end
