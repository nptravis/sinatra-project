require 'active_support/core_ext/string'

class SessionController < ApplicationController

	get '/login' do
		erb :login
	end

	post '/login' do
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/users/#{user.slug}"
		else
			flash[:message] = "Incorrect login credentials. Please try again or "
			redirect '/login'
		end
	end

	get '/logout' do
		session.clear
		flash[:message] = "You have been logged out."
		redirect '/'
	end

	get '/signup' do
		erb :signup
	end

	post '/signup' do 
		@user = User.create(params)
		session[:user_id] = @user.id
		redirect "/users/#{@user.slug}"
	end

end