class AddTasteToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :taste, :string
  end
end
