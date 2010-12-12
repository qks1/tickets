class CreateTrainDatePlaces < ActiveRecord::Migration
  def self.up
    create_table :train_date_places do |t|
      t.column :route_date_id, :integer, :null => false
      t.column :wagon_number, :integer, :null => false
      t.column :place_num, :integer, :null => false
      t.column :category, :integer, :null => false
      t.column :purchased, :boolean, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :train_date_places
  end
end
