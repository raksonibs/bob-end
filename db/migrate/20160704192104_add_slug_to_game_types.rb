class AddSlugToGameTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :game_types, :slug, :string
  end
end
