# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	#$new_microposts = $('#micropost_content')
	#if $new_microposts.length > 0
	symbolCounter = new SymbolCounter()

	$cropbox = $("#cropbox")
	$cropbox.on 'load', ->
		$cropbox.Jcrop({
			aspectRatio: 1,
			onSelect: updateCoords,
			onChange: updateCoords,
			setSelect: [0, 0, $cropbox.width(), $cropbox.height()]
		})

	updateCoords = (coords) ->
		$('#crop_crop_x').val(coords.x)
		$('#crop_crop_y').val(coords.y)
		$('#crop_crop_w').val(coords.w)
		$('#crop_crop_h').val(coords.h)
		true
	
	true

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
