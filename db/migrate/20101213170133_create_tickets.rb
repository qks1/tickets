class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.column :city_station_tracking, :string, :null => false
      t.column :city_sattion_arrival, :string, :null => false
      t.column :date, :string
      t.column :transport, :string
      t.column :route_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
