<?php
	include('../perch/runtime.php');

	perch_layout('global.above', array(
			'title' => perch_page_title(true),
			'rss'	=> '/blog/rss/',
		));


	perch_blog_custom(array(
		'template'   => 'listing.html',
		'count'      => 10,
		'sort'       => 'postDateTime',
		'sort-order' => 'DESC',
	));	



	perch_layout('global.sidebar', array(
			'events'     => true,
			'members'    => true,
		));

	perch_layout('global.below');
?>