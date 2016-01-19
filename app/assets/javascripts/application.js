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

	$(".search-plant").on('keyup', function(event) {
		var keyword = $(this)[0].value;
		$(".search-results").children('ul').html('');
		
		if ($(".search-results").hasClass('open')) {
			$(".search-results").removeClass('open');
		}

		if (keyword.length > 0) {	
			$.ajax({
				url: '/searches/search/?keyword=' + keyword,
				type: 'GET',
				dataType: 'JSON',
				success: function (data) {
					$(".search-results").addClass('open');
					console.log(data)
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
	});

});