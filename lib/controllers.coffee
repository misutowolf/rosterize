class @LoginController extends RouteController
	before: ->
		console.log 'LoginController :before action!'
		unless Meteor.user()?
			if Meteor.loggingIn()
				@render @loadingTemplate
			else
				@render 'accessDenied'
			@stop();

# Require admin
class @AdminController extends RouteController
	before: ->
		console.log 'AdminController :before action!'
		if Meteor.user()
			console.log "Admin: #{Meteor.user().admin}"
			unless Meteor.user().admin
				if Meteor.loggingIn()
					@render @loadingTemplate
				else
					@render 'accessDeniedAdmin'
				@stop()
		else
			if Meteor.loggingIn()
				@render @loadingTemplate
			else
				@render 'accessDeniedAdmin'
			@stop();