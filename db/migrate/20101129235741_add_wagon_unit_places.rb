class AddWagonUnitPlaces < ActiveRecord::Migration
  def self.up
    1.step(35, 2){|i| WagonUnitPlace.create(:unit_id => 1, :number => i,:category => 0)}
    2.step(36, 2){|i| WagonUnitPlace.create(:unit_id => 1, :number => i,:category => 1)}
    37.step(53, 2){|i| WagonUnitPlace.create(:unit_id => 1, :number => i,:category => 2)}
    38.step(54, 2){|i| WagonUnitPlace.create(:unit_id => 1, :number => i,:category => 3)}
    1.upto(43){|i| WagonUnitPlace.create(:unit_id => 2, :number => i,:category => 4)}
    1.step(35, 2){|i| WagonUnitPlace.create(:unit_id => 3, :number => i,:category => 5)}
    2.step(36, 2){|i| WagonUnitPlace.create(:unit_id => 3, :number => i,:category => 6)}
    1.upto(16){|i| WagonUnitPlace.create(:unit_id => 4, :number => i,:category => 7)}
  end

  def self.down
    WagonUnitPlace.delete_all
  end
end
