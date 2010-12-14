class CreateBusPrices < ActiveRecord::Migration
  def self.up
    create_table :bus_prices do |t|
      t.column :route_date_id, :integer, :null => false
      t.column :price, :integer, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :bus_prices
  end
end
