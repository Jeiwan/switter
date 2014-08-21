require 'rails_helper'

RSpec.describe Micropost, :type => :model do
	before { @micropost = FactoryGirl.create(:micropost) }

	subject { @micropost }

	it { should respond_to :content }
	it { should respond_to :user }

	describe "validating micropost" do
		context "valid length" do
			before { @micropost.content = "a" * 140 }
			it { should be_valid }
		end
		context "content not present" do
			before { @micropost.content = nil }
			it { should_not be_valid }
		end
		context "invalid length" do
			before { @micropost.content = "a" * 141 }
			it { should_not be_valid }
		end
		context "content is too short" do
			before { @micropost.content = "" }
			it { should_not be_valid }
		end
	end
end
