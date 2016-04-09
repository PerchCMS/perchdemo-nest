<?php

	perch_layout('global.above', array(
			'title' => perch_page_title(true),
		));

	if (perch_member_logged_in()) {

		if (perch_member_has_tag('member')) {
			perch_content('Private members intro');
			perch_content('Files for members');
		}else{

			// logged in, but tag has expired
			perch_content('Membership renewal information');

			perch_shop_products([
					'category' => 'products/membership'
				]);
		}
		
	}else{
		perch_content('Login instructions');
		perch_members_login_form();
	}

	perch_layout('global.sidebar', array(
			'events'  	=> true,
			'members' 	=> false,
		));

	perch_layout('global.below');