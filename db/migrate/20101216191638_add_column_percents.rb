class AddColumnPercents < ActiveRecord::Migration
  def self.up
    add_column :route_stations, :percents, :decimal, :precision => 3, :scale => 2, :null => false, :default => 0
  end

  def self.down
    remove_column :route_stations, :percents
  end
end
