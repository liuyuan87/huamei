var Music = {
	init : function(){
		this.shuffle = localStorage.shuffle || 'false';
		this.repeat = localStorage.repeat || 0;
		this.continous = true;
		this.autoplay = false;
	
		// Load playlist
		for (var i = 0, item; item = this.playlist[i]; i ++){
			$('#playlist').append('<li>' + item.artist + ' - ' + item.title + '</li>');
		}
		
		this.currentTrack = this.shuffle === 'true' ? new Date().getTime() % this.playlist.length : 0,
		this.trigger = false;
			
		this.volume = localStorage.volume || 0.5;
		
		if (this.shuffle === 'true') $('.shuffle').addClass('enable');
		if (this.repeat == 1){
			$('.repeat').addClass('once');
		} else if (this.repeat == 2){
			$('.repeat').addClass('all');
		}
		this.bind();
	},
	loadMusic : function(i){
		this.currentTrack = i;
		var item = this.playlist[i],
			newaudio = $('<audio>').html('<source src="'+item.mp3+'"><source src="'+item.ogg+'">').appendTo('#player');
		
		$('.cover').html('<img src="'+item.cover+'" alt="'+item.title+'">');
		$('.tag').html('<strong>'+item.title+'</strong><span class="artist">'+item.artist+'</span>');
		$('#playlist li').removeClass('playing').eq(i).addClass('playing');
		this.audio = newaudio[0];
		this.audio.volume = $('.mute').hasClass('enable') ? 0 : this.volume;
		this.audio.addEventListener('progress', this.beforeLoad, false);
		this.audio.addEventListener('durationchange', this.beforeLoad, false);
		this.audio.addEventListener('canplay', this.afterLoad, false);
		this.audio.addEventListener('ended', this.ended, false);
	},
	play : function(){
		this.audio.play();
		$('.playback').addClass('playing');
		this.timeout = setInterval(this.updateProgress, 500);
		this.isPlaying = true;
	},
	pause : function(){
		this.audio.pause();
		$('.playback').removeClass('playing');
		clearInterval(this.updateProgress);
		this.isPlaying = false;
	},
	setProgress : function(value){
		var currentSec = parseInt(value%60) < 10 ? '0' + parseInt(value%60) : parseInt(value%60),
			ratio = value / this.audio.duration * 100;

		$('.timer').html(parseInt(value/60)+':'+currentSec);
		$('.progress .pace').css('width', ratio + '%');
		$('.progress .slider a').css('left', ratio + '%');
	},
	updateProgress : function(){
		Music.setProgress(Music.audio.currentTime);
	},
	setVolume : function(value){
		this.audio.volume = localStorage.volume = value;
		$('.volume .pace').css('width', value * 100 + '%');
		$('.volume .slider a').css('left', value * 100 + '%');
	},
	switchTrack : function(i){
		if (i < 0){
			track = this.currentTrack = this.playlist.length - 1;
		} else if (i >= this.playlist.length){
			track = this.currentTrack = 0;
		} else {
			track = i;
		}

		$('audio').remove();
		this.loadMusic(track);
		if (this.isPlaying == true) this.play();
	},
	shufflePlay : function(){
		var time = new Date(),
			lastTrack = this.currentTrack;
		this.currentTrack = time.getTime() % this.playlist.length;
		if (lastTrack == this.currentTrack) ++this.currentTrack;
		this.switchTrack(this.currentTrack);
	},
	ended : function(){
		Music.pause();
		Music.audio.currentTime = 0;
		Music.playCounts++;
		if (Music.continous == true) Music.isPlaying = true;
		if (Music.repeat == 1){
			Music.play();
		} else {
			if (Music.shuffle === 'true'){
				Music.shufflePlay();
			} else {
				if (Music.repeat == 2){
					Music.switchTrack(++Music.currentTrack);
				} else {
					if (Music.currentTrack < Music.playlist.length) Music.switchTrack(++Music.currentTrack);
				}
			}
		}
	},
	beforeLoad : function(){
		var endVal = this.seekable && this.seekable.length ? this.seekable.end(0) : 0;
		$('.progress .loaded').css('width', (100 / (Music.duration || 1) * endVal) +'%');
	},
	afterLoad : function(){
		if (Music.autoplay == true) Music.play();
	},
	bind : function(){
		var self = this;
		$('.progress .slider').slider({step: 0.1, slide: function(event, ui){
			$(this).addClass('enable');
			self.setProgress(self.audio.duration * ui.value / 100);
			clearInterval(self.timeout);
		}, stop: function(event, ui){
			self.audio.currentTime = self.audio.duration * ui.value / 100;
			$(this).removeClass('enable');
			self.timeout = setInterval(self.updateProgress, 500);
		}});
	
		$('.volume .slider').slider({max: 1, min: 0, step: 0.01, value: self.volume, slide: function(event, ui){
			self.setVolume(ui.value);
			$(this).addClass('enable');
			$('.mute').removeClass('enable');
		}, stop: function(){
			$(this).removeClass('enable');
		}}).children('.pace').css('width', self.volume * 100 + '%');
	
		$('.mute').click(function(){
			if ($(this).hasClass('enable')){
				self.setVolume($(this).data('volume'));
				$(this).removeClass('enable');
			} else {
				$(this).data('volume', self.audio.volume).addClass('enable');
				self.setVolume(0);
			}
		});
	
	
		$('.playback').on('click', function(){
			if ($(this).hasClass('playing')){
				self.pause();
			} else {
				self.play();
			}
		});
		$('.rewind').on('click', function(){
			if (self.shuffle === 'true'){
				self.shufflePlay();
			} else {
				self.switchTrack(--self.currentTrack);
			}
		});
		$('.fastforward').on('click', function(){
			if (self.shuffle === 'true'){
				self.shufflePlay();
			} else {
				self.switchTrack(++self.currentTrack);
			}
		});
		$('#playlist li').each(function(i){
			var _i = i;
			$(this).on('click', function(){
				self.switchTrack(_i);
			});
		});
	
		$('.repeat').on('click', function(){
			if ($(this).hasClass('once')){
				self.repeat = localStorage.repeat = 2;
				$(this).removeClass('once').addClass('all');
			} else if ($(this).hasClass('all')){
				self.repeat = localStorage.repeat = 0;
				$(this).removeClass('all');
			} else {
				self.repeat = localStorage.repeat = 1;
				$(this).addClass('once');
			}
		});
	
		$('.shuffle').on('click', function(){
			if ($(this).hasClass('enable')){
				self.shuffle = localStorage.shuffle = 'false';
				$(this).removeClass('enable');
			} else {
				self.shuffle = localStorage.shuffle = 'true';
				$(this).addClass('enable');
			}
		});
	}
};