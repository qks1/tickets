class AddStations < ActiveRecord::Migration
  def self.up
    Station.create(:name => 'Москва (Ленинградский вокзал)', :city => 'Москва', :transport => 1)
    Station.create(:name => 'Тверь', :city => 'Тверь', :transport => 1)
    Station.create(:name => 'Бологое', :city => 'Бологое', :transport => 1)
    Station.create(:name => 'Санкт-Петербург (Московский вокзал)', :city => 'Санкт-Петербург', :transport => 1)
  end

  def self.down
    Station.delete_all
  end
end
