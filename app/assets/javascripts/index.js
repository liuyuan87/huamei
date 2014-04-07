;
(function(window, $) {
	var morePopup = $('#more-popup'),
		challengePopup = $('#challenge-popup'),
		detailsPopup = $('#details-popup'),
		flashPopup = $('#flash-popup'),
		winnersPopup = $('#winners-popup'),
		finishPopup = $('#finish-popup'),
		mark = $('#mark'),
		video = $('#header');

	init();
	bind();

	function init(){
		var reqData = 'type=logint5&detail=htmlaction&infof=app';
		
	}

	function bind() {
		$(document).on("click", "#more", function(event) {
			event.preventDefault();
			morePopup.show();
			video.hide();
			clickCount('moreinfo','htmlaction','app');
		}).on("click", "#challenge", function(event) {
			event.preventDefault();			
			finishPopup.show();
			mark.show();
		}).on("click", "#details", function(event) {
			event.preventDefault();
			detailsPopup.show();
			video.hide();
			clickCount('detail','htmlaction','app');
		});
		$('html').click(function(event){		
			if( event.currentTarget !== finishPopup && event.currentTarget !== $("#challenge") ) {
				finishPopup.hide();
				mark.hide();
			}
		});
	}

	function byteLen(text) {
        var len = text.length;
        var matcher = text.match(/[^\x00-\x80]/g);
        if(matcher) len += matcher.length;
        return len;
    }


})(window, jQuery);