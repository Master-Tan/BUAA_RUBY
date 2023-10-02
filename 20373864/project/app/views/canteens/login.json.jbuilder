if canteen_logged_in?
  json.session do
    json.(@canteen, :id, :canteen_name)
    json.token @canteen.authentication_token
  end
end