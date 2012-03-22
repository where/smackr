class Packet
  class Message
    attr_reader :message_type
    @@message_require
    {
    :normal => {},
    :chat => ,
    :group_chat => ,
    :headline => ,
    :error => 
    }

    def initialize(opts={})
      unless
        unless opts[:message_type]
          :message_type = 'normal'
        end
        else if :message_type == 'error'
          if opts[:subject] || opts[:thread] || opts[:body]
            raise ArgumentError, ':error can be the only argument in an error message'
          end
        end

      end
    end

    end
  class Presence

  end
  class IQ

  end
end
