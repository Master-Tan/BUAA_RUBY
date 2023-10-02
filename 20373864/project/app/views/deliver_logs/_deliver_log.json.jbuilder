json.extract! deliver_log, :id, :deliver_id, :action, :detail, :status, :add_time, :created_at, :updated_at
json.url deliver_log_url(deliver_log, format: :json)
