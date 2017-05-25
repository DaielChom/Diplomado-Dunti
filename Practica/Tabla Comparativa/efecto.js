$(document).ready(function(){
	var altura = $('.tabla_titulo').offset().top;

	$(window).on('scroll', function(){
		if ( $(window).scrollTop() > altura ){
			$('.titulo_fix').addClass('fixed');
	
		} else {
			$('.titulo_fix').removeClass('fixed');

		}
	});

});
