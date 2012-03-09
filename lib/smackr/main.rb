java_import 'org.jivesoftware.smack.XMPPConnection'
java_import 'org.jivesoftware.smack.ChatManager'

class Smackr

  attr_reader :xmpp_connection, :chat_manager
  attr_accessor :server, :username, :password, :resource

  def initialize(opts={})
    [:server, :username, :password, :resource].each do |field|
      self.send("#{field}=", opts[field]) if opts[field]
    end
  end

  ## Connect to the given server, using either the username/password/resource
  ## given (if self.username is non-null), or anonymously (if !self.username).
  ## Returns true on success.
  def connect!
    !! connection
  end

  ## Disconnect from the service and obliterate our xmpp_connection object.
  def disconnect!
    self.xmpp_connection.disconnect if self.xmpp_connection &&
                                       self.xmpp_connection.is_connected
    @xmpp_connection = nil
  end


  ## Return a Smackr::Chat object, given a target user.
  ## Pass in a block expecting |conn, msg| to provide a callback to run
  ## on each message.
  def chat(target, opts={}, &message_callback)
    Smackr::Chat.new(opts.merge(:target => target,
                                :chat_manager => chat_manager,
                                :message_callback => message_callback))
  end


  def join_room(roomname, opts = {}, &message_callback)
    nickname = opts[:nickname] || self.username || 'Bot'
    Smackr::Room.new(opts.merge(:roomname => roomname,
                                :connection => self.xmpp_connection,
                                :nickname => nickname,
                                :message_callback => message_callback))
  end
private

  def connection
    return self.xmpp_connection if self.xmpp_connection &&
                                   self.xmpp_connection.is_connected

    unless self.server
      raise ArgumentError, "You must set the :server field before connecting"
    end

    unless self.xmpp_connection
      @xmpp_connection = XMPPConnection.new(self.server)
    end

    unless self.xmpp_connection.is_connected
      @xmpp_connection.connect
      if self.username
        @xmpp_connection.login(self.username, self.password) #, self.resource)
      else
        @xmpp_connection.login_anonymously
      end
    end

    unless self.xmpp_connection.is_connected
      raise Exception, "Connection to #{self.server} failed"
    end

    unless self.xmpp_connection.is_authenticated
      raise Exception, "Authentication for #{self.server} failed"
    end

    self.xmpp_connection
  end

  def chat_manager
    @chat_manager ||= connection.get_chat_manager
  end

end
