class AddGamesToAllGamesCurrently < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :tic_tac_toe_id, :integer
    add_column :games, :connect_four_id, :integer
    add_column :games, :stix_id, :integer
    add_column :games, :rock_paper_scissor_id, :integer
    add_column :games, :game_type_id, :integer
  end
end
