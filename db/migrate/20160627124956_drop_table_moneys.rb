class DropTableMoneys < ActiveRecord::Migration[5.0]
  def change
    drop_table :money
  end
end
