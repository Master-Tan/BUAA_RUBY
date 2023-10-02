class ChangeTimeToStringOnDeliveryOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :delivery_orders, :added_time, :string
    change_column :delivery_orders, :arrival_time, :string
  end
end
