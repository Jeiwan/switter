Given(/^A user who wants to register$/) do
end

Given(/^An Index page$/) do
	visit root_path
	expect(page).to have_content 'Welcome'
end

When(/^User clicks sign up$/) do
	click_link 'Sign up'
end

Then(/^User must be lead to sign\-up page$/) do
	expect(current_path).to eq signup_path
end

Given(/^A sign\-up page$/) do
	visit signup_path
	expect(page).to have_title 'Sign up'
end

When(/^User fills the form with correct data$/) do
	fill_in 'Nickname', with: 'Pedro'
	fill_in 'Fullname', with: 'Pedro Alvarez'
	fill_in 'Email', with: 'pedro@mexi.co'
	fill_in 'Password', with: 'asdzxcasd'
	fill_in 'Password confirmation', with: 'asdzxcasd'
end

Then(/^User must be registered and redirected to index page with success message$/) do
	expect {
		click_button 'Sign up'
	}.to change{User.all.count}.by(1)
	expect(page).to have_content 'Signed up!'
end
