class KlassController < ApplicationController

	get '/klasses/:slug' do 
		@klass = Klass.find_by_slug(params[:slug])
		@teacher = User.find(@klass.user_id)
		erb :klass_show
	end

	get '/klasses' do 
		@klasses = Klass.all
		erb :all_klasses_show
	end

	get '/create' do 
		if logged_in?
			erb :create
		else
			flash[:message] = "Must be logged in to create a class."
			redirect '/login'
		end
	end

	post '/create' do 
		@klass = Klass.create(params)
		@user = User.find(current_user.id)
		@klass.user_id = @user.id
		@user.klasses << @klass
		@klass.save
		redirect "/klasses/#{@klass.slug}"
	end

end