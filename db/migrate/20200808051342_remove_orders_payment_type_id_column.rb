class RemoveOrdersPaymentTypeIdColumn < ActiveRecord::Migration[6.0]
  def up
    remove_column :orders, :payment_type_id
  end

  def down
    add_column :orders, :payment_type_id, :integer
  end
end
