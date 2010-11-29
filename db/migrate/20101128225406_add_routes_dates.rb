class AddRoutesDates < ActiveRecord::Migration
  def self.up
    for i in 1..31
      RouteDate.create(:route_id => 1, :date => "2010-12-#{i}")
      RouteDate.create(:route_id => 2, :date => "2010-12-#{i}")
      RouteDate.create(:route_id => 3, :date => "2010-12-#{i}")
    end    
    1.step(31, 2) do |i|
      RouteDate.create(:route_id => 4, :date => "2010-12-#{i}")
    end
    
    2.step(31, 2) do |i|
      RouteDate.create(:route_id => 6, :date => "2010-12-#{i}")
    end
    
    3.step(31, 7) do |i|
      RouteDate.create(:route_id => 7, :date => "2010-12-#{i}")
    end
    
    RouteDate.create(:route_id => 5, :date => '2010-12-5')
    RouteDate.create(:route_id => 5, :date => '2010-12-9')
    RouteDate.create(:route_id => 5, :date => '2010-12-12')
    RouteDate.create(:route_id => 5, :date => '2010-12-16')
    RouteDate.create(:route_id => 5, :date => '2010-12-19')
    RouteDate.create(:route_id => 5, :date => '2010-12-23')
    RouteDate.create(:route_id => 5, :date => '2010-12-26')
    RouteDate.create(:route_id => 5, :date => '2010-12-30')    
  end

  def self.down
    RouteDate.delete_all
  end
end
