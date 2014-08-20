Feature: Log-out
	Scenario: Log out
		Given A signed in user
		When The user clicks 'Log out' link on his page
		Then The user must be logged out and redirected to root_path
