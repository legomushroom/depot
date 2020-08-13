class PaymentType < ApplicationRecord
    belongs_to :order, required: false, foreign_key: 'order_id'
end
