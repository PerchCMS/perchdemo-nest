<?php
	include('../perch/runtime.php');

	perch_layout('global.above', array(
			'title' => perch_page_title(true),
		));


	perch_content('About us');	
	

	perch_layout('global.sidebar', array(
			'events'  	=> true,
			'members' 	=> true,
		));

	perch_layout('global.below');
?>