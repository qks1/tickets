class UserController < ApplicationController
	before_filter :login_required, :only=>['my_account', 'edit_account', 'destroy']

  def list
    @users = User.find(:all)
  end


##--- Login
	def login
	end

	def login_commit
		u=User.new(params[:user])
		if @user = User.authenticate(u.username, u.password)
			params[:message] = 'Login successful'
			session[:user] = @user
			redirect_to_stored
			#redirect_to :action => "my_account"
		else
			params[:error] = 'Login was not successful'
		end
	end


##--- Registration of Client
	def registration
	end

	def registration_commit
		user=User.new(params[:user])
		user.created_at = Time.now
		user.typ = 'Client'
		user.client = Client.new
		if user.save
			session[:user] = User.authenticate(user.username, user.password)
			redirect_to :action => "my_account"
		else
			
			#params[:errors] = 'Registration was not successful'
			get_errors(user)
			redirect_to  :action => "registration"
		end
	end

  def logout
    session[:user] = nil
    params[:message] = 'Logged out'
    redirect_to :controller => "main", :action => "index"
  end

	def my_account
		@user = session[:user]
	end

	def edit_account
	end

	def edit_account_commit
		user = session[:user]
		if user.typ == 'Client'
		##----------------------##
			user.client = Client.new(params[:client])
			if user.client.save
				redirect_to :action => "my_account"
			else
				params[:error] = 'Did not fit the parameters'
			end
		elsif user.typ == 'Provider'
		##----------------------##			
			user.provider.attributes = params[:provider]
			if user.provider.save
				redirect_to :action => "my_account"
			else
				params[:error] = 'Did not fit the parameters'
			end
		elsif user.typ == 'Operator'
		##----------------------##
				
		else
			params[:error] = 'Something went terribly wrong'
			redirect_to :controller => 'main', :action => 'index'
		end
	end

  def destroy
    u = User.find(params[:id])
    u.destroy unless u.nil?
    redirect_to(:action => :list)
  end

end
