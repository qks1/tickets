class UnitsController < ApplicationController
  def list
    @plains = Unit.find(:all, :conditions => 'transport = 0')
    @wagons = Unit.find(:all, :conditions => 'transport = 1')  
    @buses = Unit.find(:all, :conditions => 'transport = 2')
  end
  
  def view
    @unit = Unit.find(params[:id])
    @places = @unit.transport == 0 ? PlaneUnitPlace.find(:all, :conditions => "unit_id = #{params[:id]}", :order => 'number') : (@unit.transport == 1 ? WagonUnitPlace.find(:all, :conditions => "unit_id = #{params[:id]}", :order => 'number') : BusUnitPlace.find(:all, :conditions => "unit_id = #{params[:id]}", :order => 'number'))
  end

end
