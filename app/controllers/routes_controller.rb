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

end
