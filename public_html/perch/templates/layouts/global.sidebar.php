
</div> <!-- / .primary -->
<div class="sidebar">
	<aside>
	<?php
		
		if (perch_layout_var('events', true)) {
			perch_events_custom(array(
				'template'=>'events/sidebar.html',
				'count'=>2,
			));
		}

		if (perch_layout_var('events-rss', true)) {
			perch_template('events/rss.html');
		}

		if (perch_layout_var('members', true)) {
			perch_content('Sidebar: become a member');
		}

		perch_content('Sidebar: social links');

	?>
	</aside>
</div>