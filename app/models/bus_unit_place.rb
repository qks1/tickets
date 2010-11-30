class BusUnitPlace < ActiveRecord::Base
  validates_presence_of :unit_id,
    :message => 'Должен быть указан соответствующий тип автобуса'
  validates_presence_of :number,
    :message => 'Должен быть указан номер места'
    
  belongs_to :unit
end
