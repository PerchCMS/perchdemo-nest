<?php
	include('../../perch/runtime.php');

	perch_layout('global.above', array(
			'title' => perch_page_title(true),
		));


	perch_content('Invitation to register');
	perch_member_form('register.html');


	perch_layout('global.sidebar', array(
			'events'  	=> true,
			'members' 	=> false,
		));

	perch_layout('global.below');
?>