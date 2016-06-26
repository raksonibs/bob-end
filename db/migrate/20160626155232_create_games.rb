class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :type
      t.integer :num_players
      t.string :name

      t.timestamps
    end
  end
end
