class CreateApiSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :api_sessions do |t|

      t.timestamps
    end
  end
end
