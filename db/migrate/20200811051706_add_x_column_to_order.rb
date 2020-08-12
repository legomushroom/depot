class AddXColumnToOrder < ActiveRecord::Migration[6.0]
  def up
    add_column :orders, :shipped_date, :timestamp
  end

  def down
    remove_column :orders, :shipped_date
  end
end
