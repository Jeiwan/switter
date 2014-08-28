Feature: Follow and unfollow users

	Scenario: A user can follow another user
		Given A registered user
		And Another registered user
		When The first user visits the second user's page
		And Clicks Follow button
		Then He sees the second user's microposts in his feed
	
	Scenario: A user can unfollow another user
		Given A registered user
		And Another registered user followed by the first one
		When The first user visits the second user's page
		And Clicks Unfollow button
		Then He no more sees second user's microposts in his feed
	
	Scenario: A user has followers and followed users counts on his page
		Given A registered user
		And The user has some followers and followed users
		When The user visits his page
		Then The users sees counter for followers and followed users
