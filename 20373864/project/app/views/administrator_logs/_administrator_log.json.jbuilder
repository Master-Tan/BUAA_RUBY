json.extract! administrator_log, :id, :administrator_id, :action, :detail, :status, :add_time, :created_at, :updated_at
json.url administrator_log_url(administrator_log, format: :json)
