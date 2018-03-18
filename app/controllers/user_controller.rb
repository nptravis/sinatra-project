class UserController < ApplicationController

	get '/users/:slug' do
		@user = User.find_by_slug(params[:slug])
		erb :user_show
	end

end