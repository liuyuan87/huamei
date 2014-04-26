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

$(function(){
	// 幻灯片
	var fl_lis = $('.flashpic').hide()
		, fl_l = fl_lis.length
		, fl_i = fl_l - 1
		, fl_cur_li = $(fl_lis[fl_i])
		, flashpics_timer
		, fl_arr = [];
	
	fl_arr.push('<span>');
	for(var j = 1; j <= fl_l; j ++){
		fl_arr.push('<i>' + j + '</i>');
	}
	fl_arr.push('</span>');
	$('#figure').append(fl_arr.join(''));
	
	var dNums = $('#figure i')
		, curNum = $(dNums[fl_i]);
	
	function fn_flashpics(){
		fl_i ++;
		if(fl_i == fl_l){
			fl_i = 0;
		}
		fl_cur_li.hide();
		fl_cur_li = $(fl_lis[fl_i]);
		fl_cur_li.fadeIn();
		curNum.removeClass('cur');
		curNum = $(dNums[fl_i]);
		curNum.addClass('cur');
		clearTimeout(flashpics_timer);
		flashpics_timer = setTimeout(fn_flashpics, 3000);
	}
	fn_flashpics();
	
	$('#figure i').hover(function(){
		clearTimeout(flashpics_timer);
		fl_i = $(this).index();
		fl_cur_li.hide();
		fl_cur_li = $(fl_lis[fl_i]);
		fl_cur_li.fadeIn();
		curNum.removeClass('cur');
		curNum = $(this);
		curNum.addClass('cur');
	}, function(){
		flashpics_timer = setTimeout(fn_flashpics, 1000);
	});
});
