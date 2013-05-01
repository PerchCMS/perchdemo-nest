<?php
	include('perch/runtime.php');

	perch_layout('global.above', array(
			'title' => perch_page_title(true),
		));

	perch_layout('markup.test');


	perch_layout('global.below');
?>