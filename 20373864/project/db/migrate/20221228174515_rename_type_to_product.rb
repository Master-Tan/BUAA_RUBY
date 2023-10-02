class RenameTypeToProduct < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :type, :dish_type
  end
end
