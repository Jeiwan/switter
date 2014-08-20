class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_email(params[:user][:email])

		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			flash[:success] = "Logged in!"
			redirect_to user_path(@user.nickname)
		else
			flash.now[:danger] = 'Wrong email/password!'
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "Logged out!"
		redirect_to root_path
	end
end
