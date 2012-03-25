class Packet
  class Message
    attr_accessor :message_type, :subject, :thread, :body, :error
    
    def initialize
      puts 'message init started'
      # if :message_type == 'error'
      #   if opts[:subject] || opts[:thread] || opts[:body]
      #     raise ArgumentError, ':error can be the only argument in an error message'
      #   end
      # end
      # 
      # @message_type = opts[:message_type]
      # @subject = opts[:subject]
      # @thread = opts[:thread]
      # @body = opts[:body]
      # @error = opts[:error]
      
      # self.message_type = opts[:message_type]
      # self.subject = opts[:subject]
      # self.thread = opts[:thread]
      # self.body = opts[:body]
      # self.error = opts[:error]
    end
  end
  class Presence
  end
  class IQ
  end
end
