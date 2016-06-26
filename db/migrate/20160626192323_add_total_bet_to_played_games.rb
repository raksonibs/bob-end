class AddTotalBetToPlayedGames < ActiveRecord::Migration[5.0]
  def change
    add_column :played_games, :total_bet, :decimal
  end
end
