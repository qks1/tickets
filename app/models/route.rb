class Route < ActiveRecord::Base
  validates_presence_of :provider_id,
    :message => 'Должен быть указан поставщик'
  validates_presence_of :number,
    :message => 'Должен быть указан номер маршрута'
  validates_presence_of :transport,
    :message => 'Должен быть указан вид транспорта'

  belongs_to :provider
  has_many :route_stations
  has_many :route_dates

end
