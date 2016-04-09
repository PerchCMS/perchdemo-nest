<?php
	return [

		/*
		|--------------------------------------------------------------------------
		| Gateway settings
		|--------------------------------------------------------------------------
		*/

		'gateways' => [

			'default' => [
				'enabled'   => true,
				'test_mode' => false,
				'live' => [
					'api_key'      => 'abc123',
				],
				'test' => [
					'api_key'      => 'abc123',
				],
			],


			'stripe' => [
				'enabled'   => true,
				'test_mode' => true,
				'live' => [
					'secret_key'      => '',
					'publishable_key' => '',
				],
				'test' => [
					'secret_key'      => '',
					'publishable_key' => '',
				],
			],

		],

	];