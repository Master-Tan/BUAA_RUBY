class AddAuthenticationTokenToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :authentication_token, :string
  end
end
