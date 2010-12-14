class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.column :id_station_tracking :integer, :null => false
      t.column :id_sattion_arrival :integer, :null => false
      t.column :date, :date
      t.column :transports[], :massiv
      t.column :route_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
