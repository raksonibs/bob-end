class AddRatingToGameType < ActiveRecord::Migration[5.0]
  def change
    add_column :game_types, :rating, :float, default: 0.0 
  end
end
