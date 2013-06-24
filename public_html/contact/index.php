<?php
	include('../perch/runtime.php');

	perch_layout('global.above', array(
			'title'           => perch_page_title(true),
			'section_heading' => 'contact',
		));


	perch_content('Contact form');	
	

	perch_layout('global.sidebar', array(
			'events'  	=> true,
			'members' 	=> true,
		));

	perch_layout('global.below');
?>