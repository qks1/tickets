class CreateBusUnitPlaces < ActiveRecord::Migration
  def self.up
    create_table :bus_unit_places do |t|
      t.column :unit_id, :integer, :null => false
      t.column :number, :integer, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :bus_unit_places
  end
end
