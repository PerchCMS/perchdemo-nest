<?php
	$meta = perch_content_custom('Site name', array(
			'skip-template'=>true,
			));
	if (is_array($meta) && isset($meta[0])) {
		$meta = $meta[0];
	}else{
		$meta['site_name'] = 'Nest';
		$meta['strapline'] = 'Run for your life';
	}

	$url = 'http://'.$_SERVER['HTTP_HOST'];
	PerchSystem::set_var('url', $url);

    header('Content-Type: application/rss+xml');

    echo '<'.'?xml version="1.0"?'.'>'; 
?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
    <channel>
        <title><?php echo PerchUtil::html($meta['site_name']); ?> - Blog</title>
        <link><?php echo PerchUtil::html($url); ?>/blog/rss/</link>
        <description><?php echo PerchUtil::html($meta['strapline']); ?></description>
        <atom:link href="<?php echo PerchUtil::html($url); ?>/blog/rss/" rel="self" type="application/rss+xml" />
        <?php
            perch_blog_custom(array(
                'template'   =>'rss_post.html',
                'count'      =>10,
                'sort'       =>'postDateTime',
                'sort-order' =>'DESC'
                ));
        ?>
    </channel>
</rss>