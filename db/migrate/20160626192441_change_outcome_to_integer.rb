class ChangeOutcomeToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :played_games, :outcome, 'integer USING CAST(outcome AS integer)'
  end
end
