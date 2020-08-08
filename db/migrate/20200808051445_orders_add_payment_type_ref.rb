class OrdersAddPaymentTypeRef < ActiveRecord::Migration[6.0]
  def up
    add_reference :orders, :payment_type, null: false, foreign_key: true
  end

  def up
    remove_reference :orders, :payment_type
  end
end
