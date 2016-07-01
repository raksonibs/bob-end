class AddUniqueIdToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :unique_id, :string
  end
end
