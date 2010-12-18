# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'cecdaccc753bcf2917eb4e280cb7c82e'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  def login_required
    if session[:user]
      return true
    end
		params[:error]="You need to be authorised to view this page"
    session[:return_to]=request.request_uri
    redirect_to :controller => "user", :action => "login"
    return false 
  end
  
  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to]=nil
      redirect_to(return_to)
    else
      redirect_to :controller=>'main', :action=>'index'
    end
  end

	def only_operator
		if session[:user].nil?
			redirect_to :controller => 'main'
			return false
		elsif session[:user].typ != 'Operator'
			redirect_to :controller => 'main'
			return false
		end
		return true
	end

	def user_type
		session[:user].typ
	end

  def get_errors(obj)
    @errors = []
    obj.errors.each{|i| @errors << i[1]} if obj.errors.size > 0
  end

end
