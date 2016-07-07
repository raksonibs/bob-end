class CreateMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.references :user 
      t.references :mover
      t.string :option
      t.text :choices, array: true, default: []
      t.timestamps
    end
  end
end
