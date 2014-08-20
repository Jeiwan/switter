Given(/^A registered and signed in user$/) do
	@user = FactoryGirl.create(:user)
	sign_in @user
end

When(/^The user visits his page$/) do
	visit user_path(@user.nickname)
end

Then(/^The page has log out and settings links, his avatar, nickname, and microposts$/) do
	expect(page).to have_link 'Log out'
	expect(page).to have_link 'Settings'
	expect(page).to have_content @user.nickname
	expect(page).to have_selector('img.gravatar')
end
