class AddUniqueConstraintToCanteens < ActiveRecord::Migration[7.0]
  def change
    add_index :canteens, :canteen_name, unique: true
  end
end
