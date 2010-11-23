class CreateStations < ActiveRecord::Migration
  def self.up
    create_table :stations do |t|
      t.column :name, :text, :null => false
      t.column :city, :text, :null => false
      t.column :transport, :integer, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :stations
  end
end
