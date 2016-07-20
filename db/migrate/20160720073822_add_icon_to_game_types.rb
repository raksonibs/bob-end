class AddIconToGameTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :game_types, :icon, :string
  end
end
