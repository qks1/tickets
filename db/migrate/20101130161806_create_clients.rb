class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
			t.references	:user
			t.column :surname, :text
			t.column :name, :text
			t.column :patronic, :text
			t.column :birth_date, :datetime
			t.column :banned, :boolean
      t.timestamps
    end

	Client.create(:surname => "Smith",
								:name => "Dave",
								:patronic => "",
								:birth_date => "11.12.1990",
								:banned => false
								)


  end

  def self.down
		Client.delete_all
    drop_table :clients
  end
end
