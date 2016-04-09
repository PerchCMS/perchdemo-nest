<?php
	perch_layout('global.above', array(
			'title'           => perch_page_title(true),
			'section_heading' => 'shop',
		));


	perch_shop_products();

	perch_layout('global.sidebar', array(
			'events'  	=> true,
			'members' 	=> true,
		));

	perch_layout('global.below');