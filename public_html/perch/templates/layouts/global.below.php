	</div>
	<div class="navbar">
		<nav>
			<ul class="fin">
				<li><a class="members" href="/members/">Member login</a></li>
			</ul>

			<?php
				perch_pages_navigation(array(
					'levels'=>'1',
					));
			?>
		</nav>
	</div>
	<script src="/assets/js/jquery.js" type="text/javascript"></script>
	<script src="/assets/js/responsive-carousel.min.js" type="text/javascript"></script>
	<script src="/assets/js/responsive-carousel.autoplay.js" type="text/javascript"></script>
	<script src="/assets/js/jquery.magnific-popup.min.js" type="text/javascript"></script>
	<script src="/assets/js/nest.js" type="text/javascript"></script>
	<?php 
		PerchUtil::output_debug(); 
	?>
</body>
</html>