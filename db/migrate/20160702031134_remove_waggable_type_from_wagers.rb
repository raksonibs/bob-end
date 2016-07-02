class RemoveWaggableTypeFromWagers < ActiveRecord::Migration[5.0]
  def change
    remove_column :wagers, :wagable_type
    remove_column :wagers, :wagable_id
  end
end
