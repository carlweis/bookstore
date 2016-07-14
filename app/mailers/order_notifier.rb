class OrderNotifier < ApplicationMailer
  default from: 'Railazon <orders@railazon.com>'

  # receive replies to order confirmations
  def receive(message)
    log.info message.inspect
  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order

    mail to: order.email, subject: 'Railazon Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: order.email, subject: 'Railazon Order Shipped'
  end
end
