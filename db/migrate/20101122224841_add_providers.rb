class AddProviders < ActiveRecord::Migration
  def self.up
    Provider.create(:company_name => 'ООО \"На оленях на край света\"', 
                    :reg_number => 'OLOLO666', 
                    :jur_address => 'Чукотский АО, г. Анадырь, ул. Абрамовича, д. 1', 
                    :fact_address => 'Чукотский АО, пос. Уэлен, юрта 5',
                    :phone => 4272212345,
                    :email => 'olenitravels@gmail.com',
                    :site => 'www.olenitravels.ru'
                   )
  end

  def self.down
  end
end
