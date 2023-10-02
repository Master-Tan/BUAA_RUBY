class AddPasswordDigestToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :password_digest, :string
  end
end
