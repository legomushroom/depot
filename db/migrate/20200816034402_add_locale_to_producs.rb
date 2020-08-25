class AddLocaleToProducs < ActiveRecord::Migration[6.0]
  def up
    add_column :products, :locale, :string, default: 'en'
  end

  def down
    remove_column :products, :locale
  end
end
