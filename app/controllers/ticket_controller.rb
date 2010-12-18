class TicketController < ApplicationController

  def list
    @routes = Route.find(:all, :order => 'number')
  end

  def search
     
  end
  
  def match_time()
  @routes_id = []
     @all_routes.map{|i| i = i.id}.each do |e|
       @route_station_trucking = RouteStation.find(:all, :conditions => "route_id = '#{e}' and station_id in (" << @station_trucking )
       @route_station_arrival = RouteStation.find(:all, :conditions => "route_id = '#{e}' and station_id in (" << @station_arrival )
       if(@route_station_trucking.map{|i| i = i.arr_day}.pop < @route_station_arrival.map{|i| i = i.arr_day}.pop )
         @routes_id << e
       elsif(@route_station_trucking.map{|i| i = i.arr_day}.pop  == @route_station_arrival.map{|i| i = i.arr_day}.pop )
         if(@route_station_trucking.map{|i| i = i.arr_hour}.pop < @route_station_arrival.map{|i| i = i.arr_hour}.pop )
           @routes_id << e
         elsif(@route_station_trucking.map{|i| i = i.arr_hour}.pop == @route_station_arrival.map{|i| i = i.arr_hour}.pop)  
           if(@route_station_trucking.map{|i| i = i.arr_minute}.pop <= @route_station_arrival.map{|i| i = i.arr_minute}.pop )
             @routes_id << e
           end
         end
       end
     end
  end    

  def list_route
    if (params['ticket']['transports']!=nil && params['ticket']['transports'].size != 0)
       
       @transport = (params['ticket']['transports']).join(', ') << ')'
       @station_trucking = Station.find(:all, :conditions => "city = '#{params['ticket']['city_station_trucking']}' and transport in (" << @transport).
                           map{|i| i = i.id}.join(', ') << ')'
       @station_arrival = Station.find(:all, :conditions => "city = '#{params['ticket']['city_station_arrival']}' and transport in (" << @transport).
                           map{|i| i = i.id}.join(', ') << ')' 
       @all_routes = ((RouteStation.find(:all, :conditions => "station_id in (" << @station_trucking ).map{|i| i = i.route_id}) &    	 			      (RouteStation.find(:all, :conditions => "station_id in (" << @station_arrival ).map{|i| i = i.route_id})).
                     map{|i| i = Route.find(i)} & Route.find(:all, :conditions => "transport in (" << @transport)
       match_time()
    else
       @station_trucking = Station.find(:all, :conditions => "city = '#{params['ticket']['city_station_trucking']}'").map{|i| i = i.id}.join(', ') << ')'
       @station_arrival = Station.find(:all, :conditions => "city = '#{params['ticket']['city_station_arrival']}'").map{|i| i = i.id}.join(', ') << ')'
       @all_routes = ((RouteStation.find(:all, :conditions => "station_id in (" << @station_trucking).map{|i| i = i.route_id}) &
                 (RouteStation.find(:all, :conditions => "station_id in (" << @station_arrival).map{|i| i = i.route_id})).map{|i| i = Route.find(i)}
       match_time() 
    end
    @routes = Route.find(:all, :conditions => "id in (" << @routes_id.join(', ') << ')', :order => 'transport, number')
    @transports = params['ticket']['transports'].nil? ? [] : params['ticket']['transports'].dup
    @city_trucking = params['ticket']['city_station_trucking']
    @city_arrival = params['ticket']['city_station_arrival']
  end

  def view
    @item = Route.find(params[:id])
    @stations = RouteStation.find(:all, :conditions => "route_id = #{params[:id]}", :order => 'dep_day, dep_hour')
    @dates = RouteDate.find(:all, :conditions => "route_id = #{params[:id]}", :order => 'date')
    @transports = params['transports']
    @city_arrival = params['city_arrival']
    @city_trucking = params['city_trucking'] 
    
  end
 
  
  def list_bus_places
   @route = Route.find(params['ticket']['route_id'])
   @route_id = params['ticket']['route_id']
   @date_trucking = params['ticket']['date_trucking']
   @station_trucking = params['ticket']['station_trucking'] 
   @station_arrival = params['ticket']['station_arrival']
   @time_trucking = params['ticket']['time_trucking'] 
   @time_arrival = params['ticket']['time_arrival']
   d = params['ticket']['date_trucking'].split('-')
   @date = Date.new(d[0].to_i, d[1].to_i, d[2].to_i)
   @dates = RouteDate.find(:all, :conditions => "route_id = #{params['ticket']['route_id']} and date = '#{@date}'").map{|i| i = i.id }.pop
   @places = BusDatePlace.find(:all, :conditions => "route_date_id = #{@dates}", :order => 'place_num')
   @transports = params['transports']
   @city_arrival = params['city_arrival']
   @city_trucking = params['city_trucking'] 
  end

  def b_place
    @route = Route.find(params['ticket']['route_id'])
    @route.transport == 0 ? dp = PlaneDatePlace.find(params[:route_date_id]) : (@route.transport == 1 ? dp = TrainDatePlace.find(params[:route_date_id]) : dp = BusDatePlace.find(params[:route_date_id]))
    p dp
    dp.attributes = {:purchased => true}
    dp.save
    p dp
    function = (@route.transport == 0 ? 'list_plane_places' : (@route.transport == 1 ? 'list_train_places' : 'list_bus_places'))
    redirect_to(:action => function, :ticket => {:route_id => params['ticket']['route_id'], :date_trucking => params['ticket']['date_trucking'], :station_trucking => params['ticket']['station_trucking'], :station_arrival => params['ticket']['station_arrival'], :time_trucking => params['ticket']['time_trucking'], :time_arrival => params['ticket']['time_arrival']})
  end
end
