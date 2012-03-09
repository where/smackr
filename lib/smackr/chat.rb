class Smackr
  class Chat
    attr_reader :chat, :chat_manager
    attr_accessor :message_callback
    attr_accessor :messages

    def initialize(opts={})
      unless opts[:chat_manager]
        raise ArgumentError, ":chat_manager is required"
      end
      unless opts[:target]
        raise ArgumentError, ':target is required'
      end

      @chat_manager = opts[:chat_manager]
      @message_callback = opts[:message_callback]
      self.messages = []
      @chat = self.chat_manager.create_chat(opts[:target],
                                            MessageReceiver.new(:chat => self))
    end

    def send_message(msg)
      if msg.is_a?(String)
        self.chat.send_message(msg)
      else #TODO
        raise Exception, "NOT IMPLEMENTED, SUCKA"
      end
    end

    class MessageReceiver
      include org.jivesoftware.smack.MessageListener
      attr_accessor :chat
      def initialize(opts={})
        self.chat = opts[:chat]
      end
      def process_message(conn, msg)
        chat.messages << msg
        chat.message_callback.call(conn, msg) if chat.message_callback
      end
    end

  end
end
