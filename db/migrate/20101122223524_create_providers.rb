class CreateProviders < ActiveRecord::Migration
  def self.up
    create_table :providers do |t|
      t.column :company_name, :text, :null => false
      t.column :reg_number, :text, :null => false
      t.column :jur_address, :text, :null => false
      t.column :fact_address, :text, :null => false
      t.column :phone, :integer, :null => false
      t.column :email, :text, :null => false
      t.column :site, :text,

      t.timestamps
    end
  end

  def self.down
  end
end
