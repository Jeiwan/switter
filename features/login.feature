Feature: Log in
	In order to log in
	As a registered user
	I want to fill a log-in form and log in

	Scenario: Visit log-in page
		Given A user who wants to log in
		When The user visits log-in page
		Then The user must see a log-in form
	
	Scenario: Log in
		Given A user who wants to log in
		And A log-in page
		When The user fills the log-in form on the log-in page
		Then The user must be logged in and redirected to user's page
