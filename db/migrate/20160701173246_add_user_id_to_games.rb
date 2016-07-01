class AddUserIdToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :user_id, :integer
    remove_column :games, :rock_paper_scissor_id
    remove_column :games, :tic_tac_toe_id
    remove_column :games, :stix_id
    remove_column :games, :connect_four_id
  end
end
