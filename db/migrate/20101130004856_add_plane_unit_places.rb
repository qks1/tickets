class AddPlaneUnitPlaces < ActiveRecord::Migration
  def self.up
    1.upto(10){|i| PlaneUnitPlace.create(:unit_id => 5, :number => i, :category => 2)}
    11.upto(316){|i| PlaneUnitPlace.create(:unit_id => 5, :number => i, :category => 0)}
    1.upto(10){|i| PlaneUnitPlace.create(:unit_id => 6, :number => i, :category => 2)}
    11.upto(68){|i| PlaneUnitPlace.create(:unit_id => 6, :number => i, :category => 1)}
    69.upto(310){|i| PlaneUnitPlace.create(:unit_id => 6, :number => i, :category => 0)}
    1.upto(30){|i| PlaneUnitPlace.create(:unit_id => 7, :number => i, :category => 1)}
    31.upto(219){|i| PlaneUnitPlace.create(:unit_id => 7, :number => i, :category => 0)}
  end

  def self.down
    PlaneUnitPlace.delete_all
  end
end
