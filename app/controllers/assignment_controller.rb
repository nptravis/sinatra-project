class AssignmentController < ApplicationController

	get '/assignments/:slug' do 
		@assignment = Assignment.find_by_slug(params[:slug])
	
		@student_assignment = StudentAssignment.where("student_id = ? AND assignment_id = ?", current_user.id, @assignment.id)[0]

		erb :assignment_show
	end

	get '/assignments' do
		@assignments = Assignment.all
		erb :all_assignments_show
	end

	post '/assignments/new' do 
		@assignment = Assignment.create(params)
		redirect "/assignments/#{@assignment.slug}"
	end

	patch '/students/assignments/:slug' do 
		@assignment = Assignment.find_by_slug(params[:slug])
		@student_assignment = StudentAssignment.where("student_id = ? AND assignment_id = ?", current_user.id, @assignment.id)
		@student_assignment.update(student_content: params[:student_content])
		redirect "/assignments/#{@assignment.slug}"
	end

	get '/assignments/:slug/edit' do 
		@assignment = Assignment.find_by_slug(params[:slug])
		@student_assignment = StudentAssignment.where("student_id = ? AND assignment_id = ?", current_user.id, @assignment.id)[0]
		session[:student_content] = @student_assignment.student_content
		@student_assignment.update(student_content: nil)
		redirect "/assignments/#{@assignment.slug}"
	end

end