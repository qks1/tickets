class RoutesController < ApplicationController
  def list
    @routes = Route.find(:all, :order => 'number')
  end
  
  def add
  end
  
  def add_commit
    r = Route.new
    r.attributes = params['route']
    r.save
    get_errors(r)
    @errors.size > 0 ? redirect_to(:action => 'add', :errors => @errors) : redirect_to(:action => 'list')
  end
  
  def view
    @item = Route.find(params[:id])
    @stations = RouteStation.find(:all, :conditions => "route_id = #{params[:id]}", :order => 'dep_day, dep_hour')
    @dates = RouteDate.find(:all, :conditions => "route_id = #{params[:id]}", :order => 'date')
  end

  def edit
    @item = Route.find(params[:id])
    redirect_to(:action => :list) if @item.nil?
  end
  
  def edit_commit
    r = Route.find(params['route']['id'])
    unless r.nil?
      r.attributes = params['route']
      r.save
    end
    redirect_to(:action => 'list')
  end

  def destroy
    r = Route.find(params[:id])
    r.destroy unless r.nil?
    redirect_to(:action => :list)
  end

  def edit_station
    @item = RouteStation.find(params[:id])
    @route_id = params[:route_id]
  end
  
  def edit_station_commit
    rs = RouteStation.find(params['route_station']['id'])
    unless rs.nil?
      rs.attributes = params['route_station']
      rs.save
    end
    redirect_to(:action => 'view', :id => params['route_station']['route_id'])
  end
  
  def add_station
    @route_id = params[:route_id]
    @transport = Route.find(params[:route_id]).transport
  end
  
  def add_station_commit
    rs = RouteStation.new
    rs.attributes = params['route_station']
    rs.save
    get_errors(rs)
    @errors.size > 0 ? redirect_to(:action => 'add_station', :route_id => params['route_station'][:route_id], :errors => @errors) : redirect_to(:action => 'view', :id => params['route_station'][:route_id])
  end
  
  def delete_station
    rs = RouteStation.find(params[:id])
    rs.destroy unless rs.nil?
    redirect_to(:action => 'view', :id => params[:route_id])
  end
  
  def edit_dates
    @dates = RouteDate.find(:all, :conditions => "route_id = #{params[:route_id]}", :order => 'date')
    @route = Route.find(params[:route_id])
  end
  
  def delete_date
    rd = RouteDate.find(params[:id])
    rd.destroy unless rd.nil?
    redirect_to(:action => 'edit_dates', :route_id => params[:route_id])
  end
  
  def add_date
    @route_id = params[:route_id]
  end
  
  def add_date_commit
    rd = RouteDate.new
    rd.attributes = params[:route_date]
    rd.save
    get_errors(rd)
    @errors.size > 0 ? redirect_to(:action => 'add_date', :route_id => params['route_date'][:route_id], :errors => @errors) : redirect_to(:action => 'edit_dates', :route_id => params['route_date'][:route_id])
  end
  
  def view_places
    @route = Route.find(params[:route_id])
    function = @route.transport == 0 ? 'view_plane_places' : (@route.transport == 1 ? 'view_train_places' : 'view_bus_places')
    redirect_to(:action => function, :date => params[:id], :route => params[:route_id])
  end
  
  def view_train_places
    @places = TrainDatePlace.find(:all, :conditions => "route_date_id = #{params[:date]}", :order => 'wagon_number, place_num')
    @date = RouteDate.find(params[:date])
    @route = Route.find(params[:route])  
  end
  
  def view_plane_places
    @places = PlaneDatePlace.find(:all, :conditions => "route_date_id = #{params[:date]}", :order => 'place_num')
    @date = RouteDate.find(params[:date])
    @route = Route.find(params[:route])  
  end
  
  def view_bus_places
    @places = BusDatePlace.find(:all, :conditions => "route_date_id = #{params[:date]}", :order => 'place_num')
    @date = RouteDate.find(params[:date])
    @route = Route.find(params[:route])  
  end
  
  def buy_place
    @route = Route.find(params[:route_id])
    @route.transport == 0 ? dp = PlaneDatePlace.find(params[:id]) : (@route.transport == 1 ? dp = TrainDatePlace.find(params[:id]) : dp = BusDatePlace.find(params[:id]))
    dp.attributes = {:purchased => true}
    dp.save
    redirect_to(:action => 'view_places', :route_id => params[:route_id], :id => params[:date_id])
  end
  
  
  def add_wagon
    @date = RouteDate.find(params[:date])
    @route = Route.find(params[:route])  
  end
  
  def add_plane
    @date = RouteDate.find(params[:date])
    @route = Route.find(params[:route])  
  end
  
  def add_bus
    @date = RouteDate.find(params[:date])
    @route = Route.find(params[:route])  
  end
  
  def add_wagon_commit
    places = WagonUnitPlace.find(:all, :conditions => "unit_id = #{params['wagon']['id']}")
    places.each do |p|
      TrainDatePlace.create(:route_date_id => params['date'], :wagon_number => params['wagon']['number'], :place_num => p.number, :category => p.category, :purchased => false)
    end
    redirect_to(:action => 'view_train_places', :route => params[:route], :date => params[:date])
  end
  
  def add_plane_commit
    places = PlaneUnitPlace.find(:all, :conditions => "unit_id = #{params['plane']['id']}")
    places.each do |p|
      PlaneDatePlace.create(:route_date_id => params['date'], :place_num => p.number, :category => p.category, :purchased => false)
    end
    redirect_to(:action => 'view_plane_places', :route => params[:route], :date => params[:date])
  end
  
  def add_bus_commit
    places = BusUnitPlace.find(:all, :conditions => "unit_id = #{params['bus']['id']}")
    places.each do |p|
      BusDatePlace.create(:route_date_id => params['date'], :place_num => p.number, :purchased => false)
    end
    redirect_to(:action => 'view_bus_places', :route => params[:route], :date => params[:date])
  end
  
  def edit_prices
    @date = RouteDate.find(params[:date])
    @route = Route.find(params[:route])
  end
  
  def edit_prices_commit
    @route = Route.find(params[:route])
    if @route.transport == 0
      tp = PlanePrice.new  
    elsif @route.transport == 1
      tp = TrainPrice.new
    else
      tp = BusPrice.new
    end
    tp.attributes = params['unit']
    tp.save
    redirect_to :action => 'view_places', :id => params['unit']['route_date_id'], :route_id => params[:route]
  end
  


end
