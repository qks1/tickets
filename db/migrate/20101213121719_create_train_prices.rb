class CreateTrainPrices < ActiveRecord::Migration
  def self.up
    create_table :train_prices do |t|
      t.column :route_date_id, :integer, :null => false
      t.column :category_id, :integer, :null => false
      t.column :price, :integer, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :train_prices
  end
end
