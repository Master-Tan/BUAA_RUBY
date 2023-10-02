class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :content
      t.integer :score

      t.timestamps
    end
  end
end
