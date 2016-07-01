class RemoveMatchIdFromWagers < ActiveRecord::Migration[5.0]
  def change
    remove_column :wagers, :match_id
  end
end
