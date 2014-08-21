Given(/^A registered and logged in user$/) do
	@user = FactoryGirl.create(:user)
	sign_in @user
end

Then(/^He sees microposts list and the form form posting a new micropost$/) do
	expect(page).to have_selector 'form'
	expect(page).to have_selector '.b-microposts'
end

When(/^Posts a new micropost$/) do
	fill_in 'micropost_content', with: 'Hello, world!'
	click_button 'Post'
end

Then(/^The micropost appears on the page$/) do
	expect(page).to have_selector '.b-micropost'
	expect(page).to have_content 'Hello, world!'
end
