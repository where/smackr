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
      unless opts[:message_type]
        :message_type = 'normal'
        #raise ArgumentError, ':message_type is required'
      end
    end

    class Normal
      attr_accessor :subject, :thread, :body, :error
      def initialize
        if opts[:error]
          raise ArgumentError, ':error cannont be used in a normal message'
        end
        if opts[:subject] and opts[:body]
          raise ArgumentError, 'either :subject or :body is required in normal message'
        end
      end
    end

    class Chat
      attr_accessor :subject, :thread, :body, :error
      def initialize
        if opts[:error]
          raise ArgumentError, ':error cannont be used in a normal message'
        end
        if opts[:thread] and opts[:body]
          raise ArgumentError, 'either :thread or :body is required in normal message'
        end
      end
    end

    class GroupChat
      attr_accessor :subject, :thread, :body, :error
      def initialize
        if opts[:error]
          raise ArgumentError, ':error cannont be used in a normal message'
        end
      end
    end

    class Headline
      attr_accessor :subject, :thread, :body, :error
      def initialize
        if opts[:error]
          raise ArgumentError, ':error cannont be used in a normal message'
        end
      end
    end

    class Error
      attr_accessor :subject, :thread, :body, :error
      def initialize
        unless opts[:error]
          raise ArgumentError, ':error is required'
        end
      end
    end
  end
  class Presence

  end
  class IQ

  end
end
