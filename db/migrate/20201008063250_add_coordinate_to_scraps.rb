class AddCoordinateToScraps < ActiveRecord::Migration[6.0]
  def change
    add_column :scraps, :latitude, :float
    add_column :scraps, :longitude, :float
  end
end
