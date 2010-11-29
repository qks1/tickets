class RouteStation < ActiveRecord::Base
  validates_presence_of :route_id,
    :message => 'Должен быть указан маршрут'
  validates_presence_of :station_id,
    :message => 'Должна быть указана станция'
  validates_presence_of :arr_day,
    :message => 'Должно быть указано время прибытия (день)'
  validates_presence_of :arr_hour,
    :message => 'Должно быть указано время прибытия (часы)'
  validates_presence_of :arr_minute,
    :message => 'Должно быть указано время прибытия (минуты)'
  validates_presence_of :dep_day,
    :message => 'Должно быть указано время отправления (день)'
  validates_presence_of :dep_hour,
    :message => 'Должно быть указано время отправления (часы)'
  validates_presence_of :dep_minute,
    :message => 'Должно быть указано время отправления (минуты)'
    
  belongs_to :route
  belongs_to :station
end
