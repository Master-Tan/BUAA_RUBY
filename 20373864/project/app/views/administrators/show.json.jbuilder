# json.partial! "administrators/administrator", administrator: @administrator
json.administrator do
  json.(@administrator, :id, :username, :password, :phone, :created_at, :updated_at)
end