class KlassController < ApplicationController

	get '/klasses/:slug' do 
		@klass = Klass.find_by_slug(params[:slug])
		@teacher = User.find(@klass.owner_id)
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
		@klass.owner_id = current_user.id
		@klass.save
		redirect "/klasses/#{@klass.slug}"
	end

end