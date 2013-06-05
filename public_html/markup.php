<?php
	include('perch/runtime.php');

	perch_layout('global.above', array(
			'title' => perch_page_title(true),
			'rss'	=> '/blog/rss/',
		));


	perch_layout('markup.test');
	

	perch_layout('global.sidebar', array(
			'events'     => true,
			'members'    => true,
		));

	perch_layout('global.below');
?>