Template.header.helpers

	isAdmin: ->
		console.log "isAdmin: #{Meteor.user()?.admin}"
		Meteor.user()?.admin