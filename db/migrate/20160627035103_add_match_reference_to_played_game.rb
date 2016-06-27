class AddMatchReferenceToPlayedGame < ActiveRecord::Migration[5.0]
  def change
    add_reference :played_games, :match, foreign_key: true
  end
end
