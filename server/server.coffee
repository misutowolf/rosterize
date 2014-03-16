Meteor.methods

	moveDown: (id) ->
		startPos = Questions.findOne(id).order
		Questions.update({"order":startPos+1},{$set:{"order":startPos}})
		Questions.update(id,{$inc:{"order":1}})

	moveUp: (id) ->
		startPos = Questions.findOne(id).order
		Questions.update({"order":startPos-1},{$set:{"order":startPos}})
		Questions.update(id,{$inc:{"order":-1}})
		
	removeQuestion: (id) ->
		thisPos = Questions.findOne(id).order
		Questions.update({"order":{$gt:thisPos}},{$inc:{"order":-1}},{multi:true})
		Questions.remove(id)