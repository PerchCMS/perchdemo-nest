<?php
	include('../perch/runtime.php');

	perch_layout('global.above', array(
			'title' => perch_page_title(true),
		));


	if (perch_member_logged_in()) {
		perch_content('Private members intro');
		perch_content('Files for members');
	}else{
		perch_content('Login instructions');
		perch_members_login_form();
	}

	
	

	perch_layout('global.sidebar', array(
			'events'  	=> true,
			'members' 	=> false,
		));

	perch_layout('global.below');
?>