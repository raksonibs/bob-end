class CreateConnectFours < ActiveRecord::Migration[5.0]
  def change
    create_table :connect_fours do |t|

      t.timestamps
    end
  end
end
