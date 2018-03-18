class StudentController < ApplicationController
	
	get '/students' do 
		@students = Student.all
		erb :all_students_show
	end

	get '/students/:slug' do 
		@student = Student.find_by_slug(params[:slug])
		erb :student_show
	end

	post '/student_signup' do
		if Student.find_by(email: params[:email])
			flash[:message] = "This email already exists, please log in"
			redirect "/login"
		else
			@student = Student.create(params)
			redirect "/students/#{@student.slug}"
		end
	end

	get '/students/:slug/register' do 
		@klasses = Klass.all
		@student = Student.find_by_slug(params[:slug])
		erb :register
	end

	post '/students/:slug/register' do
		@student = Student.find_by_slug(params[:slug])
		params[:klass_ids].each do |klass_id|
			klass = Klass.find(klass_id)
			@student.klasses << klass
		end
		redirect "/students/#{@student.slug}"
	end

	

end