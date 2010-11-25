class Station < ActiveRecord::Base
  validates_presence_of :name,
    :message => 'Станция не может быть безымянной'
  validates_presence_of :city,
    :message => 'Укажите населённый пункт, в котором находится станция'
  validates_presence_of :transport,
    :message => 'Укажите вид транспорта'
  validates_inclusion_of :transport,
    :in => 0..3,
    :message => 'Возможно только 4 вида транспорта'
    
  has_many :route_stations

  def before_validation()
    self.attribute_names.each do |n|
      self[n] = self[n].strip if self[n].kind_of?(String)
    end
  end
end
