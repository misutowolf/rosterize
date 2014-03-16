Template.formQuestion.helpers

	formArrows: ->

		maxOrder = Questions.findOne({},{sort: {"order", 1}}).order
		questionOrder = Questions.findOne(this._id, {fields: {'order': 1}}).order
		
		# Check to see what arrows to render
		if questionOrder == 1
			"<i class='fa fa-chevron-circle-down down'></i>"
		else if questionOrder < maxOrder
			"<i class='fa fa-chevron-circle-up up'></i> | <i class='fa fa-chevron-circle-down down'></i>"
		else
			"<i class='fa fa-chevron-circle-up up'></i>"


Template.formQuestion.events

	'click .down': ->
		theQuestion = this._id
		Meteor.call('moveDown', theQuestion)

	'click .up': ->
		theQuestion = this._id
		Meteor.call('moveUp', theQuestion)

	'click .delete-link': (e) ->
		e.preventDefault()
		theQuestion = this._id
		if confirm("Are you sure you want to delete this question?")
			Meteor.call('removeQuestion',theQuestion)
