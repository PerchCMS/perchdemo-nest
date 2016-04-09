<?php
	// config
	$url_param 	 = 'file';


	// By default, deny downloads unless we've proved the member is allowed this file.
	$allow_download = false;


	// Check a member is logged in and has purchased the file
	if (perch_member_logged_in() && perch_shop_customer_has_purchased_file(perch_get($url_param))) {
		$allow_download = true;
	}

	// Deliver the file.
	if ($allow_download) {
		perch_shop_download_file(perch_get($url_param));
	}

	exit;