class LatitudeNotLat < ActiveRecord::Migration
  def up
    rename_column :users, :lat, :latitude
  end

  def down
    rename_column :users, :latitude, :lat
  end
end
