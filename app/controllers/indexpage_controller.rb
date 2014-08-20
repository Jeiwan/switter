class IndexpageController < ApplicationController
	def index
		redirect_to user_path(current_user.nickname) if signed_in?
	end
end
