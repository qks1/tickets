class OperatorController < ApplicationController
  def my_account
		@user=session[:user]
  end

end
