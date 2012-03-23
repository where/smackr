require 'helper'

class TestMessage < Test::Unit::TestCase
  should "Normal message create" do
    message = Message.new
    assert message
  end
end
