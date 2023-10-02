json.extract! shop_log, :id, :shop_id, :action, :detail, :status, :add_time, :created_at, :updated_at
json.url shop_log_url(shop_log, format: :json)
