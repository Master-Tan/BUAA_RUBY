class CreateHelpDeliveryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :help_delivery_items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :detail
      t.references :help_delivery_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
