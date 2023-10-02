if user_logged_in?
  json.session do
    json.(@user, :id, :username)
    json.token @user.authentication_token
  end
end