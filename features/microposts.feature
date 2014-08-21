Feature: Microposts

	Scenario: User signs in, visits hist page, and sees his microposts and the form for posting a new micropost
		Given A registered and logged in user
		When The user visits his page
		Then He sees microposts list and the form form posting a new micropost

	Scenario: User visits his page, writes a new micropost in a textarea, click Post and sees a new micropost on the page
		Given A registered and logged in user
		When The user visits his page
		And Posts a new micropost
		Then The micropost appears on the page
