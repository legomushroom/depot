class ChargeOrderJob < ApplicationJob
  queue_as :default

  def perform(order, payment_type_params)
    order.charge!(payment_type_params)
  end
end
