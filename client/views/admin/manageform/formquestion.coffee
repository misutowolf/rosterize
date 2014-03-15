Template.formQuestion.helpers

	formArrows: ->

		maxOrder = Questions.findOne({},{sort: {"order", 1}}).order
		questionOrder = Questions.findOne(this._id, {fields: {'order': 1}}).order

		console.log "max order: #{maxOrder}, current order: #{questionOrder}"
		
		# Check to see what arrows to render
		if questionOrder == 1
			"<i class='fa fa-chevron-circle-down' id='down'></i>"
		else if questionOrder < maxOrder
			"<i class='fa fa-chevron-circle-up' id='up'></i> | <i class='fa fa-chevron-circle-down' id='down'></i>"
		else
			"<i class='fa fa-chevron-circle-up' id='up'></i>"


Template.formQuestion.events

	'click #down': ->
		thisOrder = Questions.findOne(this._id, {fields: {"order":1}}).order
		alert "calling moveDown on question #{thisOrder}"
		Meteor.call('moveDown',thisOrder)

	'click #up': ->
		thisOrder = Questions.findOne(this._id, {fields: {"order":1}}).order
		alert "calling moveUp on question #{thisOrder}"
		Meteor.call('moveUp',thisOrder)