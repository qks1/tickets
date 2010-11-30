class WagonUnitPlace < ActiveRecord::Base
  validates_presence_of :unit_id,
    :message => 'Должен быть указан соответствующий вагон'
  validates_presence_of :number,
    :message => 'Должен быть указан номер места'
  validates_presence_of :category,
    :message => 'Должна быть указана категория места'
    
  belongs_to :unit
end
