class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :username
      t.string :password
      t.string :phone
      t.time :open_time
      t.time :close_time
      t.string :address
      t.references :canteen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
