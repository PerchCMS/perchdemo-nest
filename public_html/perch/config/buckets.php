<?php 
	return array(
		'members' => array(
			'web_path'  => '/members/file',
			'file_path' => realpath(PERCH_RESFILEPATH.'/../../../members_files'),
		),
		'shop' => array(
			'web_path'  => '/shop/download',
			'file_path' => realpath(PERCH_RESFILEPATH.'/../../../shop_files'),
		)
	);
?>