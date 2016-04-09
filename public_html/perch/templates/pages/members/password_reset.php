<?php

	perch_layout('global.above', array(
			'title' => perch_page_title(true),
		));

	perch_content('Password reset information');

	perch_member_form('reset_password.html');

	perch_layout('global.sidebar', array(
			'events'  	=> true,
			'members' 	=> false,
		));

	perch_layout('global.below');
