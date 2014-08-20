Feature: Correct layout

	Scenario: Layout for not signed in user
		Given A user who's not signed in
		When The user visits index page
		Then The user must see welcome page without log-out and settings links

	Scenario: Layout for signed in user
		Given A user who's signed in
		When The user visits index page
		Then The user must see his page with his name, log out and settings links
