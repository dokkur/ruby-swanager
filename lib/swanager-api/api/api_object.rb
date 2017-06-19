module Swanager
  class ApiObject < ApiBase

    def initialize connection, params={}
      super connection

      set_attr params
    end

  private

    def set_attr params
      self.class.const_get(:ATTRS).each do |attr|
        next unless params.has_key? attr.to_s
        send "#{attr.to_s}=", params[attr.to_s]
      end
    end

  end
end
