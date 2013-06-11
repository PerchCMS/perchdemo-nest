<?php
	include('../perch/runtime.php');

	perch_layout('global.above', array(
			'title' => perch_page_title(true),
		));


	perch_shop_custom(array(
	    'template'=>'listing.html'
	));


	

	perch_layout('global.sidebar', array(
			'events'  	=> true,
			'members' 	=> true,
		));

	perch_layout('global.below');
?>