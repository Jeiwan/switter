require 'rails_helper'

RSpec.describe MicropostsController, :type => :controller do
	before do
		@user = FactoryGirl.create(:user)
		@micropost = @user.microposts.create(content: 'Hello, world!')
		allow(controller).to receive(:current_user) { @user }
	end

	describe "POST /newmicropost" do
		context "valid content" do
			it "redirects to user page" do
				post :create, micropost: { content: @micropost.content }
				expect(flash[:success]).not_to be_nil
			end
		end
		context "invalid content" do
			it "renders user page with error" do
				post :create, micropost: { content: @micropost.content * 20 }
				expect(flash[:danger]).not_to be_nil
			end
		end
	end

	describe "DELETE /delmicropost/:id" do
		it "deletes the micropost" do
			delete :destroy, id: @micropost.id
			expect(response).to redirect_to user_path(@user.nickname)
		end
	end
end
