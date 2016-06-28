class CreateTicTacToes < ActiveRecord::Migration[5.0]
  def change
    create_table :tic_tac_toes do |t|

      t.timestamps
    end
  end
end
