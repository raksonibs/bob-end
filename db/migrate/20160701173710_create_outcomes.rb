class CreateOutcomes < ActiveRecord::Migration[5.0]
  def change
    create_table :outcomes do |t|
      t.references :user, foreign_key: true
      t.references :match, foreign_key: true
      t.decimal :amount_won
      t.decimal :amount_taken
      t.decimal :percentage_taken
      t.integer :outcome_value

      t.timestamps
    end
  end
end
