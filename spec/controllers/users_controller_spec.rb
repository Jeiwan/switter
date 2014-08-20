require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	before { @user = FactoryGirl.create(:user) }

	describe "GET /signup" do
		it "renders registration page" do
			get :new
			expect(response).to render_template :new
		end
	end
	describe "POST /users" do
		describe "valid information" do
			it "redirects to index page" do
				post :create, user: { nickname: @user.nickname.reverse, email: @user.email + "m", fullname: @user.fullname, password: @user.password, password_confirmation: @user.password_confirmation }
				expect(response).to redirect_to root_path
			end
		end
	end
	describe "GET /:user_name" do
		describe "valid information" do
			it "renders user page" do
				get :show, user_name: @user.nickname
				expect(response).to render_template :show
			end
		end
		describe "invalid information" do
			it "renders user page" do
				get :show, user_name: @user.nickname.reverse
				expect(response).to redirect_to root_path
			end
		end
	end
end
