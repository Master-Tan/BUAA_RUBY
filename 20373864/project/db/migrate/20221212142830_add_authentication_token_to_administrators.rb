class AddAuthenticationTokenToAdministrators < ActiveRecord::Migration[7.0]
  def change
    add_column :administrators, :authentication_token, :string
  end
end
