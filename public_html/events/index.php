<?php
	include('../perch/runtime.php');

	perch_layout('global.above', array(
			'title'           => perch_page_title(true),
			'rss'             => '/events/rss/',
			'section_heading' => 'events',
		));


	if (perch_get('event')) {


		perch_events_custom(array(
			'template'   => 'events/event.html',
			'filter'     => 'eventSlug',
			'match'      => 'eq',
			'value'      => perch_get('event'),
		));


	}else{


		perch_events_custom(array(
			'template'   => 'events/listing.html',
			'sort'       => 'eventDateTime',
			'sort-order' => 'ASC',
			'filter'     => 'eventDateTime',
			'match'      => 'gte',
			'value'      => date('Y-m-d 23:59:59'),
		));

	}



	

	perch_layout('global.sidebar', array(
			'events'     => false,
			'events-rss' => true,
			'members'    => true,
		));

	perch_layout('global.below');
?>