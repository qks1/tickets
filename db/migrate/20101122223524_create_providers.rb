class CreateProviders < ActiveRecord::Migration
  def self.up
    create_table :providers do |t|
      t.column :company_name, :text, :null => false
      t.column :jur_address, :text, :null => false
      t.column :fact_address, :text, :null => false
      t.column :phone, :integer, :null => false
      t.column :email, :text, :null => false
      t.column :site, :text,

      t.timestamps
    end
    
    Provider.create(:company_name => 'ООО "На оленях на край света"', 
                    :jur_address => 'Чукотский АО, г. Анадырь, ул. Абрамовича, д. 1', 
                    :fact_address => 'Чукотский АО, пос. Уэлен, юрта 5',
                    :phone => 4272212345,
                    :email => 'olenitravels@gmail.com',
                    :site => 'www.olenitravels.ru'
                   )
    Provider.create(:company_name => 'ОАО p/d',  
                    :jur_address => 'Москва, ул. Новая Басманная, д.2', 
                    :fact_address => 'Москва, ул. Новая Басманная, д.2',
                    :phone => 4952629901,
                    :email => 'rzd@rzd.ru',
                    :site => 'www.rzd.ru'
                   )
    Provider.create(:company_name => 'ИП Бабаджанян',  
                    :jur_address => 'Санкт-Петербург, Международный проспект, д.16', 
                    :fact_address => 'Санкт-Петербург, Международный проспект, д.16',
                    :phone => 8123123123,
                    :email => 'bbdj@mail.ru'
                   )
     Provider.create(:company_name => 'Аэрофлот',  
                    :jur_address => 'Москва, ул. Арбат, д. 10', 
                    :fact_address => 'Москва, ул. Арбат, д. 10',
                    :phone => 4952235555,
                    :email => 'callcenter@aeroflot.ru',
                    :site => 'www.aeroflot.ru'
                   )
                 
  end

  def self.down
    Provider.delete_all
    drop_table :providers
  end
end
