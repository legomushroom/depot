class ChangeOrderPayTypeType < ActiveRecord::Migration[6.0]
  def up
    remove_column :orders, :pay_type
    add_reference :orders, :payment_type, null: false, foreign_key: true
  end

  def down
    add_column :orders, :pay_type, :integer
    remove_reference :orders, :payment_type
  end
end
