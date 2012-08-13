class LongitudeNotLon < ActiveRecord::Migration
  def up
    rename_column :users, :lon, :longitude
  end

  def down
    rename_column :users, :longitude, :lon
  end
end
