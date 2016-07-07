class CreateMovers < ActiveRecord::Migration[5.0]
  def change
    create_table :movers do |t|
      t.references :match
      t.references :game_type
      t.timestamps
    end
  end
end
