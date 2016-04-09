<?php

	if (!perch_member_logged_in()) {
		PerchSystem::redirect('/shop/register');
	}

	if (perch_shop_cart_has_property('terms_agreed')) {
		perch_shop_checkout('manual', [
			'return_url' => '/shop/result',
    		'cancel_url' => '/shop',
			]);
	}

	perch_layout('global.above', array(
			'title'           => perch_page_title(true),
			'section_heading' => 'shop',
		));



    // Show the cart with a non-interactive template
    perch_shop_cart([
        'template'=>'cart/cart_static.html'
    ]);

    // Show the order addresses
    perch_shop_order_addresses();

    // Display the form with the T&Cs checkbox
    perch_shop_form('checkout/confirm.html');




	perch_layout('shop.sidebar', array(
			'promo' => false,
			'shipping' => false,
			'currency' => false,
			'minicart' => false,
			'social' => false,
		));

	perch_layout('global.below');