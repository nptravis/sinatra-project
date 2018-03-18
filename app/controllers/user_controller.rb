class UserController < ApplicationController

	get '/users/:slug' do
	binding.pry 
		@user = User.find_by_slug(params[:slug])
		erb :user_show
	end

	get '/create_or_join' do 
		if logged_in?
			erb :create_or_join
		else
			flash[:message] = "Must be logged in to create or join a class."
			redirect '/login'
		end
	end

end