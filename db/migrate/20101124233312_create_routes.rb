class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
      t.column :provider_id, :integer, :null => false
      t.column :number, :text, :null => false
      t.column :transport, :integer, :null => false
      t.column :remarks, :text
      
      t.timestamps
    end
    
    Route.create(:provider_id => 2, :transport => 1, :number => '001A')
    Route.create(:provider_id => 2, :transport => 1, :number => '015Ы')
    Route.create(:provider_id => 2, :transport => 1, :number => '211А')
    Route.create(:provider_id => 4, :transport => 0, :number => '121')
    Route.create(:provider_id => 4, :transport => 0, :number => '099')
    Route.create(:provider_id => 3, :transport => 2, :number => '905')
    Route.create(:provider_id => 2, :transport => 1, :number => '148Я')
  end

  def self.down
    Route.delete_all
    drop_table :routes
  end
end
