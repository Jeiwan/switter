class MicropostsController < ApplicationController
	before_action :must_be_logged_in, only: [ :create, :destroy ]

	def create
		@micropost = Micropost.new(params_micropost)

		if @micropost.save
			current_user.microposts << @micropost
			flash[:success] = "Micropost created!"
		else
			flash[:danger] = "Error: post length shouldn't exceed 140 chars!"
		end
		redirect_to user_path(current_user.nickname)
	end

	def destroy
		@micropost = current_user.microposts.find(params[:id])

		@micropost.destroy
		redirect_to user_path(current_user.nickname)
	end

	def show_json
		#sleep 2
		@user = User.find_by(nickname: params[:user_nickname])

		puts ">>> #{@user == current_user}"
		
		if @user
			@microposts = signed_in? && @user == current_user ? @user.feed(limit: false) : @user.microposts
			@microposts = @microposts[params[:cursor].to_i, 20]
			render json: @microposts.to_json(include: {user: {only: [:nickname, :email]}})
		else
			render json: { error: "User is not found!" }
		end

	end

	private

		def params_micropost
			params.require(:micropost).permit(:content)
		end

		def must_be_logged_in
			signed_in?
		end
end
