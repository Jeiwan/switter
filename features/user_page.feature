Feature: User page
	Scenario: A user visits his page and becomes happy
		Given A registered and signed in user
		When The user visits his page
		Then The page has log out and settings links, his avatar, nickname, and microposts
