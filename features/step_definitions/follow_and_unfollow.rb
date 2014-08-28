Given(/^A registered user$/) do
	@user = FactoryGirl.create(:user)
	sign_in @user
end

Given(/^Another registered user$/) do
	@user2 = FactoryGirl.create(:user)
	@user2.microposts.create(content: 'Woot!')
end

When(/^The first user visits the second user's page$/) do
	visit user_path(@user2.nickname)
end

Then(/^He sees the second user's microposts in his feed$/) do
	expect(page).to have_selector 'a', text: @user2.nickname
end

When(/^Clicks Follow button$/) do
	click_link 'Follow'
end

Given(/^Another registered user followed by the first one$/) do
	@user2 = FactoryGirl.create(:user)
	@user2.microposts.create(content: 'Woot!')
	@user.follow(@user2)
end

When(/^Clicks Unfollow button$/) do
	click_link 'Unfollow'
end

Then(/^He no more sees second user's microposts in his feed$/) do
	visit user_path(@user.nickname)
	expect(page).not_to have_selector 'a', text: @user2.nickname
end

Given(/^The user has some followers and followed users$/) do
	@user2 = FactoryGirl.create(:user)
	@user.follow(@user2)
	@user2.follow(@user)
end

Then(/^The users sees counter for followers and followed users$/) do
	visit user_path(@user)
	expect(page).to have_content "Followers"
	expect(page).to have_content "Follows"
end
