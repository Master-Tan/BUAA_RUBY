# json.partial! "delivers/deliver", deliver: @deliver
json.deliver do
  json.(@deliver, :id, :username, :password, :phone, :created_at, :updated_at)
end