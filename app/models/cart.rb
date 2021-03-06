class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy

    def add_product(product)
        current_item = line_items.find_by(product_id: product.id)
        if current_item
            current_item.quantity += 1
        else
            current_item = line_items.build(product_id: product.id, price: product.price)
        end

        current_item
    end

    def add_products(products)
        products.each do |product|
            self.add_product product
            self.save!
        end
    end

    def total_items
        line_items.count
    end

    def total_price
        line_items.to_a.sum do |item|
            item.total_price
        end
    end
end
