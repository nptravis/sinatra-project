class AdminController < ApplicationController

	get "/index-all" do 
		@teachers = Teacher.all
		@students = Student.all
		@klasses = Klass.all
		@classrooms = Classroom.all
		# @admins = Admin.all
		erb :index_all
	end

	get '/create/klass' do 
		@teachers = Teacher.all
		@students = Student.all
		@classrooms = Classroom.all
		if current_user.class == Admin
			@admin = current_user
			erb :create
		else
			flash[:message] = "Only a user with admin priveleges can create a class."
			redirect '/failure'
		end
	end

	post '/create/klass' do
		@klass = Klass.create(name: params[:name], grade: params[:grade], subject: params[:subject], time_day: params[:time_day], weeks: params[:weeks], classroom_id: params[:classroom_id], teacher_id: params[:teacher_id])
		redirect "/klasses/#{@klass.slug}"
	end

	get '/admins/:slug' do 
		@admin = Admin.find_by_slug(params[:slug])
		erb :admin_show
	end

end