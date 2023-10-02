json.extract! user_log, :id, :user_id, :action, :detail, :status, :add_time, :created_at, :updated_at
json.url user_log_url(user_log, format: :json)
