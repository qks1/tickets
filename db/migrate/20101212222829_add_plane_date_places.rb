class AddPlaneDatePlaces < ActiveRecord::Migration
  def self.up
    dates = RouteDate.find(:all, :conditions => "route_id = 4")
    places = PlaneUnitPlace.find(:all, :conditions => "unit_id = 6")
    places.each do |p|
      dates.each do |d|
        PlaneDatePlace.create(:route_date_id => d.id, :place_num => p.number, :category => p.category, :purchased => false)
      end
    end
    
    dates = RouteDate.find(:all, :conditions => "route_id = 5")
    places = PlaneUnitPlace.find(:all, :conditions => "unit_id = 7")
    places.each do |p|
      dates.each do |d|
        PlaneDatePlace.create(:route_date_id => d.id, :place_num => p.number, :category => p.category, :purchased => false)
      end
    end
  end

  def self.down
    PlaneDatePlace.delete_all
  end
end
