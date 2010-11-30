class AddUnits < ActiveRecord::Migration
  def self.up
    Unit.create(:transport => 1, :description => 'Плацкартный вагон (54 места)', :image => 'train_platz1.png')
    Unit.create(:transport => 1, :description => 'Сидячий вагон (43 места)', :image => 'train_sid1.png')
    Unit.create(:transport => 1, :description => 'Купейный вагон (36 мест)', :image => 'train_kupe1.png')
    Unit.create(:transport => 1, :description => 'Люкс (16 мест)', :image => 'train_lux1.png')
    Unit.create(:transport => 0, :description => 'ИЛ-86 (без бизнес-класса)', :image => 'plane_il86.gif')
    Unit.create(:transport => 0, :description => 'ИЛ-86 (с бизнес-классом)', :image => 'plane_il86business.gif')
    Unit.create(:transport => 0, :description => 'Boeing-767', :image => 'plane_boeing767.gif')
    Unit.create(:transport => 2, :description => 'Междугородний автобус (49 мест)', :image => 'bus_scheme1.gif')
  end

  def self.down
    Unit.delete_all
  end
end
