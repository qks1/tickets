class RouteDate < ActiveRecord::Base
  validates_presence_of :route_id,
    :message => 'Должен быть указан маршрут'
  validates_presence_of :date,
    :message => 'Должна быть указана дата'
    
    belongs_to :route
end
