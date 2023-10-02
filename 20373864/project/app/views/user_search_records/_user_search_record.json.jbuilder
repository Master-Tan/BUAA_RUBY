json.extract! user_search_record, :id, :user_id, :content, :add_time, :created_at, :updated_at
json.url user_search_record_url(user_search_record, format: :json)
