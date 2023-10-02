# json.partial! "shops/shop", shop: @shop
json.shop do
  json.(@shop, :id, :username, :password, :phone, :open_time, :close_time, :address, :canteen_id, :image_directory, :created_at, :updated_at)
end