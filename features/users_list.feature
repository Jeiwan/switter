Feature: Users page

	Scenario: List all users
		Given A user
		And A users page
		When The user visits the users page
		Then He sees a list of all users with pagination and 20 user per page
