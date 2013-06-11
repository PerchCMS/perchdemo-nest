<?php
	include('../perch/runtime.php');

	// config
	$bucket_name = 'members';
	$url_param 	 = 'f';


	// By default, deny downloads unless we've proved the member is allowed this file.
	$allow_download = false;


	// Check a member is logged in
	if (perch_member_logged_in()) {
		$allow_download = true;
	}

	// Deliver the file.
	if ($allow_download) {
		perch_members_secure_download('/'.perch_get($url_param), $bucket_name);
	}

	exit;