class ProvidersController < ApplicationController
  def list
    @providers = Provider.find(:all, :order => "company_name")
  end
  
  def add
  end
  
  def add_commit
    p = Provider.new
    p.attributes = params['provider']
    p.save
    get_errors(p)
    @errors.size > 0 ? redirect_to(:action => 'add', :errors => @errors) : redirect_to(:action => 'list')
  end

  def edit
    @item = Provider.find(params[:id])
    redirect_to(:action => :list) if @item.nil?
  end

  def edit_commit
    p = Provider.find(params['provider']['id'])
    unless p.nil?
      p.attributes = params['provider']
      p.save
    end
    redirect_to(:action => :info, :id => p.id)
  end
  
  def info
    @item = Provider.find(params[:id])
    redirect_to(:action => :list) if @item.nil?
  end

  def destroy
    p = Provider.find(params[:id])
    p.destroy unless p.nil?
    redirect_to(:action => :list)
  end
end
