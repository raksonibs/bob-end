class ChangeOutcomeToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :played_games, :outcome, :integer, default: nil
  end
end
