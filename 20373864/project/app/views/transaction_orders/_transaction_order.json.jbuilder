json.extract! transaction_order, :id, :added_time, :user_id, :shop_id, :delivery_address, :delivery_phone, :order_status, :delivery_money, :packing_money, :discount_money, :pay_money, :is_help, :created_at, :updated_at
json.url transaction_order_url(transaction_order, format: :json)
