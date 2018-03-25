class CommentController < ApplicationController

	post '/klasses/comments/new' do 
		if logged_in?
			@comment = Comment.create(content: params[:content], user_id: current_user.id, location: "klass" )
			redirect '/klasses'
		else
			flash[:message] = "Must be logged in to post a comment."
			redirect '/login'
		end
	end

	post '/comments/new' do 
		if logged_in?
			@comment = Comment.create(content: params[:content], user_id: current_user.id, user_name: current_user.username)
			redirect '/'
		else
			flash[:message] = "Must be logged in to post a comment."
			redirect '/login'
		end
	end

	get '/comments/:id/edit' do
		if logged_in?
			@comment = Comment.find(params[:id])
			erb :edit_comment
		else
			flash[:message] = "Must be logged in to edit a comment."
			redirect '/login'
		end
	end

	patch '/comments/:id/edit' do
		@comment = Comment.find(params[:id])
		@comment.edited = true
		@comment.update(content: params[:content])
		binding.pry
		redirect '/'
	end

end