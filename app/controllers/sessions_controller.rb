class SessionsController < ApplicationController

	def new
	end

	def create # Logging in with an existing user
		@user = User.find_by_email(params[:email])

		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to root_path
		elsif ( params[:email].length > 0 ) && ( @user == nil )
			flash[:danger] = "That email does not exist."
			redirect_to login_path
		elsif 
			flash[:danger] = "Your email or password is incorrect."
			redirect_to login_path
		end
	end

	def manage
	end

	def destroy # Logging out - destroy the session, not data
		session[:user_id] = nil
		flash[:success] = "You have successfully logged out."
		redirect_to login_path
	end

end
