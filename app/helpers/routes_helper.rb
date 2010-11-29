module RoutesHelper

  $months = ['января', 'февраля', 'марта', 'апреля', 'мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря']
  
  def time_to_string(day, hours, minutes)
    sprintf("%02d:%02d", hours, minutes)
  end
  
  def arr_and_dep(route_id, field)
    ss = RouteStation.find(:all, :conditions => "route_id = #{route_id}", :order => 'dep_day, dep_hour')
    ss.size == 0 ? 'Неизвестно' : ss.first.station.city + ' - ' + ss.last.station.city
  end
    
  def arr_station(route_id)
    as = RouteStation.find(:all, :conditions => "route_id = #{route_id}", :order => 'dep_day, dep_hour').first
    as.nil? ? 'Неизвестно' : as.station.city
  end
  
  def dep_station(route_id)
    ds = RouteStation.find(:all, :conditions => "route_id = #{route_id}", :order => 'dep_day, dep_hour').last
    ds.nil? ?  'Неизвестно' : ds.station.city
  end
  
  def date_format(date)
    date.nil? ? "Неизвестно" : "#{date.day} #{$months[date.mon-1]}"
  end
  
  def print_dates(dates)
    dates.size == 0 ? 'Нет данных' : dates.map{|d| d = date_format(d.date)}.join(', ') + '.'
  end
  
end
