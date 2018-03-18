class CommentController < ApplicationController

	post '/klasses/comments/new' do 
		@comment = Comment.create(content: params[:comment][:content], user_email: session[:email], location: "klass" )
		binding.pry
	end

end