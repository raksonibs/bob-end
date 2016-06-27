class RemoveTypeFromGame < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :type
  end
end
