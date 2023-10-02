class AddPasswordToCanteen < ActiveRecord::Migration[7.0]
  def change
    add_column :canteens, :password, :string
  end
end
