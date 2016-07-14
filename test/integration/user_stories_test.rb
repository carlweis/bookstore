require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products

  test "buying a product" do
    LineItem.delete_all
    Order.delete_all
    product = products(:one)

    # visit the store index
    get '/'
    assert_response :success
    assert_template 'index'

    # add item to cart
    xml_http_request :post, '/line_items', product_id: product.id
    assert_response :success

    # verify item is in cart
    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal product, cart.line_items[0].product

    # checkout
    get '/orders/new'
    assert_response :success
    assert_template 'new'

    # submit order form
    post_via_redirect '/orders', order: {
      name: 'John Smith',
      address: '123 The Street',
      email: 'jsmith@example.com',
      pay_type: 'Credit card'
    }
    assert_response :success
    assert_template 'index'
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size

    # verify order saved to db
    orders = Order.all
    assert_equal 1, orders.size
    order = orders[0]

    # verify order details
    assert_equal 'John Smith', order.name
    assert_equal '123 The Street', order.address
    assert_equal 'jsmith@example.com', order.email
    assert_equal 'Credit card', order.pay_type

    # verify order line_item details
    assert_equal 1, order.line_items.size
    line_item = order.line_items[0]
    assert_equal product, line_item.product

    # verify confirmation email was sent
    mail = ActionMailer::Base.deliveries.last
    assert_equal ['jsmith@example.com'], mail.to
    assert_equal 'Railazon <orders@railazon.com>', mail[:from].value
    assert_equal 'Railazon Order Confirmation', mail.subject

  end
end
