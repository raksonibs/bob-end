class AddNextTurnTurnToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :next_turn, :integer
  end
end
