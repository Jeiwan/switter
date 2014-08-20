Given(/^A signed in user$/) do
	@user = FactoryGirl.create(:user)
	sign_in @user
end

When(/^The user clicks 'Log out' link on his page$/) do
	visit user_path(@user.nickname)
	click_link 'Log out'
end

Then(/^The user must be logged out and redirected to root_path$/) do
	expect(page).to have_content 'Logged out'
	expect(page).to have_content 'Welcome'
	expect(page).to have_link 'Log in'
	expect(page).to have_link 'Sign up'
end
