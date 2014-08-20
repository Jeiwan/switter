Given(/^A user who wants to log in$/) do
	@user = FactoryGirl.create(:user)
end

When(/^The user visits log\-in page$/) do
	visit login_path
end

Then(/^The user must see a log\-in form$/) do
	expect(page).to have_content 'Sign in'
	expect(page).to have_title 'Sign in'
end

Given(/^A log\-in page$/) do
	visit login_path
end

When(/^The user fills the log\-in form on the log\-in page$/) do
	fill_in "Email", with: @user.email
	fill_in "Password", with: @user.password
	click_button 'Sign in'
end

Then(/^The user must be logged in and redirected to user's page$/) do
	expect(page).to have_title @user.nickname
	expect(page).to have_content 'Logged in!' 
end
