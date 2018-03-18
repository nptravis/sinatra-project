class KlassController < ApplicationController

	get '/klasses/:slug' do 
		@klass = Klass.find_by_slug(params[:slug])
		erb :klass_show
	end

	get '/klasses' do 
		@klasses = Klass.all
		erb :all_klasses_show
	end

	get '/create' do 
		erb :create
	end

	post '/create' do 
	end

end