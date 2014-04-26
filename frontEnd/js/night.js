;
(function(window, $) {
	var $personIntro = $('#personIntro');

	init();
	bind();

	function init(){
		var reqData = 'type=logint5&detail=htmlaction&infof=app';
		
	}

	function bind() {
		$(document).on("click", "#personIntro li", function() {
			$(this).addClass('active').siblings('li').removeClass('active');
			$(this).siblings('li').hide();
		}).on("click", "#personIntro .active", function() {
			$(this).removeClass('active');	
			$('#personIntro li').show();
		});
	}

	function byteLen(text) {
        var len = text.length;
        var matcher = text.match(/[^\x00-\x80]/g);
        if(matcher) len += matcher.length;
        return len;
    }


})(window, jQuery);