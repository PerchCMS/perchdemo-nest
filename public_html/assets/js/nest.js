var Nest = {};
Nest.UI  = {};

Nest.UI.Global = function() {

	var init = function() {
		
		init_gallery();
		init_address_form();

	};

	var init_address_form = function() {
		var form = $('form[data-address-duplicate]');
		if (form.length) {
			form.on('change', 'input, select', function(e){
				var field = $(e.target);
				var dupe = form.find('[name=shipping_'+field.attr('name').replace('billing_', '')+']');
				if (dupe) dupe.val(field.val());
			});
		};
	};

	var init_gallery = function() {
		// Gallery
		var images = $('.album-images');
		if (images.length) {
			images.magnificPopup({
			  	delegate: 'a',
				type: 'image',
				gallery: {enabled:true}
			});
		};
	};


	return {
		init: init
	};
}();

jQuery(document).ready(function($) {
	Nest.UI.Global.init();
});