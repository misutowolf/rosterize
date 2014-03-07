Accounts.ui.config 
	passwordSignupFields: 'USERNAME_AND_EMAIL'

Deps.autorun ->
	Meteor.subscribe 'userData'