class ClientController < ApplicationController
	before_filter :login_required, :only=>['my_account', 'edit_account']

  def my_account
		@user = session[:user]
  end

  def edit_account
  end
	
	def edit_account_commit
		user = session[:user]
		user.client = Client.new(params[:client])
		if user.client.save
			redirect_to :action => "my_account"
		else
			params[:error] = 'Did not fit the parameters'
		end
	end

end
