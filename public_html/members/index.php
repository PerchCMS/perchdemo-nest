<?php
	include('../perch/runtime.php');

	perch_layout('global.above', array(
			'title' => perch_page_title(true),
		));


	if (perch_member_logged_in()) {

	}else{

		perch_members_login_form();
	}

	
	

	perch_layout('global.sidebar', array(
			'events'  	=> true,
			'members' 	=> false,
		));

	perch_layout('global.below');
?>