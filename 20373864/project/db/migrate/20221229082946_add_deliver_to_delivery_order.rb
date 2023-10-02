class AddDeliverToDeliveryOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :delivery_orders, :deliver, :integer
  end
end
