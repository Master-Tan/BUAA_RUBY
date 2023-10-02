json.extract! product, :id, :shop_id, :product_name, :retail_price, :favorites, :sales, :description,
              :image_directory, :product_type, :added_time, :taste, :created_at, :updated_at
json.url product_url(product, format: :json)
