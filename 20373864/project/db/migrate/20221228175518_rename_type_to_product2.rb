class RenameTypeToProduct2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :dish_type
  end
end
