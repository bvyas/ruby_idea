class PostsController < ApplicationController

	def post
		@post = Post.create(post: params[:post], user: User.find(params[:user_id]))
	
			redirect_to :back
		
	end
end
