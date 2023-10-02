if shop_logged_in?
  json.session do
    json.(@shop, :id, :username)
    json.token @shop.authentication_token
  end
end