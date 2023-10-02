class AddImageDirectoryToShop < ActiveRecord::Migration[7.0]
  def change
    add_column :Shops, :image_directory, :string
  end
end
