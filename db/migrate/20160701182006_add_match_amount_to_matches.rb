class AddMatchAmountToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :match_amount, :decimal
  end
end
