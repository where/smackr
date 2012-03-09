java_import 'org.jivesoftware.smackx.muc.MultiUserChat'
java_import 'org.jivesoftware.smackx.muc.DiscussionHistory'
java_import 'org.jivesoftware.smack.SmackConfiguration'

class Smackr
  class Room
    attr_reader :room
    attr_accessor :room_callback
    attr_accessor :messages

    def initialize(opts={})
      [:connection, :roomname, :nickname].each do |field|
        unless opts[field]
          raise ArgumentError, "#{field} is required"
        end
      end

      @room = MultiUserChat.new(opts[:connection], opts[:roomname]);

      history = DiscussionHistory.new;
      unless opts[:history].nil?
        history.set_max_stanzas(opts[:history]);
      end

      @room.join(opts[:nickname], opts[:password], history, SmackConfiguration.get_packet_reply_timeout());
    end
  end
end
