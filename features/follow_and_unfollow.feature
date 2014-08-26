Feature: Follow and unfollow users

	Scenario: A user can follow and unfollow another user
		Given A registered user
		And Another registered user
		When The first user visits the second user's page and clicks Follow button
		Then He sees the second user's microposts in his feed
