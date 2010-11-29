class CreateRouteDates < ActiveRecord::Migration
  def self.up
    create_table :route_dates do |t|
      t.column :route_id, :integer
      t.column :date, :date

      t.timestamps
    end
  end

  def self.down
    drop_table :route_dates
  end
end
