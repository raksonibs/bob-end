class CreateStixes < ActiveRecord::Migration[5.0]
  def change
    create_table :stixes do |t|

      t.timestamps
    end
  end
end
