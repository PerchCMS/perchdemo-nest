<?php
	
	perch_content_create('Site name', array(
		'template'   => 'home/site_name.html',
		'shared'     => true,
		'multiple'   => false,
		'edit-mode'  => 'singlepage',
		'searchable' => false,
		));

	$meta = perch_content_custom('Site name', array(
			'skip-template'=>true,
			));
	if (is_array($meta) && isset($meta[0])) {
		$meta = $meta[0];
	}else{
		$meta['site_name'] = 'Nest';
		$meta['strapline'] = 'Run for your life';
	}

	PerchSystem::set_vars($meta);

	$body_class = '';
	$parts = explode('/', $Perch->get_page());
	if (isset($parts[1]) && $parts[1]!='index.php') $body_class = $parts[1];

?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title><?php perch_layout_var('title') ?> - <?php echo $meta['site_name']; ?> </title>
	<?php perch_page_attributes(); ?>
	
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="icon" href="/favicon.ico" />
	<link rel="stylesheet" href="/assets/css/nest.css" />
	<link rel="stylesheet" media="only screen and (min-width: 960px)" href="/assets/css/nest-wide.css" />
	<?php
		if (perch_layout_var('carousel', true)) {
			echo '	<link href="/assets/css/responsive-carousel.css" rel="stylesheet" />
					<link href="/assets/css/responsive-carousel.fade.css" rel="stylesheet" />
					<link href="/assets/css/magnific-popup.css" rel="stylesheet" />';
		}

		if (perch_layout_var('rss', true)) {
			echo '<link rel="alternate" type="application/rss+xml" title="RSS" href="'.perch_layout_var('rss', true).'" />';
		}
	?>
	<script>
	  (function(d) {
	    var config = {
	      kitId: 'kla2bvw',
	      scriptTimeout: 3000,
	      async: true
	    },
	    h=d.documentElement,t=setTimeout(function(){h.className=h.className.replace(/\bwf-loading\b/g,"")+" wf-inactive";},config.scriptTimeout),tk=d.createElement("script"),f=false,s=d.getElementsByTagName("script")[0],a;h.className+=" wf-loading";tk.src='https://use.typekit.net/'+config.kitId+'.js';tk.async=true;tk.onload=tk.onreadystatechange=function(){a=this.readyState;if(f||a&&a!="complete"&&a!="loaded")return;f=true;clearTimeout(t);try{Typekit.load(config)}catch(e){}};s.parentNode.insertBefore(tk,s)
	  })(document);
	</script>
</head>
<body class="<?php echo PerchUtil::html($body_class, true); ?>">
	<div class="navbar topbar">
		<nav>
			<a href="/" class="home"><span class="lang-home">Home</span>
				<svg class="nest-logo">
				  <use xlink:href="#nest-logo"></use>
				</svg>
			</a>
			<?php
				perch_pages_navigation(array(
					'levels'   => 1,
					'navgroup' => 'members',
					'template' => 'members-item.html',
					));

				perch_pages_navigation(array(
					'levels' => 1,
					));
			?>
		</nav>
	</div>

	<div class="wrapper">
		<?php
			if (perch_layout_var('banner', true)) {
				echo perch_layout_var('banner', true);
			}
		?>


		<div class="primary">
			<?php
				if (perch_layout_var('section_heading', true)) {
					perch_layout('headings/'.perch_layout_var('section_heading', true));
				}
			?>