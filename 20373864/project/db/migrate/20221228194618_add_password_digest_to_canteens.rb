class AddPasswordDigestToCanteens < ActiveRecord::Migration[7.0]
  def change
    add_column :canteens, :password_digest, :string
  end
end
