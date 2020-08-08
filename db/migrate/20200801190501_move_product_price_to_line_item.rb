class MoveProductPriceToLineItem < ActiveRecord::Migration[6.0]
  def up
    LineItem.all.each do |line_item|
      line_item.price = line_item.product.price
      line_item.save!
    end
  end

  def dow
    LineItem.all.each do |line_item|
      line_item.price = 0
    end
  end
end
