require "rails_helper"

feature "Avatars" do
	let(:user) { FactoryGirl.create(:user) }

	scenario "After registration a new user has a default avatar with a cute cat" do
		visit login_path
		sign_in user

		expect(page).to have_title user.nickname
		expect(page.find('.avatar')['src']).to have_content 'default.png'
	end

	scenario "Users change they avatar on the settings page" do
		sign_in user
		visit settings_path

		expect(page).to have_content "Avatar"
		expect(page).to have_selector "input#user_avatar"
		expect(page).to have_selector "img"
	end
end
