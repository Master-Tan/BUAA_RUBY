class CreateDeliverLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :deliver_logs do |t|
      t.references :deliver, null: false, foreign_key: true
      t.string :action
      t.string :detail
      t.integer :status
      t.time :add_time

      t.timestamps
    end
  end
end
