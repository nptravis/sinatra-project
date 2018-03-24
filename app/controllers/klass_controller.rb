class KlassController < ApplicationController

	get '/klasses' do 
		@klasses = Klass.all
		erb :all_klasses_show
	end

	get '/klasses/create' do 
		if logged_in?
			erb :create
		else
			flash[:message] = "Must be logged in to create a class."
			redirect '/login'
		end
	end

	post '/klasses/create' do 
		@klass = Klass.new(params)
		@user = User.find(current_user.id)
		@klass.user_id = @user.id
		if @klass.save
			@user.klasses << @klass
			redirect "/users/#{@user.slug}"
		else
			flash[:message] = "Must include valid information for each field."
			redirect '/klasses/create'
		end
	end

	get '/klasses/join' do
		if logged_in?
			klasses = Klass.all
			@klasses = []
			klasses.each do |klass|
				@klasses << klass if klass.user_id != current_user.id
			end
			erb :join
		else
			flash[:message] = "Must be logged in to join classes."
			redirect "/login"
		end
	end

	post '/klasses/join' do 
		if params[:klass_ids]
			params[:klass_ids].each do |klass_id|
				klass = Klass.find(klass_id)
				current_user.klasses << klass
			end
			redirect "/users/#{current_user.slug}"
		else
			flash[:message] = "You didn't join any classes."
			redirect "/users/#{current_user.slug}"
		end
	end

	get '/klasses/:slug' do 
		@klass = Klass.find_by_slug(params[:slug])
		@teacher = User.find(@klass.user_id)
		erb :klass_show
	end

	delete '/klasses/delete/:id' do 
		@klass = Klass.find(params[:id])
		@klass.destroy
		flash[:message] = "Your class has been deleted."
		redirect "/users/#{current_user.slug}"
	end

end