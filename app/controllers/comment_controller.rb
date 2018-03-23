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

end