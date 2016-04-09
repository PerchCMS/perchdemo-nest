<?php
	perch_layout('global.above', array(
			'title'           => perch_blog_post_field(perch_get('s'), 'postTitle', true) . ' - ' . perch_page_title(true),
			'rss'             => '/blog/rss/',
		));

	if (perch_get('s')) {
		perch_blog_custom(array(
			'template' => 'post.html',
			'filter'   => 'postSlug',
			'match'    => 'eq',
			'value'    => perch_get('s'),
		));	

		perch_blog_post_comments(perch_get('s'));
		perch_blog_post_comment_form(perch_get('s'));

	}

	perch_layout('global.sidebar', array(
			'events'     => true,
			'members'    => true,
		));

	perch_layout('global.below');
