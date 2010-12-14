class TicketController < ApplicationController
  def list
    @routes = Route.find(:all, :order => 'number')
  end

  def search
    @transport = []
    
  end

  def list_route
      @routes = ((RouteStation.find(:all, :conditions => "station_id = #{params['ticket']['id_station_trucking']}").map{|i| i = i.route_id} & RouteStation.find(:all, :conditions => "station_id = #{params['ticket']['id_station_arrival']}").map{|i| i = i.route_id})).map{|i| i = Route.find(i)}
      @date = params['ticket']['date_trucking']
      
     #@routes = Route.orders.find(:all, :having => "station_id = #{params[ticket][id_station_trucking]}")
     
  end
end
