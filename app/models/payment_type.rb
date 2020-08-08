class PaymentType < ApplicationRecord
    belongs_to :order, required: true, foreign_key: 'order_id'
end
