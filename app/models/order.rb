require 'pago'

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

    def charge!(pay_type_params)
        payment_details = {}
        payment_method = nil

        case payment_type_id
        when 1
            payment_mathod = :check
            payment_details[:routing] = pay_type_params[:routing_number]
            payment_details[:account] = pay_type_params[:account_number]
        when 2
            payment_method = :credit_card
            month, year = pay_type_params[:expiration_date].spli '//'
            payment_details[:cc_num] = pay_type_params[:credit_card_number]
            payment_details[:expiration_month] = month
            payment_details[:expiration_year] = year
        when 3
            payment_method = :po
            payment_details[:po_num] = pay_type_params[:po_number]
        end

        result = Pago.make_payment(
            order_id: id,
            payment_method: payment_mathod,
            payment_details: payment_details
        )

        if result.succeeded?
            OrderMailer.received(self).deliver_later
        else
            raise payment_result.error
        end
    end

    private

    def payment_type_present()
        pt = PaymentType.find(payment_type_id)
    rescue ActiveRecord::RecordNotFound
            errors.add(:payment_type, "you need to pay!")
    end
end
