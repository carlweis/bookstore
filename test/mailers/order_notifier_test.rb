require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Railazon Order Confirmation", mail.subject
    assert_equal ["jsmith@example.com"], mail.to
    assert_equal ["orders@railazon.com"], mail.from
    #assert_match(/1 x Product One/, mail.body.encoded)
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Railazon Order Shipped", mail.subject
    assert_equal ["jsmith@example.com"], mail.to
    assert_equal ["orders@railazon.com"], mail.from
    #assert_match(/1 x Product One/, mail.body.encoded)
  end

end
