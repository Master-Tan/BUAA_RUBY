# json.partial! "users/user", user: @user
json.user do
  json.(@user, :id, :username, :password, :phone, :email, :address, :created_at, :updated_at)
end
