Given(/^A user who's not signed in$/) do
	@user = FactoryGirl.build(:user)
end

When(/^The user visits index page$/) do
	visit root_path
end

Then(/^The user must see welcome page without log\-out and settings links$/) do
	expect(page).to have_content 'Welcome'
	expect(page).to have_link 'Log in'
	expect(page).to have_link 'Sign up'
	expect(page).not_to have_link 'Log out'
	expect(page).not_to have_link 'Settings'
	expect(page).not_to have_title @user.nickname
end

Given(/^A user who's signed in$/) do
	@user = FactoryGirl.create(:user)
	sign_in @user
end

Then(/^The user must see his page with his name, log out and settings links$/) do
	expect(page).not_to have_content 'Welcome'
	expect(page).not_to have_link 'Log in'
	expect(page).not_to have_link 'Sign up'
	expect(page).to have_link @user.nickname
	expect(page).to have_link 'Log out'
	expect(page).to have_link 'Settings'
	expect(page).to have_title @user.nickname
end
