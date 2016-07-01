class AddGameIdToWagers < ActiveRecord::Migration[5.0]
  def change
    add_column :wagers, :game_id, :integer
  end
end
