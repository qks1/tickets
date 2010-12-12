class CreateRouteStations < ActiveRecord::Migration
  def self.up
    create_table :route_stations do |t|
      t.column :route_id, :integer, :null => false
      t.column :station_id, :integer, :null => false
      t.column :arr_day, :integer, :null => false
      t.column :arr_hour, :integer, :null => false
      t.column :arr_minute, :integer, :null => false
      t.column :dep_day, :integer, :null => false
      t.column :dep_hour, :integer, :null => false
      t.column :dep_minute, :integer, :null => false
      
      t.timestamps
    end
    
    RouteStation.create(:route_id => 1, :station_id => 5, :arr_day => 0, :arr_hour => 7, :arr_minute => 0, :dep_day => 0, :dep_hour => 7, :dep_minute => 0)
    RouteStation.create(:route_id => 1, :station_id => 6, :arr_day => 0, :arr_hour => 9, :arr_minute => 0, :dep_day => 0, :dep_hour => 9, :dep_minute => 10)
    RouteStation.create(:route_id => 1, :station_id => 8, :arr_day => 0, :arr_hour => 14, :arr_minute => 0, :dep_day => 0, :dep_hour => 14, :dep_minute => 0)
    RouteStation.create(:route_id => 2, :station_id => 9, :arr_day => 0, :arr_hour => 13, :arr_minute => 0, :dep_day => 0, :dep_hour => 13, :dep_minute => 0)
    RouteStation.create(:route_id => 2, :station_id => 11, :arr_day => 0, :arr_hour => 15, :arr_minute => 0, :dep_day => 0, :dep_hour => 15, :dep_minute => 25)
    RouteStation.create(:route_id => 2, :station_id => 12, :arr_day => 0, :arr_hour => 19, :arr_minute => 0, :dep_day => 0, :dep_hour => 19, :dep_minute => 0)
    RouteStation.create(:route_id => 3, :station_id => 5, :arr_day => 0, :arr_hour => 23, :arr_minute => 0, :dep_day => 0, :dep_hour => 23, :dep_minute => 0)
    RouteStation.create(:route_id => 3, :station_id => 8, :arr_day => 1, :arr_hour => 7, :arr_minute => 0, :dep_day => 1, :dep_hour => 7, :dep_minute => 0)
    RouteStation.create(:route_id => 4, :station_id => 1, :arr_day => 0, :arr_hour => 12, :arr_minute => 0, :dep_day => 0, :dep_hour => 12, :dep_minute => 0)
    RouteStation.create(:route_id => 4, :station_id => 3, :arr_day => 0, :arr_hour => 14, :arr_minute => 0, :dep_day => 0, :dep_hour => 14, :dep_minute => 0)
    RouteStation.create(:route_id => 5, :station_id => 2, :arr_day => 0, :arr_hour => 16, :arr_minute => 0, :dep_day => 0, :dep_hour => 16, :dep_minute => 0)
    RouteStation.create(:route_id => 5, :station_id => 4, :arr_day => 0, :arr_hour => 20, :arr_minute => 0, :dep_day => 0, :dep_hour => 20, :dep_minute => 0)
    RouteStation.create(:route_id => 6, :station_id => 13, :arr_day => 0, :arr_hour => 10, :arr_minute => 0, :dep_day => 0, :dep_hour => 10, :dep_minute => 0)
    RouteStation.create(:route_id => 6, :station_id => 15, :arr_day => 0, :arr_hour => 22, :arr_minute => 0, :dep_day => 0, :dep_hour => 22, :dep_minute => 0)
    RouteStation.create(:route_id => 7, :station_id => 9, :arr_day => 0, :arr_hour => 22, :arr_minute => 20, :dep_day => 0, :dep_hour => 22, :dep_minute => 20)
    RouteStation.create(:route_id => 7, :station_id => 10, :arr_day => 1, :arr_hour => 2, :arr_minute => 21, :dep_day => 1, :dep_hour => 2, :dep_minute => 31)
    RouteStation.create(:route_id => 7, :station_id => 18, :arr_day => 1, :arr_hour => 5, :arr_minute => 0, :dep_day => 1, :dep_hour => 5, :dep_minute => 0)
  end

  def self.down
    RouteStation.delete_all
    drop_table :route_stations
  end
end
