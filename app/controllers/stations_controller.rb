class StationsController < ApplicationController
  def list
    @stations = Station.find(:all, :order => 'transport, name')
  end

  def add
  end

  def add_commit
    s = Station.new
    s.attributes = params['station']
    s.save
    get_errors(s)
    @errors.size > 0 ? redirect_to(:action => 'add', :errors => @errors) : redirect_to(:action => 'list')
  end

  def edit
    @item = Station.find(params[:id])
    redirect_to(:action => :list) if @item.nil?
  end

  def edit_commit
    s = Station.find(params['station']['id'])
    unless s.nil?
      s.attributes = params['station']
      s.save
    end
    redirect_to(:action => :list)
  end

  def destroy
    s = Station.find(params[:id])
    s.destroy unless s.nil?
    redirect_to(:action => :list)
  end

end
