class CreateUserSearchRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :user_search_records do |t|
      t.references :user, null: false, foreign_key: true
      t.string :content
      t.time :add_time

      t.timestamps
    end
  end
end
