class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :product_name
      t.decimal :retail_price
      t.integer :favorites
      t.integer :sales
      t.text :description
      t.string :image_directory
      t.string :product_type
      t.time :added_time

      t.timestamps
    end
  end
end
