class AddBusDatePlaces < ActiveRecord::Migration
  def self.up
    dates = RouteDate.find(:all, :conditions => "route_id = 6")
    places = BusUnitPlace.find(:all, :conditions => "unit_id = 8")
    places.each do |p|
      dates.each do |d|
        BusDatePlace.create(:route_date_id => d.id, :place_num => p.number, :purchased => false)
      end
    end
  end

  def self.down
    BusDatePlace.delete_all
  end
end
