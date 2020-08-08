class ChangePaymentTypeTypeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :payment_types, :type, :typeid
  end
end
