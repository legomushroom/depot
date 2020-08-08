class ChangeOrderPayymentTypeId < ActiveRecord::Migration[6.0]
  def up
    remove_column :orders, :payment_type_id
    add_reference :orders, :payment_type, null: false, foreign_key: true
  end

  def down
    add_column :orders, :payment_type_id, :integer
    remove_reference :orders, :payment_type
  end
end
