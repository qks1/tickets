class CreateStations < ActiveRecord::Migration
  def self.up
    create_table :stations do |t|
      t.column :name, :text, :null => false
      t.column :city, :text, :null => false
      t.column :transport, :integer, :null => false

      t.timestamps
    end
    
    Station.create(:name => 'Москва (Шереметьево)', :city => 'Москва', :transport => 0)
    Station.create(:name => 'Москва (Домодедово)', :city => 'Москва', :transport => 0)
    Station.create(:name => 'Санкт-Петербург (Пулково)', :city => 'Санкт-Петербург', :transport => 0)
    Station.create(:name => 'Париж (Орли)', :city => 'Париж', :transport => 0)
    Station.create(:name => 'Москва (Ленинградский вокзал)', :city => 'Москва', :transport => 1)
    Station.create(:name => 'Тверь', :city => 'Тверь', :transport => 1)
    Station.create(:name => 'Бологое', :city => 'Бологое', :transport => 1)
    Station.create(:name => 'Санкт-Петербург (Московский вокзал)', :city => 'Санкт-Петербург', :transport => 1)
    Station.create(:name => 'Москва (Ярославский вокзал)', :city => 'Москва', :transport => 1)
    Station.create(:name => 'Ярославль-главный', :city => 'Ярославль', :transport => 1)
    Station.create(:name => 'Владимир', :city => 'Владимир', :transport => 1)
    Station.create(:name => 'Нижний Новгород-Московский', :city => 'Нижний Новгород', :transport => 1)
    Station.create(:name => 'Москва (подворотня)', :city => 'Москва', :transport => 2)
    Station.create(:name => 'Санкт-Петербург (центральный автовокзал)', :city => 'Санкт-Петербург', :transport => 2)
    Station.create(:name => 'Воронеж (автовокзал)', :city => 'Воронеж', :transport => 2)
    Station.create(:name => 'Хельсинки (порт)', :city => 'Хельсинки', :transport => 3)
    Station.create(:name => 'Стокгольм (порт)', :city => 'Стокгольм', :transport => 3)
    Station.create(:name => 'Кострома', :city => 'Кострома', :transport => 1)
  end

  def self.down
    Station.delete_all
    drop_table :stations
  end
end
