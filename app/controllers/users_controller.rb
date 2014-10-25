class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create

		@user = User.create(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to '/reader'
		else
			flash.now[:danger] = @user.errors.full_messages
			render :new
		end
		
	end

	def delete
	end

	def destroy # Destroys the user and the user's articles from the database
		
		if Article.destroy_all(user_id: params[:id])
			User.destroy_all(id: params[:id])
			flash[:success] = "You have successfully deleted your account."
			session[:user_id] = nil
			redirect_to login_path
		else
			flash[:danger] = "Your account was not deleted."
			render :delete
		end

	end

private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

end