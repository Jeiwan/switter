Given(/^A user$/) do
end

Given(/^A users page$/) do
	21.times { FactoryGirl.create(:user) }
end

When(/^The user visits the users page$/) do
	visit users_path
end

Then(/^He sees a list of all users with pagination and (\d+) user per page$/) do |arg1|
	expect(page).to have_title 'Users'
	expect(page).to have_selector 'ul.b-users'
	expect(page).to have_selector 'ul.pagination'
	expect(page.all('.b-user').count).to eq 20
end
