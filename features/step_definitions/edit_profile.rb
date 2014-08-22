When(/^The user visits settings page$/) do
	visit settings_path
	expect(page).to have_title 'Settings'
end

When(/^Edit his fullname$/) do
	fill_in 'Fullname', with: 'Chuck Norris'
	fill_in 'Password', with: @user.password
	fill_in 'Password confirmation', with: @user.password_confirmation
	click_button 'Edit'
end

Then(/^He is redirected to his page and his fullname is changed$/) do
	expect(page).to have_title @user.nickname
	expect(page).to have_content 'Chuck Norris'
end
