<?php
	include('../perch/runtime.php');

	perch_layout('global.above', array(
			'title'           => perch_page_title(true),
			'carousel'        => true,
			'section_heading' => 'gallery',
		));


	if (perch_get('album')) {

		perch_gallery_album(perch_get('album'), array(
			'template'   => 'album_images.html',
		));

	}else{

		perch_gallery_album_listing(array(
			'template'   => 'album_listing.html',
			'image'      => true,
			'filter'	 => 'featured',
			'match'		 => 'eq',
			'value'		 => '1',
		));


		perch_gallery_album_listing(array(
			'template'   => 'album_listing.html',
			'image'      => true,
			'sort'       => 'date',
			'sort-order' => 'DESC',
			'filter'	 => 'featured',
			'match'		 => 'neq',
			'value'		 => '1',
		));

	}

	perch_layout('global.sidebar', array(
			'events'  	=> true,
			'members' 	=> true,
		));


	perch_layout('global.below', array(
		'carousel' => true,
		));
?>