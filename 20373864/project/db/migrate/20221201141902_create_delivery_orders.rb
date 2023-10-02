class CreateDeliveryOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_orders do |t|
      t.references :transaction_order, null: false, foreign_key: true
      t.references :deliver, null: false, foreign_key: true
      t.time :added_time
      t.time :arrival_time

      t.timestamps
    end
  end
end
