class AddAuthenticationTokenToDelivers < ActiveRecord::Migration[7.0]
  def change
    add_column :delivers, :authentication_token, :string
  end
end
