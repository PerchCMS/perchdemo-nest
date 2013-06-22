<?php
	include($_SERVER['DOCUMENT_ROOT'].'/perch/runtime.php');

	perch_layout('global.above', array(
			'title' => perch_page_title(true),
		));

	perch_content_create('Main content', array(
		'template' => 'text_block.html',
		));

	perch_content('Main content');	
	
	perch_layout('global.sidebar', array(
			'events'  	=> true,
			'members' 	=> true,
		));

	perch_layout('global.below');
?>