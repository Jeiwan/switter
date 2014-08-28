require 'rails_helper'

RSpec.describe Relationship, :type => :model do
	let(:user1) { FactoryGirl.create(:user) }
	let(:user2) { FactoryGirl.create(:user) }
	let(:relationship) { Relationship.create(follower_id: user1.id, followed_id: user2.id) }

	subject { relationship }

	it { should respond_to :followed }
	it { should respond_to :follower }

	describe "validate" do
		context "with one parameter absent" do
			before { relationship.follower_id = nil }
			it { is_expected.not_to be_valid }
		end
		context "with another parameter absent" do
			before { relationship.followed_id = nil }
			it { is_expected.not_to be_valid }
		end
		context "with one parameter being not number" do
			before { relationship.follower_id = "abc" }
			it { is_expected.not_to be_valid }
		end
		context "with another parameter being not number" do
			before { relationship.followed_id = "abc" }
			it { is_expected.not_to be_valid }
		end
	end
end
