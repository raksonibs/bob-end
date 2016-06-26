class CreatePlayedGames < ActiveRecord::Migration[5.0]
  def change
    create_table :played_games do |t|
      t.references :user
      t.references :game
      t.string :outcome

      t.timestamps
    end
  end
end
