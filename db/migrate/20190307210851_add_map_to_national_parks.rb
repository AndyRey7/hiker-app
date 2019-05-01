class AddMapToNationalParks < ActiveRecord::Migration[5.2]
  def change
    add_column :national_parks, :map, :string
  end
end
