class OrderMailer < ApplicationMailer
  @admin_email = 'Oleg Solomka <legomushroom@gmail.com>'

  default from: @admin_email
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(order)
    @order = order
    mail to: order.email, subject: 'Pragmatic Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped(order)
    @order = order

    puts ">> shipped order email sent"

    mail to: @admin_email, subject: 'Pragmatic Store Order Shipped'
  end

  def failed(order, details)
    @order = order

    puts ">> shipped order email sent"

    mail to: @admin_email, subject: "Omg order failed, details: #{details}"
  end
end
