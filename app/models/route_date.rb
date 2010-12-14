class RouteDate < ActiveRecord::Base
  validates_presence_of :route_id,
    :message => 'Должен быть указан маршрут'
  validates_presence_of :date,
    :message => 'Должна быть указана дата'
    
    belongs_to :route
    has_many :train_date_places
    has_many :plane_date_places
    has_many :bus_date_places
    has_many :train_prices
    has_many :plane_prices
    has_many :bus_prices
end
