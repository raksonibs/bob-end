class AddMatchIdToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :match_id, :integer
    remove_column :matches, :game_id
    add_column :matches, :game_type_id, :integer
  end
end
