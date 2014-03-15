Template.addQuestion.events

	'submit form': (e) ->		

		# First, we get the correct order number
		maxOrder = Questions.findOne({},{sort: {"order", 1}}).order
		theOrder = maxOrder + 1
		theQuestion = $(e.target).find('[name=newQuestion]').val()

		addQuestion =
			order: theOrder
			question: theQuestion 

		addQuestion._id = Questions.insert addQuestion

		e.preventDefault()