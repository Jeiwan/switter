Feature: Sign up
	In order to sign up
	As a user
	I want to visit sign-up page, fill sign-up form, and become a registered user

	Scenario: Visit sign-up page
		Given A user who wants to register
		And An Index page
		When User clicks sign up
		Then User must be lead to sign-up page
	
	Scenario: Fill sign-up form
		Given A user who wants to register
		And A sign-up page
		When User fills the form with correct data
		Then User must be registered and redirected to index page with success message
