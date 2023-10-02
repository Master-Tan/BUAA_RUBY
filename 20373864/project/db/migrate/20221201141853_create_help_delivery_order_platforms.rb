class CreateHelpDeliveryOrderPlatforms < ActiveRecord::Migration[7.0]
  def change
    create_table :help_delivery_order_platforms do |t|
      t.references :help_delivery_order, null: false, foreign_key: true
      t.time :add_time
      t.string :image_directory
      t.string :detail

      t.timestamps
    end
  end
end
