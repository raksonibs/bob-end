class RemoveNumPlayersAndNameFromGames < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :num_players
    remove_column :games, :name
  end
end
