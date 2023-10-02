class CreateTransactionItems < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.references :transaction_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
