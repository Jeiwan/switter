# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

this.followUser = (userId, that) ->
	$.ajax({
		url: '/follow',
		dataType: 'json',
		type: 'POST',
		data: {user_id: userId},
		success: (data) ->
			console.log data
			if data.answer == "followed"
				that.text = "Unfollow"
			else
				that.text = "Follow"
	})
