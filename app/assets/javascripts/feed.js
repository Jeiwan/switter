function Feed(el) {
	this.$el = $(el);
	this.setScrollEvent();
	this.nickname = $("#user-nickname").data("nickname");
	this.cursor = this.$el.find("li").length;
	this.inUser = false;
}

Feed.prototype.setScrollEvent = function() {
	var pastScrollTop = 0;
	var that = this;
	$(window).scroll(function() {
		var currentScrollTop = $(window).scrollTop();
		if (currentScrollTop >= pastScrollTop && currentScrollTop + $(window).height() == $(document).height() && !that.inUse) {
			that.toggleSpinner();
			that.fetchTweets();
		}
		pastScrollTop = currentScrollTop;
	});
};

Feed.prototype.toggleSpinner = function(spinner) {
	var $spinner = $("#signal");
	if ($spinner.length > 0) {
		$spinner.remove();
	} else {
		$spinner= $("<li id='signal'><div></div></li>");
		this.$el.append($spinner);
	}
};

Feed.prototype.fetchTweets = function() {
	this.inUse = true;
	var that = this;

	$.ajax({
		dataType: 'json',
		type: 'GET',
		url: '/api/microposts.json/' + this.nickname + '/' + this.cursor.toString(),
		success: function(data) {
			$.each(data, function(d) {
				var li = $("<li class='b-micropost'></li>");
				var img = $("<img src='" + data[d].user.avatar + "' width=50 height=50 class='avatar'>");
				var span = $("<span>Posted by <a href='#'>" + data[d].user.nickname + "</a> " + data[d].created + " ago</span>");
				var p = $("<p>" + data[d].content + "</p>");
				that.$el.append(li.append(img).append(span).append(p));
			});
			that.toggleSpinner();
			that.inUse = false;
		}
	})
};
