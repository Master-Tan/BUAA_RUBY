class CreateDelivers < ActiveRecord::Migration[7.0]
  def change
    create_table :delivers do |t|
      t.string :username
      t.string :password
      t.string :phone

      t.timestamps
    end
  end
end
