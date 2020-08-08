class RemovePaymentTypeTypeifColumn < ActiveRecord::Migration[6.0]
  def up
    remove_column :payment_types, :typeid
  end

  def down
    add_column :payment_types, :typeid, :integer
  end
end
