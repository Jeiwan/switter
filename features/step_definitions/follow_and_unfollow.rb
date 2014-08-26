Given(/^A registered user$/) do
	@user = FactoryGirl.create(:user)
	sign_in @user
end

Given(/^Another registered user$/) do
	@user2 = FactoryGirl.create(:user)
	@user2.microposts.create(content: 'Woot!')
end

When(/^The first user visits the second user's page and clicks Follow button$/) do
	visit user_path(@user2.nickname)
	click_link 'Follow'
end

Then(/^He sees the second user's microposts in his feed$/) do
	#visit user_path(@user.nickname)
	expect(page).to have_selector 'a', text: @user2.nickname
end
