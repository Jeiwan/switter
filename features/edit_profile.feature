Feature: Edit profile

	Scenario: User changes his fullname
		Given A registered and signed in user
		When The user visits settings page
		And Edit his fullname
		Then He is redirected to his page and his fullname is changed
