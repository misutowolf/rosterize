Template.editQuestion.events

	'submit form': (e) ->

		# Prevent normal submission
		e.preventDefault()

		# Get information we need.

		theQuestion = $(e.target).find('[name=newQuestion]').val()
		Questions.update(this._id, {$set: {'question': theQuestion}}, (e) ->
			if e
				alert e.reason
			else
				Router.go 'manageForm'
			)
		


