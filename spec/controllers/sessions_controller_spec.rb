require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
	before { @user = FactoryGirl.create(:user) }

	describe "GET /login" do
		it "renders log in page" do
			get :new
			expect(response).to render_template(:new)
		end
	end
	describe "POST /login" do
		describe "when data is valid" do
			it "redirects to user page" do
				post :create, user: { email: @user.email, password: @user.password }
				expect(response).to redirect_to user_path(@user.nickname)
			end
		end
		describe "when data is invalid" do
			it "renders new template" do
				post :create, user: { email: @user.email, password: @user.password.reverse }
				expect(response).to render_template :new
			end
		end
	end
	describe "DELETE /logout" do
		it "redirects to index" do
			delete :destroy
			expect(response).to redirect_to root_path
		end
	end
end
