class AddBusUnitPlaces < ActiveRecord::Migration
  def self.up
    1.upto(49){|i| BusUnitPlace.create(:unit_id => 8, :number => i)}
  end

  def self.down
    BusUnitPlace.delete_all
  end
end
