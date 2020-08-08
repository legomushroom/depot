class AddOrderIdRefToPaymentTypes < ActiveRecord::Migration[6.0]
  def change
    add_reference :payment_types, :order, null: true, foreign_key: true
  end
end
