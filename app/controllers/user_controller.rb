<<<<<<< HEAD
lass UserController < ApplicationController
=======
class UserController < ApplicationController
>>>>>>> 35b439f8b5618c3cc3a3e204a7eba2b49350724c
	before_filter :only_operator, :only=>['list']

  def list
    @users = User.find(:all)
  end

	def login
	end

	def login_commit
		u=User.new(params[:user])
		if @user = User.authenticate(u.username, u.password)
			params[:message] = 'Login successful'
			session[:user] = @user
			redirect_to_stored
		else
			params[:errors] = 'Login was not successful'
			redirect_to :action => 'login', :errors => @errors
		end
	end

	def registration
	end

	def registration_commit
		user=User.new(params[:user])
		user.created_at = Time.now
		user.typ = 'Client'
		user.client = Client.new
		if user.save
			session[:user] = User.authenticate(user.username, user.password)
			redirect_to :controller => user_type, :action => "my_account"
		else
			get_errors(user)
			redirect_to :action => "registration", :errors => @errors
		end
	end

  def logout
    session[:user] = nil
    params[:message] = 'Logged out'
    redirect_to :controller => "main", :action => "index"
  end

  def destroy
    u = User.find(params[:id])
    u.destroy unless u.nil?
    redirect_to(:action => :list)
  end

end

