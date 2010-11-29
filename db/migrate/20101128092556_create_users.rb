class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
			t.column :username, :text
			t.column :password, :text
			t.column :email, :text
			t.column :created_at, :datetime
			t.column :type, :integer
      t.timestamps
    end

		User.create(:username => 'ololo', 
								:password => 'ololo',
								:email => 'aaa@aa.aa',
								:created_at => '12.12.2010'
								)

	end

  def self.down
		User.delete_all
    drop_table :users
  end
end
