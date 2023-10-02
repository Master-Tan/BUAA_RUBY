if administrator_logged_in?
  json.session do
    json.(@administrator, :id, :username)
    json.token @administrator.authentication_token
  end
end