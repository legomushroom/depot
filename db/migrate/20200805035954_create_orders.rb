class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.references :payment_type, null: true, foreign_key: true

      t.timestamps
    end
  end
end
