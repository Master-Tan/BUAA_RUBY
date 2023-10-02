if deliver_logged_in?
  json.session do
    json.(@deliver, :id, :username)
    json.token @deliver.authentication_token
  end
end