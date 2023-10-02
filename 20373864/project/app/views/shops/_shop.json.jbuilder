json.extract! shop, :id, :username, :password, :phone, :open_time, :close_time, :address, :canteen_id, :image_directory, :created_at, :updated_at
json.url shop_url(shop, format: :json)
