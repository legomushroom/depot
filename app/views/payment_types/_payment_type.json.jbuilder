json.extract! payment_type, :id, :name, :type, :created_at, :updated_at
json.url payment_type_url(payment_type, format: :json)
