class UsersController < ApplicationController
	before_action :must_be_signed_in, only: [:edit, :update, :follow]

	def index
		@users = User.all.paginate(page: params[:page],per_page: 20)
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
		@micropost = Micropost.new

		if @user
			@microposts = @user == current_user ? @user.feed : @user.microposts.limit(20)
			render "show"
		else
			flash[:danger] = "User is not found!"
			redirect_to root_path
		end
	end

	def edit
		@user = current_user
	end

	def crop
		if params[:crop]
			current_user.crop_x = params[:crop][:crop_x]
			current_user.crop_y = params[:crop][:crop_y]
			current_user.crop_w = params[:crop][:crop_w]
			current_user.crop_h = params[:crop][:crop_h]
		end
		current_user.avatar.reprocess!
		flash[:success] = "Information updated!"
		redirect_to user_path(current_user.nickname)
	end

	def update
		@user = current_user
		if current_user.update(params_user)
			if params[:user][:avatar].present?
				render :crop
			else
				flash[:success] = "Information updated!"
				redirect_to user_path(current_user.nickname)
			end
		else
			render "edit"
		end
	end

	def follow
		@user_to_follow = User.find(params[:user_id])
		if current_user.follows? @user_to_follow
			current_user.unfollow(@user_to_follow)
			answer = "unfollowed"
		else
			current_user.follow(@user_to_follow)
			answer = "followed"
		end
		render json: {answer: answer}
	end
	
	private
		def params_user
			params.require(:user).permit(:nickname, :fullname, :email, :password, :password_confirmation, :avatar)
		end

		def must_be_signed_in
			signed_in?
		end
end
