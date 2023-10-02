json.extract! cart_item, :id, :user_id, :product_id, :quantity, :sum_price, :added_time, :created_at, :updated_at
json.url cart_item_url(cart_item, format: :json)
