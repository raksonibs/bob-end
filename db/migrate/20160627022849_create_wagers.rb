class CreateWagers < ActiveRecord::Migration[5.0]
  def change
    create_table :wagers do |t|
      t.string :wagable_type
      t.integer :wagable_id
      t.decimal :amount

      t.timestamps
    end
  end
end
