class AddTrainDatePlaces < ActiveRecord::Migration
  def self.up
  #маршруты 1 и 3: на каждую дату добавляем 8 плацкартных, 2 сидячих, 6 купейных и 2 люкс
    dates = RouteDate.find(:all, :conditions => "route_id = 1 or route_id = 3")
    places = WagonUnitPlace.find(:all, :conditions => "unit_id = 1")
    places.each do |p|
      dates.each do |d|
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 1, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 2, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 3, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 4, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 5, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 6, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 7, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 8, :place_num => p.number, :category => p.category, :purchased => false)
      end
    end
    places = WagonUnitPlace.find(:all, :conditions => "unit_id = 2")
    places.each do |p|
      dates.each do |d|
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 9, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 10, :place_num => p.number, :category => p.category, :purchased => false)
      end
    end
    places = WagonUnitPlace.find(:all, :conditions => "unit_id = 3")
    places.each do |p|
      dates.each do |d|
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 11, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 12, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 13, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 14, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 15, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 16, :place_num => p.number, :category => p.category, :purchased => false)
      end
    end
    places = WagonUnitPlace.find(:all, :conditions => "unit_id = 4")
    places.each do |p|
      dates.each do |d|
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 17, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 18, :place_num => p.number, :category => p.category, :purchased => false)
      end
    end
    
  #маршрут 2: на каждую дату добавляем 6 плацкартных, 4 сидячих и 2 купейных
    dates = RouteDate.find(:all, :conditions => "route_id = 2")
    places = WagonUnitPlace.find(:all, :conditions => "unit_id = 1")
    places.each do |p|
      dates.each do |d|
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 1, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 2, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 3, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 4, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 5, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 6, :place_num => p.number, :category => p.category, :purchased => false)
      end
    end
    places = WagonUnitPlace.find(:all, :conditions => "unit_id = 2")
    places.each do |p|
      dates.each do |d|
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 7, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 8, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 9, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 10, :place_num => p.number, :category => p.category, :purchased => false)
      end
    end
    places = WagonUnitPlace.find(:all, :conditions => "unit_id = 3")
    places.each do |p|
      dates.each do |d|
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 11, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 12, :place_num => p.number, :category => p.category, :purchased => false)
      end
    end 
    
  #маршрут 7: на каждую дату добавляем 4 плацкартных и 6 сидячих
    dates = RouteDate.find(:all, :conditions => "route_id = 2")
    places = WagonUnitPlace.find(:all, :conditions => "unit_id = 1")
    places.each do |p|
      dates.each do |d|
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 1, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 2, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 3, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 4, :place_num => p.number, :category => p.category, :purchased => false)
      end
    end
    places = WagonUnitPlace.find(:all, :conditions => "unit_id = 2")
    places.each do |p|
      dates.each do |d|
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 5, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 6, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 7, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 8, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 9, :place_num => p.number, :category => p.category, :purchased => false)
        TrainDatePlace.create(:route_date_id => d.id, :wagon_number => 10, :place_num => p.number, :category => p.category, :purchased => false)
      end
    end
 
  end

  def self.down
    TrainDatePlace.delete_all
  end
end
