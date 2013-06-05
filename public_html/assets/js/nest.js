var Nest = {};
Nest.UI  = {};

Nest.UI.Global = function() {

	var init = function() {

		// Gallery
		$('.album-images').magnificPopup({
		  	delegate: 'a',
			type: 'image',
			gallery: {enabled:true}
		});
	}

	return {
		init: init
	}

}();

jQuery(document).ready(function($) {
	Nest.UI.Global.init();
});