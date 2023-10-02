json.extract! delivery_order, :id, :transaction_order_id, :deliver, :added_time, :arrival_time, :created_at, :updated_at
json.url delivery_order_url(delivery_order, format: :json)
