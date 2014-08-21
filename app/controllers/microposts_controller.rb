class MicropostsController < ApplicationController
	before_action :must_be_logged_in

	def create
		@micropost = Micropost.new(params_micropost)

		if @micropost.save
			current_user.microposts << @micropost
			flash[:success] = "Micropost craeted!"
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

	private

		def params_micropost
			params.require(:micropost).permit(:content)
		end

		def must_be_logged_in
			signed_in?
		end
end
