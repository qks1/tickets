module TicketHelper

def t_station(route_id, station)
    array = RouteStation.find(:all, :conditions => "route_id = #{route_id} and station_id in (" << station)
    as = array.pop
    as.nil? ? 'Неизвестно' : as.station.name
end

def t_dep_time(route_id, station_trucking)
    array = RouteStation.find(:all, :conditions => "route_id = #{route_id} and station_id in (" << station_trucking)
    elem = array.pop
    as = time_to_string(elem.dep_day, elem.dep_hour, elem.dep_minute)
    as.size == 0 ? 'Неизвестно' : as
end

def t_arr_time(route_id, station_arrival)
    array = RouteStation.find(:all, :conditions => "route_id = #{route_id} and station_id in (" << station_arrival)
    elem = array.pop
    as = time_to_string(elem.arr_day, elem.arr_hour, elem.arr_minute)
    as.size == 0 ? 'Неизвестно' : as
end

def t_dates_list(field, route_id)
    dates = RouteDate.find(:all, :conditions => "route_id = #{route_id}", :order => 'date')
    dat = []
    dat = dates.map{|d| d = date_format(d.date)}
    select_tag(field, options_for_select(dat))
end


end
