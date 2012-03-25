require 'helper'

class TestMessage < Test::Unit::TestCase
  should "The Truth" do
    assert true
  end
  should "Normal message create" do
    message = Message.new
    assert message
  end
end
