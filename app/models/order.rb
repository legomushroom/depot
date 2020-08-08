class Order < ApplicationRecord
    has_one :payment_type
    has_many :line_items, dependent: :destroy
    validates :name, :address, :email, presence: true
    validate :payment_type_present

    def add_line_items_from_cart(cart)
        cart.line_items.each do |item|
            item.cart_id = nil
            line_items << item
        end
    end

    private

    def payment_type_present()
        pt = PaymentType.find(payment_type_id)
    rescue ActiveRecord::RecordNotFound
            errors.add(:payment_type, "you need to pay!")
    end
end
