require 'rails_helper'

RSpec.describe "When user", :type => :request do
	describe "visits index" do
		subject { page }

		before { visit root_path }

		it { should have_content 'Switter' }
		it { should have_title 'Switter' }
		it { should have_content 'Welcome' }
		it { should have_link 'Log in' }
		it { should have_link 'Sign up' }

		describe "and clicks 'Sign up' link" do
			before { click_link 'Sign up' }

			it { should have_title 'Sign up' }
			it { should have_content 'Sign up' }
			it { should have_selector 'form' }
		end
	end

	describe 'signs up' do
		subject { page }
		before do
			visit signup_path
			fill_in 'Nickname', with: 'Pedro'
			fill_in 'Fullname', with: 'Pedro Juanes'
			fill_in 'Email', with: 'pedro@mexi.co'
			fill_in 'Password', with: 'asdzxcasd'
			fill_in 'Password confirmation', with: 'asdzxcasd'
			click_button 'Sign up'
		end

		it { should have_content 'Welcome' }
		it { should_not have_content 'error' }
		it { should have_content 'Signed up!' }

	end
end
