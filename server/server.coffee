Meteor.methods

	moveDown: (thisOrder) ->
		console.log "called moveDown on question #{thisOrder}"
		Questions.update({"order": thisOrder},{$inc:{"order":1}})
		Questions.update({"order": thisOrder+1},{$inc:{"order":-1}})

	moveUp: (thisOrder) ->
		console.log "called moveUp on question #{thisOrder}"
		Questions.update({"order": thisOrder},{$inc:{"order":-1}}, (error) ->
			console.log "error: #{error}"
		)
		Questions.update({"order": thisOrder-1},{$inc:{"order":1}})