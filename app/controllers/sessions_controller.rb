class SessionsController < ApplicationController

	def new
	end

	def create # Logging in with an existing user
		@user = User.find_by_email(params[:email])

		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to root_path
		else
			redirect_to login_path
		end
	end

	def destroy # Logging out - destroy the session, not data
		session[:user_id] = nil
		redirect_to login_path
	end

end
