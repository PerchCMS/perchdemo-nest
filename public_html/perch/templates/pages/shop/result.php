<?php

	perch_layout('global.above', array(
			'title'           => perch_page_title(true),
			'section_heading' => 'shop',
		));


	// Has the order been succcessfully placed?
	if (perch_shop_order_successful()) {

	    // Yes! Show a success message
	    perch_content('Order successful');

	    // Redisplay the details of the order
	    perch_shop_order_items(
	        perch_shop_successful_order_id()
	    );

	    perch_shop_empty_cart();

	}else{
	    
	    // Payment problem! Show instructions to the customer
	    perch_content('Payment not successful');
	}


	perch_layout('shop.sidebar', array(
			'promo'     => false,
			'shipping'  => false,
			'currency'  => false,
			'minicart'  => false,
			'social'    => false,
			'password'  => true,
			'downloads' => true,
		));

	perch_layout('global.below');