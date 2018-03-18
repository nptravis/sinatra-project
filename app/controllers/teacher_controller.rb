class TeacherController < ApplicationController

	get '/teachers' do
		@teachers = Teacher.all
		erb :all_teachers_show
	end

	get '/teachers/:slug' do 
		@teacher = Teacher.find_by_slug(params[:slug])
		erb :teacher_show
	end

	post '/teacher_signup' do
		if Teacher.find_by(email: params[:email])
			flash[:message] = "This email already exists, please log in"
			redirect "/login"
		else
			@teacher = Teacher.create(params)
			redirect "/teachers/#{@teacher.slug}"
		end
	end


end