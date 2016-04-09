
</div> <!-- / .primary -->
<div class="sidebar">
	<aside>
	<?php

		if (perch_layout_var('downloads', true)) {

			perch_shop_purchased_files();

		}
		

		if (perch_layout_var('shipping', true)) {
			
			perch_shop_shipping_method_form();
		}

		if (perch_layout_var('promo', true)) {
			perch_content('Sidebar: promo code');
		}

		if (perch_layout_var('currency', true)) {
			perch_shop_currency_form();
		}

		if (perch_layout_var('minicart', true)) {
			perch_shop_cart([
				'template' => 'cart/mini',
				]);
		}

		if (perch_layout_var('password', true)) {
			if (perch_member_is_passwordless()) {
				perch_member_form('set_password');	
			}
		}

		if (perch_layout_var('login', true)) {
			perch_members_login_form();
		}

		perch_content('Sidebar: social links');

	?>
	</aside>
</div>
