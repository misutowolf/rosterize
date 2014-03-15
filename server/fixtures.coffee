# Fixtures, in case of new installation!

Meteor.startup ->

	# Default user!
	if Meteor.users.find().count() is 0
		console.log "No users found, creating default (defaultUser / default)."
		
		# admin
		Accounts.createUser
			username: 'defaultUser'
			email: 'default@user.com'
			password: 'default'

		# test applicant
		theUser = Accounts.createUser
			username: 'testUser'
			email: 'test@user.com'
			password: 'test'
			
	if Apps.find().count() is 0

		appUser = Meteor.users.findOne({'username':'testUser'})

		console.log "No apps found, creating test app using testUser (id = #{appUser._id}"
		
		testApp = 
			userId: appUser._id
			questions: [
				{
					question: 'What is your name?'
					response: appUser.username
				},
				{
					question: 'What is your quest?'
					response: 'To test rosterize.'
				},
				{
					question: 'What is your favorite color?'
					response: 'Blue.  No...yell--AUGGGGGGGGHHHHHHH!!!'
				}
			]

		Apps.insert testApp
		
	if Form.find().count() is 0
		
		console.log "No form found, creating a sample form, based on sample app"
		
		testForm =
			questions: [
				{
					order: 1
					question: "What is your name?"
				},
				{
					order: 2
					question: "What is your quest?"
				},
				{
					order: 3
					question: "What is your favorite color?"
				}
			]
			
		Form.insert testForm