require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	let(:user) { FactoryGirl.create(:user) }

	describe "GET /signup" do
		it "renders registration page" do
			get :new
			expect(response).to render_template :new
		end
	end
	describe "POST /users" do
		context "valid information" do
			it "redirects to index page" do
				post :create, user: { nickname: user.nickname.reverse, email: user.email + "m", fullname: user.fullname, password: user.password, password_confirmation: user.password_confirmation }
				expect(response).to redirect_to root_path
			end
		end
	end
	describe "GET /:user_name" do
		context "valid information" do
			it "renders user page" do
				get :show, user_name: user.nickname
				expect(response).to render_template :show
			end
		end
		context "invalid information" do
			it "renders user page" do
				get :show, user_name: user.nickname.reverse
				expect(response).to redirect_to root_path
			end
		end
	end
	describe "GET /settings" do
		it "renders edit profile page" do
			get :edit
			expect(response).to render_template :edit
		end
	end
	describe "POST /settings" do
		context "valid password" do
			before do
				allow(controller).to receive(:current_user) { user }
			end
			it "redirects to user's page" do
				put :update, user: { email: user.email, fullname: user.fullname.reverse, passwod: user.password, password_confirmation: user.password_confirmation }
				expect(response).to redirect_to user_path(user.nickname)
			end
		end
	end
end
