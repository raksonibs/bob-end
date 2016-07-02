class AddTotalToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :total, :decimal
  end
end
