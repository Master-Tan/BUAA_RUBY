json.extract! delivery_address, :id, :user_id, :phone, :default, :building, :floor, :complete_address, :tag, :created_at, :updated_at
json.url delivery_address_url(delivery_address, format: :json)
