class TicketController < ApplicationController

	# функция определния правильной последовательности выбранных городов
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
               
    		if (params['search']['transports']!=nil && params['search']['transports'].size != 0)
       
       			@transport = (params['search']['transports']).join(', ') << ')'
       			@station_trucking = Station.find(:all, :conditions =>  "city = '#{params['search']['city_station_trucking']}' and 
										transport in (" << @transport).map{|i| i = i.id}.join(', ') << ')'
       			@station_arrival = Station.find(:all, :conditions => "city = '#{params['search']['city_station_arrival']}' and 
								      	transport in (" << @transport).map{|i| i = i.id}.join(', ') << ')' 
		
			#все маршруты выбранных видов транспорта проходящие через данные города 
       			@all_routes = ((RouteStation.find(:all, :conditions => "station_id in (" << @station_trucking ).map{|i| i = i.route_id}) & 				       	       (RouteStation.find(:all, :conditions => "station_id in (" << @station_arrival ).map{|i| i = i.route_id})).
				       map{|i| i = Route.find(i)} & Route.find(:all, :conditions => "transport in (" << @transport)
       			match_time()
    		elsif
       			@station_trucking = Station.find(:all, :conditions => "city = '#{params['search']['city_station_trucking']}'").
			map{|i| i =i.id}.join(', ') << ')'
       			@station_arrival = Station.find(:all, :conditions => "city = '#{params['search']['city_station_arrival']}'").
			map{|i| i = i.id}.join(', ') << ')'

                	#все маршруты проходящие через данные города независимо от вида транспорта
       			@all_routes = ((RouteStation.find(:all, :conditions => "station_id in (" << @station_trucking).map{|i| i = i.route_id}) &
                 		       (RouteStation.find(:all, :conditions => "station_id in (" << @station_arrival).map{|i| i = i.route_id})).
				       map{|i| i = Route.find(i)}
       			match_time()                       
    		end

        	#все маршруты выбранных видов транспорта проходящие через данные города в правильной последовательности
    		@routes = Route.find(:all, :conditions => "id in (" << @routes_id.join(', ') << ')', :order => 'transport, number')

    		@transports = params['search']['transports'].nil? ? [] : params['search']['transports'].dup
    		@city_trucking = params['search']['city_station_trucking']
    		@city_arrival = params['search']['city_station_arrival']
  	end

  	def view
    		@item = Route.find(params[:id])
    		@stations = RouteStation.find(:all, :conditions => "route_id = #{params[:id]}", :order => 'dep_day, dep_hour')
    		@dates = RouteDate.find(:all, :conditions => "route_id = #{params[:id]}", :order => 'date')
		
		#параметры для возрата в найденным маршрутам
    		@transports = params[:transports]
    		@city_arrival = params[:city_arrival]
    		@city_trucking = params[:city_trucking] 
  	end

def list_train_places
	
		@route_id = params['ticket']['route_id']
		@date_trucking = params['ticket']['date_trucking']
		@station_trucking = params['ticket']['station_trucking'] 
		@station_arrival = params['ticket']['station_arrival']
		@time_trucking = params['ticket']['time_trucking'] 
		@time_arrival = params['ticket']['time_arrival']
              
		#параметры для возрата в найденным маршрутам
		@transports = params['transports']
		@city_arrival = params['city_arrival']
		@city_trucking = params['city_trucking'] 
	end	

	def list_plane_places
	
		@route_id = params['ticket']['route_id']
		@date_trucking = params['ticket']['date_trucking']
		@station_trucking = params['ticket']['station_trucking'] 
		@station_arrival = params['ticket']['station_arrival']
		@time_trucking = params['ticket']['time_trucking'] 
		@time_arrival = params['ticket']['time_arrival']
                
		@route = Route.find(params['ticket']['route_id'])
		d = params['ticket']['date_trucking'].split('-')
   		@date = Date.new(d[0].to_i, d[1].to_i, d[2].to_i)

                id_station = Station.find(:all, :conditions => "name = '#{@station_arrival}'").pop.id
    	        @route_station = RouteStation.find(:all, :conditions => "route_id = #{@route_id} and station_id = #{id_station}").pop
                a = @route_station.arr_day.to_i
                @date_arrival = Date.new(d[0].to_i, d[1].to_i, (d[2].to_i+ a)).to_s.split('-')
		@k = @route_station.percents
                     
		#дата, номер маршрута => номер даты маршрута
   		@dates = RouteDate.find(:all, :conditions => "route_id = #{params['ticket']['route_id']} and date = '#{@date}'").map{|i| i = i.id }.pop
		#номер даты маршрута => все места по этому маршруту в данную дату
		@places = PlaneDatePlace.find(:all, :conditions => "route_date_id = #{@dates}", :order => 'place_num')
		@category= @places.map{|i| i = i.category}.uniq.sort
              
		#параметры для возрата в найденным маршрутам
		@transports = params['transports']
		@city_arrival = params['city_arrival']
		@city_trucking = params['city_trucking'] 
	end	
 
	def list_bus_places
	
		@route_id = params['ticket']['route_id']
		@date_trucking = params['ticket']['date_trucking']
		@station_trucking = params['ticket']['station_trucking'] 
		@station_arrival = params['ticket']['station_arrival']
		@time_trucking = params['ticket']['time_trucking'] 
		@time_arrival = params['ticket']['time_arrival']
                
		@route = Route.find(params['ticket']['route_id'])
		d = params['ticket']['date_trucking'].split('-')
   		@date = Date.new(d[0].to_i, d[1].to_i, d[2].to_i)

                id_station = Station.find(:all, :conditions => "name = '#{@station_arrival}'").pop.id
    	        @route_station = RouteStation.find(:all, :conditions => "route_id = #{@route_id} and station_id = #{id_station}").pop
                a = @route_station.arr_day.to_i
                @date_arrival = Date.new(d[0].to_i, d[1].to_i, (d[2].to_i+ a)).to_s.split('-')
		@k = @route_station.percents

		#дата, номер маршрута => номер даты маршрута
   		@dates = RouteDate.find(:all, :conditions => "route_id = #{params['ticket']['route_id']} and date = '#{@date}'").map{|i| i = i.id }.pop
		#номер даты маршрута => все места по этому маршруту в данную дату
		@places = BusDatePlace.find(:all, :conditions => "route_date_id = #{@dates}", :order => 'place_num')
		@price = BusPrice.find(:all, :conditions => "route_date_id = #{@dates}").pop.price
		#параметры для возрата в найденным маршрутам
		@transports = params['transports']
		@city_arrival = params['city_arrival']
		@city_trucking = params['city_trucking'] 
	end

  def bye_place
    		@route = Route.find(params['ticket']['route_id'])
                p params[:route_date_id]
    		@route.transport == 0 ? dp = PlaneDatePlace.find(:all, :conditions => "route_date_id = #{params[:route_date_id]} and
										       place_num = #{params[:place]}").pop : 
	       (@route.transport == 1 ? dp = TrainDatePlace.find(:all, :conditions => "route_date_id = #{params[:route_date_id]} and
										       place_num = #{params[:place]}").pop : 
					dp = BusDatePlace.find(:all, :conditions => "route_date_id = #{params[:route_date_id]} and
										       place_num = #{params[:place]}").pop)

    		p dp
    		dp.attributes = {:purchased => true}
    		dp.save
    		p dp

		function = (@route.transport == 0 ? 'list_plane_places' : 
			   (@route.transport == 1 ? 'list_train_places' : 
						    'list_bus_places'))
	
    		redirect_to(:action => function, :ticket => {
							:route_id => params['ticket']['route_id'], 
							:date_trucking => params['ticket']['date_trucking'], 
							:station_trucking => params['ticket']['station_trucking'], 
							:station_arrival => params['ticket']['station_arrival'], 
							:time_trucking => params['ticket']['time_trucking'], 
							:time_arrival => params['ticket']['time_arrival']
						  },
						  :search => {
							:transports => params['search']['transports'], 
							:city_station_trucking => params['search']['city_station_trucking'], 
							:city_station_arrival => params['search']['city_station_arrival']
						  })
  end

end
