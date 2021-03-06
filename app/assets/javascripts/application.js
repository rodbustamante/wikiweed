// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap-sprockets
//= require fancybox
//= require_tree .
//= require jquery.raty

$(function () { 
	
	$(document).on('click', function(e) {
		trigger = $(".search-results");

		if (trigger !== e.target && !trigger.has(e.target).length && trigger.hasClass('open') ) {
			$(".search-results").removeClass('open').children('ul').html('');
		}
	});

	var typingTimer;                //timer identifier
	var doneTypingInterval = 1000;  //time in ms, 5 second for example
	var $input = $('.search-plant');

	//on keyup, start the countdown
	$input.on('keyup', function () {
		clearTimeout(typingTimer);
		typingTimer = setTimeout(doneTyping, doneTypingInterval);
	});

	//on keydown, clear the countdown 
	$input.on('keydown', function () {
		clearTimeout(typingTimer);
	});

	//user is "finished typing," do something
	function doneTyping () {
	  	var keyword = $input[0].value;
		
		$(".search-results").children('ul').html('');
		
		if (keyword.length) {	
			$.ajax({
				url: '/searches/search_ajax/?keyword=' + keyword,
				type: 'GET',
				dataType: 'JSON',
				success: function (data) {
					if (!$(".search-results").hasClass('open')) {
						$(".search-results").addClass('open');
					}

					if (data.length > 0) {
						
						for (var i = 0; i < data.length; i++) {
							$(".search-results").children('ul').append('<li class="group">' + data[i].group + '</li>');

							for (var x = 0; x < data[i].results.length; x++) {
								$(".search-results").children('ul').append('<li><a class="result" href="/plantas/' + data[i].results[x].slug + '">' + data[i].results[x].name + '</a></li>');
							}
						};
					} else {
						$(".search-results").children('ul').append('<li><a class="result">No se encontraron resultados.</a></li>');
					}
				}
			});	
		}
	}
	
	$("i.fa-times").on('click', function(ev) {
		$(this).parent('p').fadeOut('slow/400/fast', function() {
			
		});
	});

	$("a.sign-in").fancybox({
	 	type: 'iframe',
	 	padding: 15,
	 	height: 380,
	 	titleShow: false,
	 	onClosed: function() {
          parent.location.reload(true);
        }
	});

	$("a.sign-up").fancybox({
	 	type: 'iframe',
	 	padding: 15,
	 	titleShow: false,
	 	onClosed: function() {
          parent.location.reload(true);
        }
	});

	$("a.profile").fancybox({
		type: 'iframe',
		height: 600,
		padding: 15,
		titleShow: false,
		onClosed: function() {
	 		parent.location.reload(true);
		}
	});
});