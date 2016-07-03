class AddCurrentUserTurnToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :current_turn, :integer
  end
end
