class RemoveFkFromDeliveryOrder < ActiveRecord::Migration[7.0]
  def change
    remove_reference :delivery_orders, :deliver, foreign_key: true
  end
end
