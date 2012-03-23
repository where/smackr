require 'helper'

class TestMessage < Test::Unit::TestCase
  should "Normal message create" do
    Packet.Message.new
  end
end
