class UserController < ApplicationController

  def list
    @users = User.find(:all)
  end

	def login
		if request.post?
			u=User.new(params[:user])
			if @user = User.authenticate(u.username, u.password)
				params[:message] = 'Login successful'
				session[:user] = @user
				redirect_to :action => "my_account"
			else
				params[:error] = 'Login was not successful'
			end
		end
	end

	def registration
		@user=User.new(params[:user])
		@user.created_at = Time.now
		##@user.type = "Customer"
		if request.post?
			if @user.save
				session[:user] = User.authenticate(@user.username, @user.password)
				params[:message] = 'Registration successful'
				redirect_to :action => "my_account"
			else
				params[:error] = 'Registration was not successful'
			end
		end
	end

  def logout
    session[:user] = nil
    params[:message] = 'Logged out'
    redirect_to :action => 'login'
  end

	def my_account
		@user = session[:user]
	end

end
