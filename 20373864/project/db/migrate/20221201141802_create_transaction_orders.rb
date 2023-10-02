class CreateTransactionOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_orders do |t|
      t.time :added_time
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.string :delivery_address
      t.string :delivery_phone
      t.string :order_status
      t.decimal :delivery_money
      t.decimal :packing_money
      t.decimal :discount_money
      t.decimal :pay_money

      t.timestamps
    end
  end
end
