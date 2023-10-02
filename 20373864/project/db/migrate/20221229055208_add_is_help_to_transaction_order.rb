class AddIsHelpToTransactionOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :transaction_orders, :is_help, :boolean
  end
end
