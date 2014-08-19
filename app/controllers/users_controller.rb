class UsersController < ApplicationController
	def index
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params_user)

		if @user.save
			flash[:success] = 'Signed up!'
			redirect_to root_path
		else
			render "new"
		end
	end


	private
		def params_user
			params.require(:user).permit(:nickname, :fullname, :email, :password, :password_confirmation)
		end
end