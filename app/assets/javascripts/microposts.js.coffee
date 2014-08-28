# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	inUse = false
	$feed = $('#microposts')
	nickname = $('#user-nickname').data('nickname')
	pastScrollTop = 0

	loadTweets = (nickname, cursor) ->
		inUse = true
		$.ajax({
			dataType: 'json',
			type: 'GET',
			url: '/api/microposts.json/' + nickname + '/' + cursor.toString(),
			success: (data) ->
				$.each(data, (d) ->
					li = $("<li class='b-micropost'></li>")
					#img = $("<img src='http://gravatar.com/avatar/#{md5}?size=50'>")
					span = $("<span>Posted by <a href='#'>" + data[d].user.nickname + "</a> " + data[d].created + " ago</span>")
					p = $("<p>" + data[d].content + "</p>")
					$feed.append(li.append(span).append(p))
				)
				inUse = false
				toggleSpinner()
		})
	
	toggleSpinner = ->
		$signal = $("#signal")
		if $signal.length > 0
			$signal.remove()
		else
			$signal = $('<li id="signal"><div></div></li>')
			$feed.append($signal)

	$(window).scroll ->
		if ( $(window).scrollTop() >= pastScrollTop && $(window).scrollTop() + $(window).height() == $(document).height() && !inUse)
			toggleSpinner()
			loadTweets nickname, $feed.find('li').length
		pastScrollTop = $(window).scrollTop()
		true
