$(function () { 

  $('[data-toggle="tooltip"]').tooltip();

  $('.change-password').on('click', function(ev) {
  	$('.change-password-input').fadeToggle('slow/400/fast', function() {
  		
  	});
  });
	
});