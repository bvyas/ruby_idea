class LikesController < ApplicationController
def create
	Like.create(post_id: params[:post_id], user_id: session[:user_id])
	puts params
	puts '-------------------------------'
	@p = Post.find(params[:post_id])
	puts @p
	puts 'kljsd;lkfjdslkfjsdlfkjdslfkjslfkjsdflkjsdflksdflkdflksjfsdf'
	redirect_to :back
	end
end
