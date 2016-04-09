<?php
	perch_layout('global.above', array(
			'title'           => perch_page_title(true),
			'section_heading' => 'shop',
		));

	PerchSystem::set_var('empty_cart_message', perch_content('Your cart is empty', true));
	perch_shop_cart();

	perch_layout('shop.sidebar', array(
			'promo' => true,
			'shipping' => true,
			'currency' => true,
		));

	perch_layout('global.below');