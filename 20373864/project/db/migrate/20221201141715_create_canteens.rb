class CreateCanteens < ActiveRecord::Migration[7.0]
  def change
    create_table :canteens do |t|
      t.string :canteen_name

      t.timestamps
    end
  end
end
