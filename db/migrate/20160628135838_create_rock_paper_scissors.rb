class CreateRockPaperScissors < ActiveRecord::Migration[5.0]
  def change
    create_table :rock_paper_scissors do |t|

      t.timestamps
    end
  end
end
