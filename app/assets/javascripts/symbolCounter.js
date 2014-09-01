function SymbolCounter() {
	this.$el = $('#micropost_content');
	this.$el.after($('<span class="symbolCounter">0</span>'));
	this.$counter = this.$el.siblings('.symbolCounter');
	this.init(140);
};

SymbolCounter.prototype.init = function(maxlength) {
	var that = this;
	var length;
	this.$el.on('keyup', function() {
		that.$counter.removeClass('lengthExceeded');
		that.$el.removeClass('lengthExceeded');
		length = that.$el.val().length;
		that.$counter.text(length);
		if (length > maxlength) {
			that.$counter.addClass('lengthExceeded');
			that.$el.addClass('lengthExceeded');
		}
	});
};
