class UsersController < ApplicationController
	#before_action :must_be_signed_in, only: [:edit, :update]

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

	def show
		@user = User.find_by_nickname(params[:user_name])

		if @user
			@microposts = @user.microposts.order('created_at DESC')
			render "show"
		else
			flash[:danger] = 'User is not found!'
			redirect_to root_path
		end
	end

	def edit
		@user = current_user
	end

	def update
		if current_user.update(params_user)
			flash[:success] = "Information updated!"
			redirect_to user_path(current_user.nickname)
		else
			render "edit"
		end
	end


	private
		def params_user
			params.require(:user).permit(:nickname, :fullname, :email, :password, :password_confirmation)
		end

		def must_be_signed_in
			signed_in?
		end
end
