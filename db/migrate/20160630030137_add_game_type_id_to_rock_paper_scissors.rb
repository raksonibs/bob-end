class AddGameTypeIdToRockPaperScissors < ActiveRecord::Migration[5.0]
  def change
    add_column :rock_paper_scissors, :game_type_id, :integer
    add_column :tic_tac_toes, :game_type_id, :integer
    add_column :stixes, :game_type_id, :integer
    add_column :connect_fours, :game_type_id, :integer
    add_column :rock_paper_scissors, :num_players, :integer
    add_column :tic_tac_toes, :num_players, :integer
    add_column :stixes, :num_players, :integer
    add_column :connect_fours, :num_players, :integer
    add_column :rock_paper_scissors, :name, :string
    add_column :tic_tac_toes, :name, :string
    add_column :stixes, :name, :string
    add_column :connect_fours, :name, :string
  end
end
