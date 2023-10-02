class CreateDeliveryAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :phone
      t.boolean :default
      t.string :building
      t.integer :floor
      t.string :complete_address
      t.string :tag

      t.timestamps
    end
  end
end
