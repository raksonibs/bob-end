class AddContinentAndCountryToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :country, :string
    add_column :locations, :continent, :string
  end
end
