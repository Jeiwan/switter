require 'rails_helper'

RSpec.describe User, :type => :model do

	before { @user = FactoryGirl.create(:user)}

	subject { @user }

	it { should respond_to :nickname }
	it { should respond_to :fullname }
	it { should respond_to :email }
	it { should respond_to :password }
	it { should respond_to :password_confirmation }
	it { should respond_to :avatar }
	it { should respond_to :microposts }
	it { should respond_to :followed_users }
	it { should respond_to :followers }
	it { should respond_to :relationships }

	describe "sign up without nickname" do
		before { @user.nickname = nil }

		it { should_not be_valid }
	end
	describe "sign up with wrong nickname" do
		before { @user.nickname = "1234" }

		it { should_not be_valid }
	end
	describe "sign up with existing nickname" do
		before do
			@other_user = @user.dup
			@user.save
			@other_user.email = "some_other@email.com"
		end
		subject { @other_user }

		it { should_not be_valid }
	end
	describe "sign up without fullname" do
		before { @user.fullname = nil }

		it { should_not be_valid }
	end
	describe "sign up with wrong fullname" do
		before { @user.fullname = "1234" }

		it { should_not be_valid }
	end
	describe "sign up without email" do
		before { @user.email = nil }

		it { should_not be_valid }
	end
	describe "sign up with existing email" do
		before do
			@other_user = @user.dup
			@user.save
			@other_user.nickname = "Some other nickname"
		end
		subject { @other_user }

		it { should_not be_valid }
	end
	describe "sign up without password" do
		before { @user.password = nil }

		it { should_not be_valid }
	end
	describe "sign up with wrong password" do
		before { @user.password = "12345" }

		it { should_not be_valid }
	end
	describe "sign up without password confirmation" do
		before { @user.password_confirmation = nil }

		it { should_not be_valid }
	end
	describe "sign up when password and password confirmation do not match" do
		before { @user.password = "123456" }

		it { should_not be_valid }
	end
end
