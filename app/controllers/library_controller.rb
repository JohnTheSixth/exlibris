class LibraryController < ApplicationController

	before_filter :authorize

	def home
		if Article.find_by_user_id(session[:user_id]) == nil
			@articles = "You don't have any articles, #{current_user.first_name}."
		else
			@articles = User.find(session[:user_id]).articles
		end
	end

end