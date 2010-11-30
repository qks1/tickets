class CreateWagonUnitPlaces < ActiveRecord::Migration
  def self.up
    create_table :wagon_unit_places do |t|
      t.column :unit_id, :integer, :null => false
      t.column :number, :integer, :null => false
      t.column :category, :integer, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :wagon_unit_places
  end
end
