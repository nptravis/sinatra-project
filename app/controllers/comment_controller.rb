class CommentController < ApplicationController

	post '/comments/new' do 
		if logged_in?
			@comment = Comment.create(content: params[:content], user_id: current_user.id, user_name: current_user.username)
			redirect '/'
		else
			flash[:message] = "Must be logged in to post a comment."
			redirect '/login'
		end
	end

	post '/klasses/:id/comments/new' do 
		if logged_in?
			@klass = Klass.find(params[:id])
			@comment = Comment.create(content: params[:content], user_id: current_user.id, user_name: current_user.username, klass_id: @klass.id)
			redirect "/klasses/#{@klass.slug}"
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
		if @comment.klass_id
			@klass = Klass.find(@comment.klass_id)
			redirect "/klasses/#{@klass.slug}"
		else
			redirect '/'
		end
	end

end