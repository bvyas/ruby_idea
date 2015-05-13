class UsersController < ApplicationController
	def index
	end

	def create
		user = User.new(name: params[:name], alias: params[:alias], email:params[:email], password:params[:password], password_confirmation: params[:password_confirmation])
		if user.save
			session[:user_id] = user.id
			redirect_to "/users/#{user.id}"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to '/'
		end
	end

	def login
		user = User.find_by(name: params[:name])
		if user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to "/users/#{user.id}"
		else
			redirect_to '/users/index'
		end
	end

	def show
		 @user = User.find(params[:id])
		 @posts = Post.all
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/'
	end


	private
	def user_params
		params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
	end
end

