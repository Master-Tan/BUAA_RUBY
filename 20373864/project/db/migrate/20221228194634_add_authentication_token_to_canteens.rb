class AddAuthenticationTokenToCanteens < ActiveRecord::Migration[7.0]
  def change
    add_column :canteens, :authentication_token, :string
  end
end
