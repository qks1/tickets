class AddPrices < ActiveRecord::Migration
  def self.up
    dates = RouteDate.find(:all, :conditions => "route_id = 1")
    dates.each do |i|
      (0..3).each{|j| TrainPrice.create(:route_date_id => i.id, :category_id => j, :price => 1200) }
                    TrainPrice.create(:route_date_id => i.id, :category_id => 4, :price => 700)  
      (5..6).each{|j| TrainPrice.create(:route_date_id => i.id, :category_id => j, :price => 2300) }
                    TrainPrice.create(:route_date_id => i.id, :category_id => 7, :price => 8000) 
    end
    dates = RouteDate.find(:all, :conditions => "route_id = 2")
    dates.each do |i|
      (0..3).each{|j| TrainPrice.create(:route_date_id => i.id, :category_id => j, :price => 800)  }
                    TrainPrice.create(:route_date_id => i.id, :category_id => 4, :price => 400)  
      (5..6).each{|j| TrainPrice.create(:route_date_id => i.id, :category_id => j, :price => 1900) }
                    TrainPrice.create(:route_date_id => i.id, :category_id => 7, :price => 7000) 
    end
    dates = RouteDate.find(:all, :conditions => "route_id = 3")
    dates.each do |i|
      (0..3).each{|j| TrainPrice.create(:route_date_id => i.id, :category_id => j, :price => 1800) }
                    TrainPrice.create(:route_date_id => i.id, :category_id => 4, :price => 1200) 
      (5..6).each{|j| TrainPrice.create(:route_date_id => i.id, :category_id => j, :price => 3700) }
                    TrainPrice.create(:route_date_id => i.id, :category_id => 7, :price => 16500)
    end
    dates = RouteDate.find(:all, :conditions => "route_id = 7")
    dates.each do |i|
      (0..3).each{|j| TrainPrice.create(:route_date_id => i.id, :category_id => j, :price => 1000) }
                    TrainPrice.create(:route_date_id => i.id, :category_id => 4, :price => 500)  
      (5..6).each{|j| TrainPrice.create(:route_date_id => i.id, :category_id => j, :price => 1900) }
    end
    dates = RouteDate.find(:all, :conditions => "route_id = 4")
    dates.each do |i|
      PlanePrice.create(:route_date_id => i.id, :category_id => 0, :price => 2300)
      PlanePrice.create(:route_date_id => i.id, :category_id => 1, :price => 4800)
      PlanePrice.create(:route_date_id => i.id, :category_id => 2, :price => 8500)
    end
    dates = RouteDate.find(:all, :conditions => "route_id = 5")
    dates.each do |i|
      PlanePrice.create(:route_date_id => i.id, :category_id => 0, :price => 9400)
      PlanePrice.create(:route_date_id => i.id, :category_id => 1, :price => 14000)
      PlanePrice.create(:route_date_id => i.id, :category_id => 2, :price => 18500)
    end
    dates = RouteDate.find(:all, :conditions => "route_id = 6")
    dates.each do |i|
      BusPrice.create(:route_date_id => i.id, :price => 1000)
    end
  end
  def self.down
    TrainPrice.delete_all
    PlanePrice.delete_all
    BusPrice.delete_all
  end
end
