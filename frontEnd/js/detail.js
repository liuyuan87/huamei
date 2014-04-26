;
(function(window, $) {

	init();

	function init(){
		$('.slider').glide({
			autoplay: false,
			animationDuration: 300,
			circular: false,
			touchDistance: 80
		});		
	}

})(window, jQuery);