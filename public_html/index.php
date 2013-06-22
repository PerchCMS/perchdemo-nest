<?php
	include('perch/runtime.php');

	perch_layout('global.above', array(
			'title'    => perch_page_title(true),
			'carousel' => true,
			'banner'   => perch_content('Banner', true),
		));
	
	$featured_album = perch_gallery_album_listing(array(
			'count'         => 1,
			'filter'        => 'featured',
			'match'         => 'eq',
			'value'         => '1',
			'skip-template' => true,
		));

	if ($featured_album) {
		perch_gallery_album($featured_album[0]['albumSlug'], array(
			'template' => 'homepage_featured.html',
			));
	}

	perch_blog_custom(array(
			'count'      => 3,
			'template'   => 'home_list.html',
			'sort'       => 'postDateTime',
			'sort-order' => 'DESC',
		));

	perch_layout('global.sidebar', array(
			'events'  	=> true,
			'members' 	=> true,
		));

	perch_layout('global.below', array(
			'carousel' => true,
		));
?>