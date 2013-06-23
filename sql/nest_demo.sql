# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.29)
# Database: dbPerchDemoNest
# Generation Time: 2013-06-23 09:50:25 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table perch2_blog_authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_blog_authors`;

CREATE TABLE `perch2_blog_authors` (
  `authorID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorGivenName` varchar(255) NOT NULL DEFAULT '',
  `authorFamilyName` varchar(255) NOT NULL DEFAULT '',
  `authorEmail` varchar(255) NOT NULL DEFAULT '',
  `authorSlug` varchar(255) NOT NULL DEFAULT '',
  `authorImportRef` varchar(64) DEFAULT NULL,
  `authorDynamicFields` text,
  PRIMARY KEY (`authorID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_blog_authors` WRITE;
/*!40000 ALTER TABLE `perch2_blog_authors` DISABLE KEYS */;

INSERT INTO `perch2_blog_authors` (`authorID`, `authorGivenName`, `authorFamilyName`, `authorEmail`, `authorSlug`, `authorImportRef`, `authorDynamicFields`)
VALUES
	(1,'{firstname}','{lastname}','{email}','{username}',NULL,NULL);

/*!40000 ALTER TABLE `perch2_blog_authors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_blog_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_blog_categories`;

CREATE TABLE `perch2_blog_categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryTitle` varchar(255) NOT NULL DEFAULT '',
  `categorySlug` varchar(255) NOT NULL DEFAULT '',
  `categoryPostCount` int(10) unsigned NOT NULL DEFAULT '0',
  `categoryDynamicFields` text,
  PRIMARY KEY (`categoryID`),
  KEY `idx_slug` (`categorySlug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

LOCK TABLES `perch2_blog_categories` WRITE;
/*!40000 ALTER TABLE `perch2_blog_categories` DISABLE KEYS */;

INSERT INTO `perch2_blog_categories` (`categoryID`, `categoryTitle`, `categorySlug`, `categoryPostCount`, `categoryDynamicFields`)
VALUES
	(1,'Events','events',2,NULL),
	(2,'News','news',1,NULL),
	(3,'Information for members','information',1,'{\"categoryTitle\":\"Information for members\",\"categorySlug\":\"information-for-members\"}');

/*!40000 ALTER TABLE `perch2_blog_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_blog_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_blog_comments`;

CREATE TABLE `perch2_blog_comments` (
  `commentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postID` int(10) unsigned NOT NULL,
  `commentName` varchar(255) NOT NULL DEFAULT '',
  `commentEmail` varchar(255) NOT NULL DEFAULT '',
  `commentURL` varchar(255) NOT NULL DEFAULT '',
  `commentIP` int(10) unsigned NOT NULL DEFAULT '0',
  `commentDateTime` datetime NOT NULL,
  `commentHTML` text NOT NULL,
  `commentStatus` enum('LIVE','PENDING','SPAM','REJECTED') NOT NULL DEFAULT 'PENDING',
  `commentSpamData` text NOT NULL,
  `commentDynamicFields` text NOT NULL,
  PRIMARY KEY (`commentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

LOCK TABLES `perch2_blog_comments` WRITE;
/*!40000 ALTER TABLE `perch2_blog_comments` DISABLE KEYS */;

INSERT INTO `perch2_blog_comments` (`commentID`, `postID`, `commentName`, `commentEmail`, `commentURL`, `commentIP`, `commentDateTime`, `commentHTML`, `commentStatus`, `commentSpamData`, `commentDynamicFields`)
VALUES
	(1,2,'Drew McLellan','comments@allinthehead.com','',2130706433,'2013-06-22 16:03:50','<p>Brilliant! Last year was so good, despite the calling problems. To be honest, I think that was mostly down to the caller not knowing their left from their right. But anyway, I&#8217;ll be contacting Jan for my tickets!</p>','LIVE','{\"fields\":{\"name\":\"Drew McLellan\",\"email\":\"comments@allinthehead.com\",\"body\":\"Brilliant! Last year was so good, despite the calling problems. To be honest, I think that was mostly down to the caller not knowing their left from their right. But anyway, I\'ll be contacting Jan for my tickets!\"},\"environment\":{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"perchdemo-nest.rocker.eoms\",\"HTTP_CONNECTION\":\"keep-alive\",\"CONTENT_LENGTH\":\"419\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"HTTP_ORIGIN\":\"http:\\/\\/perchdemo-nest.rocker.eoms\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/29.0.1545.0 Safari\\/537.36\",\"CONTENT_TYPE\":\"application\\/x-www-form-urlencoded\",\"HTTP_REFERER\":\"http:\\/\\/perchdemo-nest.rocker.eoms\\/blog\\/2-tickets-on-sale-for-july-social\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate,sdch\",\"HTTP_ACCEPT_LANGUAGE\":\"en-US,en;q=0.8\",\"HTTP_COOKIE\":\"mp_aca1134b1691f97fca23dd82df07fa8f_mixpanel=%7B%22distinct_id%22%3A%20%2213db1092e6c1-0a8cfd912-67570c2a-384000-13db1092e6e8e8%22%2C%22%24initial_referrer%22%3A%20%22%24direct%22%2C%22%24initial_referring_domain%22%3A%20%22%24direct%22%7D; p_m=e307daeb6227c520ad0dcd47447632bde214bbc9; PHPSESSID=0d85c260dc2acb5995b3eac6e8ed0d4b; cmssb=0\",\"PATH\":\"\\/usr\\/bin:\\/bin:\\/usr\\/sbin:\\/sbin\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"perchdemo-nest.rocker.eoms\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\",\"SERVER_ADMIN\":\"you@example.com\",\"SCRIPT_FILENAME\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\\/blog\\/post.php\",\"REMOTE_PORT\":\"58975\",\"REDIRECT_QUERY_STRING\":\"s=2-tickets-on-sale-for-july-social\",\"REDIRECT_URL\":\"\\/blog\\/2-tickets-on-sale-for-july-social\\/\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"POST\",\"QUERY_STRING\":\"s=2-tickets-on-sale-for-july-social\",\"REQUEST_URI\":\"\\/blog\\/2-tickets-on-sale-for-july-social\\/\",\"SCRIPT_NAME\":\"\\/blog\\/post.php\",\"PHP_SELF\":\"\\/blog\\/post.php\",\"REQUEST_TIME_FLOAT\":1371913430.75,\"REQUEST_TIME\":1371913430,\"argv\":[\"s=2-tickets-on-sale-for-july-social\"],\"argc\":1}}','{\"submitComment\":\"Submit\"}'),
	(2,4,'Drew McLellan','comments@allinthehead.com','',2130706433,'2013-06-22 16:04:20','<p>Well done, {firstname}! You&#8217;re very brave.</p>','LIVE','{\"fields\":{\"name\":\"Drew McLellan\",\"email\":\"comments@allinthehead.com\",\"body\":\"Well done, {firstname}! You\'re very brave.\"},\"environment\":{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"perchdemo-nest.rocker.eoms\",\"HTTP_CONNECTION\":\"keep-alive\",\"CONTENT_LENGTH\":\"247\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"HTTP_ORIGIN\":\"http:\\/\\/perchdemo-nest.rocker.eoms\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/29.0.1545.0 Safari\\/537.36\",\"CONTENT_TYPE\":\"application\\/x-www-form-urlencoded\",\"HTTP_REFERER\":\"http:\\/\\/perchdemo-nest.rocker.eoms\\/blog\\/4-meet-our-new-chairman\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate,sdch\",\"HTTP_ACCEPT_LANGUAGE\":\"en-US,en;q=0.8\",\"HTTP_COOKIE\":\"mp_aca1134b1691f97fca23dd82df07fa8f_mixpanel=%7B%22distinct_id%22%3A%20%2213db1092e6c1-0a8cfd912-67570c2a-384000-13db1092e6e8e8%22%2C%22%24initial_referrer%22%3A%20%22%24direct%22%2C%22%24initial_referring_domain%22%3A%20%22%24direct%22%7D; p_m=e307daeb6227c520ad0dcd47447632bde214bbc9; PHPSESSID=0d85c260dc2acb5995b3eac6e8ed0d4b; cmssb=0\",\"PATH\":\"\\/usr\\/bin:\\/bin:\\/usr\\/sbin:\\/sbin\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"perchdemo-nest.rocker.eoms\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\",\"SERVER_ADMIN\":\"you@example.com\",\"SCRIPT_FILENAME\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\\/blog\\/post.php\",\"REMOTE_PORT\":\"58991\",\"REDIRECT_QUERY_STRING\":\"s=4-meet-our-new-chairman\",\"REDIRECT_URL\":\"\\/blog\\/4-meet-our-new-chairman\\/\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"POST\",\"QUERY_STRING\":\"s=4-meet-our-new-chairman\",\"REQUEST_URI\":\"\\/blog\\/4-meet-our-new-chairman\\/\",\"SCRIPT_NAME\":\"\\/blog\\/post.php\",\"PHP_SELF\":\"\\/blog\\/post.php\",\"REQUEST_TIME_FLOAT\":1371913460.37,\"REQUEST_TIME\":1371913460,\"argv\":[\"s=4-meet-our-new-chairman\"],\"argc\":1}}','{\"submitComment\":\"Submit\"}');

/*!40000 ALTER TABLE `perch2_blog_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_blog_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_blog_posts`;

CREATE TABLE `perch2_blog_posts` (
  `postID` int(11) NOT NULL AUTO_INCREMENT,
  `postTitle` varchar(255) NOT NULL DEFAULT '',
  `postSlug` varchar(255) NOT NULL DEFAULT '',
  `postDateTime` datetime DEFAULT NULL,
  `postDescRaw` text,
  `postDescHTML` text,
  `postDynamicFields` text,
  `postTags` varchar(255) NOT NULL DEFAULT '',
  `postStatus` enum('Published','Draft') NOT NULL DEFAULT 'Published',
  `authorID` int(10) unsigned NOT NULL DEFAULT '0',
  `postCommentCount` int(10) unsigned NOT NULL DEFAULT '0',
  `postImportID` varchar(64) DEFAULT NULL,
  `postLegacyURL` varchar(255) DEFAULT NULL,
  `postAllowComments` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `postTemplate` varchar(255) NOT NULL DEFAULT 'post.html',
  PRIMARY KEY (`postID`),
  KEY `idx_date` (`postDateTime`),
  FULLTEXT KEY `idx_search` (`postTitle`,`postDescRaw`,`postTags`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

LOCK TABLES `perch2_blog_posts` WRITE;
/*!40000 ALTER TABLE `perch2_blog_posts` DISABLE KEYS */;

INSERT INTO `perch2_blog_posts` (`postID`, `postTitle`, `postSlug`, `postDateTime`, `postDescRaw`, `postDescHTML`, `postDynamicFields`, `postTags`, `postStatus`, `authorID`, `postCommentCount`, `postImportID`, `postLegacyURL`, `postAllowComments`, `postTemplate`)
VALUES
	(1,'Next race is 23rd July','1-next-race-is-23rd-july','2013-05-03 15:12:00','Our next club race is 23rd July; it\'s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It\'s going to be a lot of fun.\r\n\r\nParking on the day will be restricted, as a new parking surface is being laid that weekend. Just bad timing, I\'m afraid. Fortunately, local company Data Networks has said we can use their car park. To apply for a pass, email event organiser Sandra at \"sandra@nestrunning.com\":mailto:sandra@nestrunning.com with your car registration plate. Passes are free, but we need to keep track of which cars are allowed into the car park for insurance reasons.\r\n\r\nThere are no on-site changing facilities, but Ann says she\'s got a changing tent you can borrow if you need it.','<p>Our next club race is 23rd July; it&#8217;s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It&#8217;s going to be a lot of fun.</p>\n\n<p>Parking on the day will be restricted, as a new parking surface is being laid that weekend. Just bad timing, I&#8217;m afraid. Fortunately, local company Data Networks has said we can use their car park. To apply for a pass, email event organiser Sandra at <a href=\"mailto:sandra@nestrunning.com\">sandra@nestrunning.com</a> with your car registration plate. Passes are free, but we need to keep track of which cars are allowed into the car park for insurance reasons.</p>\n\n<p>There are no on-site changing facilities, but Ann says she&#8217;s got a changing tent you can borrow if you need it.</p>','{\"excerpt\":{\"raw\":\"Our next club race is 23rd July; it\'s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It\'s going to be a lot of fun.\",\"processed\":\"<p>Our next club race is 23rd July; it&#8217;s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It&#8217;s going to be a lot of fun.<\\/p>\"},\"postTitle\":\"Next race is 23rd July\"}','','Published',1,0,NULL,NULL,1,'post.html'),
	(2,'Tickets on sale for July Social','2-tickets-on-sale-for-july-social','2013-05-28 10:51:00','Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We\'ve learned our lesson from last year, and we won\'t be trying to do the calling ourselves.\r\n\r\nContact Jan for tickets - she\'s got, like, loads. It\'s a barn.\r\n\r\nA ploughman\'s dinner will be served with cheese for vegetarians and pâté _and_ cheese for everyone else. Us non-vegetarians need to keep our strength up. Local ale will be on tap to help with the dancing. Children are recommended to wear cycle helmets for their own safety.','<p>Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We&#8217;ve learned our lesson from last year, and we won&#8217;t be trying to do the calling ourselves.</p>\n\n<p>Contact Jan for tickets &#8211; she&#8217;s got, like, loads. It&#8217;s a barn.</p>\n\n<p>A ploughman&#8217;s dinner will be served with cheese for vegetarians and pâté <em>and</em> cheese for everyone else. Us non-vegetarians need to keep our strength up. Local ale will be on tap to help with the dancing. Children are recommended to wear cycle helmets for their own safety.</p>','{\"excerpt\":{\"raw\":\"Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We\'ve learned our lesson from last year, and we won\'t be trying to do the calling ourselves.\",\"processed\":\"<p>Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We&#8217;ve learned our lesson from last year, and we won&#8217;t be trying to do the calling ourselves.<\\/p>\"},\"postTitle\":\"Tickets on sale for July Social\",\"image\":{\"_default\":\"\\/perch\\/resources\\/img0306-1.jpg\",\"path\":\"img0306-1.jpg\",\"size\":192464,\"bucket\":\"default\",\"w\":1024,\"h\":683,\"sizes\":{\"thumb\":{\"w\":150,\"h\":100,\"path\":\"img0306-1-thumb.jpg\",\"size\":6767,\"mime\":\"image\\/jpeg\"},\"w500hc0\":{\"w\":500,\"h\":333,\"density\":\"1\",\"path\":\"img0306-1-w500.jpg\",\"size\":37127,\"mime\":\"image\\/jpeg\"},\"w140h140c1@2x\":{\"w\":140,\"h\":140,\"density\":\"2\",\"path\":\"img0306-1-w140h140@2x.jpg\",\"size\":19671,\"mime\":\"image\\/jpeg\"}}}}','','Published',1,1,NULL,NULL,1,'post.html'),
	(3,'Clubhouse Rules','3-clubhouse-rules','2012-06-22 14:32:00','Or should that be Clubhouse House Rules? I\'m not sure, but it\'s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.\r\n\r\nh2. These are The Rules\r\n\r\n# *No ball games.* Ha ha! No, seriously. No ball games. The walls are really thin and will dent if hit by a ball or a knee.\r\n# *Wipe your feet.* We understand that you may be tired having just run a half-marathon through the woods, but _please_ remember to wipe your feet as you enter the clubhouse. On that note...\r\n# *Clean up after yourself.* The club does not employ a cleaner. A volunteer team come in one day a month to give everything a good once-over, but otherwise it\'s up to _you_ to clean up _your mess_. It would really help to remind each other, and if you see a mess with no culprit in sight, please be neighbourly and help by cleaning it up.\r\n# *The keyholder is boss!* Whoever unlocks the clubhouse is responsible for the clubhouse and those within it for that session. Therefore, they\'re in charge and what they says goes. Please respect their authority and do as you\'re jolly well told.\r\n# *No smoking.* And that means smoking _of any kind_. You know who you are. There\'s a covered area outside the porch for _legal_ smoking if you really think that\'s a good idea before your run.\r\n# *No advertising on the club notice board.* The notice board is for club notices only. Please do not post business cards plying your trades or, err, _services_ here. This is not the place. There is a phone booth across the road outside the rugby club.','<p>Or should that be Clubhouse House Rules? I&#8217;m not sure, but it&#8217;s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.</p>\n\n<h2>These are The Rules</h2>\n\n	<ol>\n		<li><strong>No ball games.</strong> Ha ha! No, seriously. No ball games. The walls are really thin and will dent if hit by a ball or a knee.</li>\n		<li><strong>Wipe your feet.</strong> We understand that you may be tired having just run a half-marathon through the woods, but <em>please</em> remember to wipe your feet as you enter the clubhouse. On that note&#8230;</li>\n		<li><strong>Clean up after yourself.</strong> The club does not employ a cleaner. A volunteer team come in one day a month to give everything a good once-over, but otherwise it&#8217;s up to <em>you</em> to clean up <em>your mess</em>. It would really help to remind each other, and if you see a mess with no culprit in sight, please be neighbourly and help by cleaning it up.</li>\n		<li><strong>The keyholder is boss!</strong> Whoever unlocks the clubhouse is responsible for the clubhouse and those within it for that session. Therefore, they&#8217;re in charge and what they says goes. Please respect their authority and do as you&#8217;re jolly well told.</li>\n		<li><strong>No smoking.</strong> And that means smoking <em>of any kind</em>. You know who you are. There&#8217;s a covered area outside the porch for <em>legal</em> smoking if you really think that&#8217;s a good idea before your run.</li>\n		<li><strong>No advertising on the club notice board.</strong> The notice board is for club notices only. Please do not post business cards plying your trades or, err, <em>services</em> here. This is not the place. There is a phone booth across the road outside the rugby club.</li>\n	</ol>','{\"excerpt\":{\"raw\":\"It\'s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.\",\"processed\":\"<p>It&#8217;s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.<\\/p>\"},\"postTitle\":\"Clubhouse Rules\"}','clubhouse, rules','Published',1,0,NULL,NULL,1,'post.html'),
	(4,'Meet our new chairman!','4-meet-our-new-chairman','2013-05-22 15:11:00','The committee is pleased to announce that *{firstname} {lastname}* has been voted as our new chairman. The result was almost unanimous, and the only abstention was due to Gavin still maintaining that it was {firstname} who scratched his car outside the clubhouse last year, despite the complete lack of evidence. \r\n\r\nWe all know {firstname} was out marathon training at the time and couldn\'t possibly have been involved. Anyway, that\'s by the by.\r\n\r\n{firstname} will serve a two-year term as club chairman (or should we say _chairperson_ these days? I\'m never sure) until the next elections following our centenary year!\r\n\r\nWe thank {firstname} for standing and being willing to take on such an unruly club.','<p>The committee is pleased to announce that <strong>{firstname} {lastname}</strong> has been voted as our new chairman. The result was almost unanimous, and the only abstention was due to Gavin still maintaining that it was {firstname} who scratched his car outside the clubhouse last year, despite the complete lack of evidence. </p>\n\n<p>We all know {firstname} was out marathon training at the time and couldn&#8217;t possibly have been involved. Anyway, that&#8217;s by the by.</p>\n\n<p>{firstname} will serve a two-year term as club chairman (or should we say <em>chairperson</em> these days? I&#8217;m never sure) until the next elections following our centenary year!</p>\n\n<p>We thank {firstname} for standing and being willing to take on such an unruly club.</p>','{\"excerpt\":{\"raw\":\"The committee is pleased to announce that {firstname} {lastname} has been voted as our new chairman, almost unanimously.\",\"processed\":\"<p>The committee is pleased to announce that {firstname} {lastname} has been voted as our new chairman, almost unanimously.<\\/p>\"},\"postTitle\":\"Meet our new chairman!\"}','','Published',1,1,NULL,NULL,1,'post.html');

/*!40000 ALTER TABLE `perch2_blog_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_blog_posts_to_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_blog_posts_to_categories`;

CREATE TABLE `perch2_blog_posts_to_categories` (
  `postID` int(11) NOT NULL DEFAULT '0',
  `categoryID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`postID`,`categoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

LOCK TABLES `perch2_blog_posts_to_categories` WRITE;
/*!40000 ALTER TABLE `perch2_blog_posts_to_categories` DISABLE KEYS */;

INSERT INTO `perch2_blog_posts_to_categories` (`postID`, `categoryID`)
VALUES
	(1,1),
	(2,1),
	(3,3),
	(4,2);

/*!40000 ALTER TABLE `perch2_blog_posts_to_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_blog_posts_to_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_blog_posts_to_tags`;

CREATE TABLE `perch2_blog_posts_to_tags` (
  `postID` int(11) NOT NULL DEFAULT '0',
  `tagID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`postID`,`tagID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

LOCK TABLES `perch2_blog_posts_to_tags` WRITE;
/*!40000 ALTER TABLE `perch2_blog_posts_to_tags` DISABLE KEYS */;

INSERT INTO `perch2_blog_posts_to_tags` (`postID`, `tagID`)
VALUES
	(3,1),
	(3,2);

/*!40000 ALTER TABLE `perch2_blog_posts_to_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_blog_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_blog_tags`;

CREATE TABLE `perch2_blog_tags` (
  `tagID` int(11) NOT NULL AUTO_INCREMENT,
  `tagTitle` varchar(255) NOT NULL DEFAULT '',
  `tagSlug` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tagID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

LOCK TABLES `perch2_blog_tags` WRITE;
/*!40000 ALTER TABLE `perch2_blog_tags` DISABLE KEYS */;

INSERT INTO `perch2_blog_tags` (`tagID`, `tagTitle`, `tagSlug`)
VALUES
	(1,'clubhouse','clubhouse'),
	(2,'rules','rules');

/*!40000 ALTER TABLE `perch2_blog_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_content_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_content_index`;

CREATE TABLE `perch2_content_index` (
  `indexID` int(10) NOT NULL AUTO_INCREMENT,
  `itemID` int(10) NOT NULL DEFAULT '0',
  `regionID` int(10) NOT NULL DEFAULT '0',
  `pageID` int(10) NOT NULL DEFAULT '0',
  `itemRev` int(10) NOT NULL DEFAULT '0',
  `indexKey` char(64) NOT NULL DEFAULT '-',
  `indexValue` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`indexID`),
  KEY `idx_key` (`indexKey`),
  KEY `idx_val` (`indexValue`),
  KEY `idx_rev` (`itemRev`),
  KEY `idx_item` (`itemID`),
  KEY `idx_keyval` (`indexKey`,`indexValue`),
  KEY `idx_regrev` (`regionID`,`itemRev`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_content_index` WRITE;
/*!40000 ALTER TABLE `perch2_content_index` DISABLE KEYS */;

INSERT INTO `perch2_content_index` (`indexID`, `itemID`, `regionID`, `pageID`, `itemRev`, `indexKey`, `indexValue`)
VALUES
	(1,1,1,1,5,'title','Become a member'),
	(2,1,1,1,5,'desc','<p>Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!</p>'),
	(3,1,1,1,5,'desc_raw','Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!'),
	(4,1,1,1,5,'desc_processed','<p>Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!</p>'),
	(5,1,1,1,5,'cta','Request an invitation'),
	(6,1,1,1,5,'_id','1'),
	(7,1,1,1,5,'_order','1000'),
	(8,3,3,1,3,'image','/perch/resources/home-banner.jpg'),
	(9,3,3,1,3,'image__default','/perch/resources/home-banner.jpg'),
	(10,3,3,1,3,'image_path','home-banner.jpg'),
	(11,3,3,1,3,'image_size','34130'),
	(12,3,3,1,3,'image_bucket','default'),
	(13,3,3,1,3,'image_w','1200'),
	(14,3,3,1,3,'image_h','350'),
	(15,3,3,1,3,'_id','3'),
	(16,3,3,1,3,'_order','1000'),
	(17,16,6,1,1,'site_name','Nest Running Club'),
	(18,16,6,1,1,'strapline','Run for your life'),
	(19,16,6,1,1,'_id','16'),
	(20,16,6,1,1,'_order','1000'),
	(21,2,2,1,4,'twitter','grabaperch'),
	(22,2,2,1,4,'facebook','grabaperch'),
	(23,2,2,1,4,'_id','2'),
	(24,2,2,1,4,'_order','1000'),
	(25,7,9,12,2,'text','<h1>Register today</h1>\n\n<p>Nest running club members should already have their membership details, but if you&#8217;re new to the club you can sign up here.</p>\n\n<p>Members get access to information such as personal contact information that we&#8217;d ra'),
	(26,7,9,12,2,'text_raw','h1. Register today\r\n\r\nNest running club members should already have their membership details, but if you\'re new to the club you can sign up here.\r\n\r\nMembers get access to information such as personal contact information that we\'d rather not have freely av'),
	(27,7,9,12,2,'text_processed','<h1>Register today</h1>\n\n<p>Nest running club members should already have their membership details, but if you&#8217;re new to the club you can sign up here.</p>\n\n<p>Members get access to information such as personal contact information that we&#8217;d ra'),
	(28,7,9,12,2,'_id','7'),
	(29,7,9,12,2,'_order','1000'),
	(30,5,7,2,16,'heading','Who are we?'),
	(31,5,7,2,16,'image','/perch/resources/img1069-2.jpg'),
	(32,5,7,2,16,'image__default','/perch/resources/img1069-2.jpg'),
	(33,5,7,2,16,'image_path','img1069-2.jpg'),
	(34,5,7,2,16,'image_size','207516'),
	(35,5,7,2,16,'image_bucket','default'),
	(36,5,7,2,16,'image_w','1024'),
	(37,5,7,2,16,'image_h','683'),
	(38,5,7,2,16,'body','<p>Hello, we&#8217;re <strong>Nest</strong> &#8212; a local running club for local people who like to run, locally. We&#8217;re really friendly and always welcome new members, as long as you&#8217;re local. So if you&#8217;re a local person who likes to r'),
	(39,5,7,2,16,'body_raw','Hello, we\'re *Nest* -- a local running club for local people who like to run, locally. We\'re really friendly and always welcome new members, as long as you\'re local. So if you\'re a local person who likes to run locally, pop along for a taster session. The'),
	(40,5,7,2,16,'body_processed','<p>Hello, we&#8217;re <strong>Nest</strong> &#8212; a local running club for local people who like to run, locally. We&#8217;re really friendly and always welcome new members, as long as you&#8217;re local. So if you&#8217;re a local person who likes to r'),
	(41,5,7,2,16,'_id','5'),
	(42,5,7,2,16,'_order','1000'),
	(43,6,8,7,6,'heading','Send us a message'),
	(44,6,8,7,6,'intro',''),
	(45,6,8,7,6,'intro_raw',''),
	(46,6,8,7,6,'intro_processed',''),
	(47,6,8,7,6,'success','<h1>Thank you!</h1>\n\n<p>Thanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running!</p>'),
	(48,6,8,7,6,'success_raw','h1. Thank you!\r\n\r\nThanks for dropping us a line. We\'ll be in touch with a response shortly. Happy running!'),
	(49,6,8,7,6,'success_processed','<h1>Thank you!</h1>\n\n<p>Thanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running!</p>'),
	(50,6,8,7,6,'_id','6'),
	(51,6,8,7,6,'_order','1000'),
	(52,8,10,14,3,'text','<h2>Get a new password</h2>\n\n<p>Have you forgotten your password? You idiot! We can&#8217;t remind you of your old password (it&#8217;s stored in a secure way that means we can&#8217;t retrieve it) but we can send you a new one.</p>\n\n<p>If you&#8217;re al'),
	(53,8,10,14,3,'text_raw','h2. Get a new password\r\n\r\nHave you forgotten your password? You idiot! We can\'t remind you of your old password (it\'s stored in a secure way that means we can\'t retrieve it) but we can send you a new one.\r\n\r\nIf you\'re already registered, enter your email'),
	(54,8,10,14,3,'text_processed','<h2>Get a new password</h2>\n\n<p>Have you forgotten your password? You idiot! We can&#8217;t remind you of your old password (it&#8217;s stored in a secure way that means we can&#8217;t retrieve it) but we can send you a new one.</p>\n\n<p>If you&#8217;re al'),
	(55,8,10,14,3,'_id','8'),
	(56,8,10,14,3,'_order','1000'),
	(57,9,11,10,4,'text','<h1>Member login</h1>\n\n<p>The restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.</p>\n\n<p>If you&#8217;re a member but don&#8217;t yet have a website account, the you need'),
	(58,9,11,10,4,'text_raw','h1. Member login\r\n\r\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\r\n\r\nIf you\'re a member but don\'t yet have a website account, the you need to \"register\":/members'),
	(59,9,11,10,4,'text_processed','<h1>Member login</h1>\n\n<p>The restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.</p>\n\n<p>If you&#8217;re a member but don&#8217;t yet have a website account, the you need'),
	(60,9,11,10,4,'_id','9'),
	(61,9,11,10,4,'_order','1000'),
	(62,10,12,10,4,'heading','Members Area'),
	(63,10,12,10,4,'image','/perch/resources/img0043.jpg'),
	(64,10,12,10,4,'image__default','/perch/resources/img0043.jpg'),
	(65,10,12,10,4,'image_path','img0043.jpg'),
	(66,10,12,10,4,'image_size','342150'),
	(67,10,12,10,4,'image_bucket','default'),
	(68,10,12,10,4,'image_w','1024'),
	(69,10,12,10,4,'image_h','683'),
	(70,10,12,10,4,'body','<p>Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! </p>\n\n<p>Would we do that? Of course we wouldn&#8217;t. Instead we&#8217;ve got some boring old documents with members'),
	(71,10,12,10,4,'body_raw','Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! \r\n\r\nWould we do that? Of course we wouldn\'t. Instead we\'ve got some boring old documents with members addresses and phone'),
	(72,10,12,10,4,'body_processed','<p>Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! </p>\n\n<p>Would we do that? Of course we wouldn&#8217;t. Instead we&#8217;ve got some boring old documents with members'),
	(73,10,12,10,4,'_id','10'),
	(74,10,12,10,4,'_order','1000'),
	(75,14,13,10,14,'title','Annual Report'),
	(76,14,13,10,14,'desc','<p>This is our annual club report, as presented and signed off at this year&#8217;s Annual General Meeting by the committee and the club chairman.</p>'),
	(77,14,13,10,14,'desc_raw','This is our annual club report, as presented and signed off at this year\'s Annual General Meeting by the committee and the club chairman.'),
	(78,14,13,10,14,'desc_processed','<p>This is our annual club report, as presented and signed off at this year&#8217;s Annual General Meeting by the committee and the club chairman.</p>'),
	(79,14,13,10,14,'file','/members/file/annual-report.pdf'),
	(80,14,13,10,14,'file__default','/members/file/annual-report.pdf'),
	(81,14,13,10,14,'file_path','annual-report.pdf'),
	(82,14,13,10,14,'file_size','23364'),
	(83,14,13,10,14,'file_bucket','members'),
	(84,14,13,10,14,'_id','14'),
	(85,14,13,10,14,'_order','1000'),
	(86,15,13,10,14,'title','Training Plan'),
	(87,15,13,10,14,'desc','<p>Our exclusive club training plan <span class=\"caps\">PDF</span>. This is like <em>training gold</em>! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.</p>'),
	(88,15,13,10,14,'desc_raw','Our exclusive club training plan PDF. This is like _training gold_! Fill out all the boxes and you\'re bound to beat your PB by miles.'),
	(89,15,13,10,14,'desc_processed','<p>Our exclusive club training plan <span class=\"caps\">PDF</span>. This is like <em>training gold</em>! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.</p>'),
	(90,15,13,10,14,'file','/members/file/training-plan.pdf'),
	(91,15,13,10,14,'file__default','/members/file/training-plan.pdf'),
	(92,15,13,10,14,'file_path','training-plan.pdf'),
	(93,15,13,10,14,'file_size','30553'),
	(94,15,13,10,14,'file_bucket','members'),
	(95,15,13,10,14,'_id','15'),
	(96,15,13,10,14,'_order','1001');

/*!40000 ALTER TABLE `perch2_content_index` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_content_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_content_items`;

CREATE TABLE `perch2_content_items` (
  `itemRowID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemID` int(10) unsigned NOT NULL DEFAULT '0',
  `regionID` int(10) unsigned NOT NULL DEFAULT '0',
  `pageID` int(10) unsigned NOT NULL DEFAULT '0',
  `itemRev` int(10) unsigned NOT NULL DEFAULT '0',
  `itemOrder` int(10) unsigned NOT NULL DEFAULT '1000',
  `itemJSON` mediumtext NOT NULL,
  `itemSearch` mediumtext NOT NULL,
  PRIMARY KEY (`itemRowID`),
  KEY `idx_item` (`itemID`),
  KEY `idx_rev` (`itemRev`),
  KEY `idx_region` (`regionID`),
  KEY `idx_regrev` (`itemID`,`regionID`,`itemRev`),
  KEY `idx_order` (`itemOrder`),
  FULLTEXT KEY `idx_search` (`itemSearch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_content_items` WRITE;
/*!40000 ALTER TABLE `perch2_content_items` DISABLE KEYS */;

INSERT INTO `perch2_content_items` (`itemRowID`, `itemID`, `regionID`, `pageID`, `itemRev`, `itemOrder`, `itemJSON`, `itemSearch`)
VALUES
	(84,6,8,7,6,1000,'{\"_id\":\"6\",\"heading\":\"Send us a message\",\"intro\":{\"raw\":\"\",\"processed\":\"\"},\"success\":{\"raw\":\"h1. Thank you!\\r\\n\\r\\nThanks for dropping us a line. We\'ll be in touch with a response shortly. Happy running!\",\"processed\":\"<h1>Thank you!<\\/h1>\\n\\n<p>Thanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running!<\\/p>\"}}',' Send us a message  Thank you!\n\nThanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running! '),
	(51,5,7,2,16,1000,'{\"_id\":\"5\",\"heading\":\"Who are we?\",\"image\":{\"_default\":\"\\/perch\\/resources\\/img1069-2.jpg\",\"path\":\"img1069-2.jpg\",\"size\":207516,\"bucket\":\"default\",\"w\":1024,\"h\":683,\"sizes\":{\"thumb\":{\"w\":150,\"h\":100,\"path\":\"img1069-2-thumb.jpg\",\"size\":7503,\"mime\":\"image\\/jpeg\"},\"w280hc0\":{\"w\":280,\"h\":186,\"density\":\"1\",\"path\":\"img1069-2-w280.jpg\",\"size\":16739,\"mime\":\"image\\/jpeg\"}}},\"body\":{\"raw\":\"Hello, we\'re *Nest* -- a local running club for local people who like to run, locally. We\'re really friendly and always welcome new members, as long as you\'re local. So if you\'re a local person who likes to run locally, pop along for a taster session. There\'s no need to worry about joining, just come along and get a feel for the place. You can join if you\'d like to attend regularly. We\'re your local running club, locals.\\r\\n\\r\\nWe meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. _On the run!_ Ah haha!\\r\\n\\r\\nh2. Bring your own shoes\\r\\n\\r\\nSharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn\'t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let\'s face it, the risk isn\'t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)\\r\\n\\r\\nCome and join us!\",\"processed\":\"<p>Hello, we&#8217;re <strong>Nest<\\/strong> &#8212; a local running club for local people who like to run, locally. We&#8217;re really friendly and always welcome new members, as long as you&#8217;re local. So if you&#8217;re a local person who likes to run locally, pop along for a taster session. There&#8217;s no need to worry about joining, just come along and get a feel for the place. You can join if you&#8217;d like to attend regularly. We&#8217;re your local running club, locals.<\\/p>\\n\\n<p>We meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. <em>On the run!<\\/em> Ah haha!<\\/p>\\n\\n<h2>Bring your own shoes<\\/h2>\\n\\n<p>Sharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn&#8217;t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let&#8217;s face it, the risk isn&#8217;t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)<\\/p>\\n\\n<p>Come and join us!<\\/p>\"}}',' Who are we?  Hello, we&#8217;re Nest &#8212; a local running club for local people who like to run, locally. We&#8217;re really friendly and always welcome new members, as long as you&#8217;re local. So if you&#8217;re a local person who likes to run locally, pop along for a taster session. There&#8217;s no need to worry about joining, just come along and get a feel for the place. You can join if you&#8217;d like to attend regularly. We&#8217;re your local running club, locals.\n\nWe meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. On the run! Ah haha!\n\nBring your own shoes\n\nSharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn&#8217;t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let&#8217;s face it, the risk isn&#8217;t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)\n\nCome and join us! '),
	(63,10,12,10,4,1000,'{\"_id\":\"10\",\"heading\":\"Members Area\",\"image\":{\"_default\":\"\\/perch\\/resources\\/img0043.jpg\",\"path\":\"img0043.jpg\",\"size\":342150,\"bucket\":\"default\",\"w\":1024,\"h\":683,\"sizes\":{\"thumb\":{\"w\":150,\"h\":100,\"path\":\"img0043-thumb.jpg\",\"size\":8001,\"mime\":\"image\\/jpeg\"},\"w280hc0\":{\"w\":280,\"h\":186,\"density\":\"1\",\"path\":\"img0043-w280.jpg\",\"size\":22693,\"mime\":\"image\\/jpeg\"}}},\"body\":{\"raw\":\"Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! \\r\\n\\r\\nWould we do that? Of course we wouldn\'t. Instead we\'ve got some boring old documents with members addresses and phone numbers and stuff.\\r\\n\\r\\nh2. Training Plans\\r\\n\\r\\nOne thing we wouldn\'t want other clubs to get their filthy mitts on is our exciting Training Plan PDF! Exclusive to club members, this PDF helps you plan out your complete training programme. It\'s such a competitive advantage that by the time you\'ve filled it out you hardly need to train at all. Check it out!\",\"processed\":\"<p>Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! <\\/p>\\n\\n<p>Would we do that? Of course we wouldn&#8217;t. Instead we&#8217;ve got some boring old documents with members addresses and phone numbers and stuff.<\\/p>\\n\\n<h2>Training Plans<\\/h2>\\n\\n<p>One thing we wouldn&#8217;t want other clubs to get their filthy mitts on is our exciting Training Plan <span class=\\\"caps\\\">PDF<\\/span>! Exclusive to club members, this <span class=\\\"caps\\\">PDF<\\/span> helps you plan out your complete training programme. It&#8217;s such a competitive advantage that by the time you&#8217;ve filled it out you hardly need to train at all. Check it out!<\\/p>\"}}',' Members Area  Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! \n\nWould we do that? Of course we wouldn&#8217;t. Instead we&#8217;ve got some boring old documents with members addresses and phone numbers and stuff.\n\nTraining Plans\n\nOne thing we wouldn&#8217;t want other clubs to get their filthy mitts on is our exciting Training Plan PDF! Exclusive to club members, this PDF helps you plan out your complete training programme. It&#8217;s such a competitive advantage that by the time you&#8217;ve filled it out you hardly need to train at all. Check it out! '),
	(76,14,13,10,14,1000,'{\"_id\":\"14\",\"title\":\"Annual Report\",\"_title\":\"Annual Report\",\"desc\":{\"raw\":\"This is our annual club report, as presented and signed off at this year\'s Annual General Meeting by the committee and the club chairman.\",\"processed\":\"<p>This is our annual club report, as presented and signed off at this year&#8217;s Annual General Meeting by the committee and the club chairman.<\\/p>\"},\"file\":{\"_default\":\"\\/members\\/file\\/annual-report.pdf\",\"path\":\"annual-report.pdf\",\"size\":23364,\"bucket\":\"members\"}}',' Annual Report This is our annual club report, as presented and signed off at this year&#8217;s Annual General Meeting by the committee and the club chairman.  members file annual report pdf '),
	(77,15,13,10,14,1001,'{\"_id\":\"15\",\"title\":\"Training Plan\",\"_title\":\"Training Plan\",\"desc\":{\"raw\":\"Our exclusive club training plan PDF. This is like _training gold_! Fill out all the boxes and you\'re bound to beat your PB by miles.\",\"processed\":\"<p>Our exclusive club training plan <span class=\\\"caps\\\">PDF<\\/span>. This is like <em>training gold<\\/em>! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.<\\/p>\"},\"file\":{\"_default\":\"\\/members\\/file\\/training-plan.pdf\",\"path\":\"training-plan.pdf\",\"size\":30553,\"bucket\":\"members\"}}',' Training Plan Our exclusive club training plan PDF. This is like training gold! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.  members file training plan pdf '),
	(82,16,6,1,1,1000,'{\"_id\":\"16\",\"site_name\":\"Nest Running Club\",\"strapline\":\"Run for your life\"}',' Nest Running Club Run for your life '),
	(83,3,3,1,3,1000,'{\"_id\":\"3\",\"image\":{\"_default\":\"\\/perch\\/resources\\/home-banner.jpg\",\"path\":\"home-banner.jpg\",\"size\":34130,\"bucket\":\"default\",\"w\":1200,\"h\":350,\"sizes\":{\"thumb\":{\"w\":150,\"h\":43,\"path\":\"home-banner-thumb.jpg\",\"size\":1897,\"mime\":\"image\\/jpeg\"}}}}','    '),
	(80,2,2,1,4,1000,'{\"_id\":\"2\",\"twitter\":\"grabaperch\",\"facebook\":\"grabaperch\"}',' grabaperch grabaperch '),
	(56,7,9,12,2,1000,'{\"_id\":\"7\",\"text\":{\"raw\":\"h1. Register today\\r\\n\\r\\nNest running club members should already have their membership details, but if you\'re new to the club you can sign up here.\\r\\n\\r\\nMembers get access to information such as personal contact information that we\'d rather not have freely available to all. It\'s not that we\'re paranoid, but you just never know who\'s watching.\",\"processed\":\"<h1>Register today<\\/h1>\\n\\n<p>Nest running club members should already have their membership details, but if you&#8217;re new to the club you can sign up here.<\\/p>\\n\\n<p>Members get access to information such as personal contact information that we&#8217;d rather not have freely available to all. It&#8217;s not that we&#8217;re paranoid, but you just never know who&#8217;s watching.<\\/p>\"}}',' Register today\n\nNest running club members should already have their membership details, but if you&#8217;re new to the club you can sign up here.\n\nMembers get access to information such as personal contact information that we&#8217;d rather not have freely available to all. It&#8217;s not that we&#8217;re paranoid, but you just never know who&#8217;s watching. '),
	(79,1,1,1,5,1000,'{\"_id\":\"1\",\"title\":\"Become a member\",\"_title\":\"Become a member\",\"desc\":{\"raw\":\"Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!\",\"processed\":\"<p>Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!<\\/p>\"},\"cta\":\"Request an invitation\"}',' Become a member Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today! Request an invitation '),
	(78,8,10,14,3,1000,'{\"_id\":\"8\",\"text\":{\"raw\":\"h2. Get a new password\\r\\n\\r\\nHave you forgotten your password? You idiot! We can\'t remind you of your old password (it\'s stored in a secure way that means we can\'t retrieve it) but we can send you a new one.\\r\\n\\r\\nIf you\'re already registered, enter your email address below, submit the form and we\'ll send a new password to that email address.\",\"processed\":\"<h2>Get a new password<\\/h2>\\n\\n<p>Have you forgotten your password? You idiot! We can&#8217;t remind you of your old password (it&#8217;s stored in a secure way that means we can&#8217;t retrieve it) but we can send you a new one.<\\/p>\\n\\n<p>If you&#8217;re already registered, enter your email address below, submit the form and we&#8217;ll send a new password to that email address.<\\/p>\"}}',' Get a new password\n\nHave you forgotten your password? You idiot! We can&#8217;t remind you of your old password (it&#8217;s stored in a secure way that means we can&#8217;t retrieve it) but we can send you a new one.\n\nIf you&#8217;re already registered, enter your email address below, submit the form and we&#8217;ll send a new password to that email address. '),
	(59,13,14,16,1,1000,'{\"_id\":\"13\",\"text\":{\"raw\":\"This is my content!\",\"processed\":\"<p>This is my content!<\\/p>\"}}',' This is my content! '),
	(60,9,11,10,4,1000,'{\"_id\":\"9\",\"text\":{\"raw\":\"h1. Member login\\r\\n\\r\\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\\r\\n\\r\\nIf you\'re a member but don\'t yet have a website account, the you need to \\\"register\\\":\\/members\\/register\\/ first. If you\'re not a member and have no intention of becoming one, there\'s really nothing here for you. Nothing. Not a sausage.\",\"processed\":\"<h1>Member login<\\/h1>\\n\\n<p>The restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.<\\/p>\\n\\n<p>If you&#8217;re a member but don&#8217;t yet have a website account, the you need to <a href=\\\"\\/members\\/register\\/\\\">register<\\/a> first. If you&#8217;re not a member and have no intention of becoming one, there&#8217;s really nothing here for you. Nothing. Not a sausage.<\\/p>\"}}',' Member login\n\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\n\nIf you&#8217;re a member but don&#8217;t yet have a website account, the you need to register first. If you&#8217;re not a member and have no intention of becoming one, there&#8217;s really nothing here for you. Nothing. Not a sausage. ');

/*!40000 ALTER TABLE `perch2_content_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_content_regions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_content_regions`;

CREATE TABLE `perch2_content_regions` (
  `regionID` int(10) NOT NULL AUTO_INCREMENT,
  `pageID` int(10) unsigned NOT NULL,
  `regionKey` varchar(255) NOT NULL DEFAULT '',
  `regionPage` varchar(255) NOT NULL DEFAULT '',
  `regionHTML` longtext NOT NULL,
  `regionNew` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `regionOrder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `regionTemplate` varchar(255) NOT NULL DEFAULT '',
  `regionMultiple` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `regionOptions` text NOT NULL,
  `regionSearchable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `regionRev` int(10) unsigned NOT NULL DEFAULT '0',
  `regionLatestRev` int(10) unsigned NOT NULL DEFAULT '0',
  `regionEditRoles` varchar(255) NOT NULL DEFAULT '*',
  PRIMARY KEY (`regionID`),
  KEY `idx_key` (`regionKey`) USING BTREE,
  KEY `idx_path` (`regionPage`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_content_regions` WRITE;
/*!40000 ALTER TABLE `perch2_content_regions` DISABLE KEYS */;

INSERT INTO `perch2_content_regions` (`regionID`, `pageID`, `regionKey`, `regionPage`, `regionHTML`, `regionNew`, `regionOrder`, `regionTemplate`, `regionMultiple`, `regionOptions`, `regionSearchable`, `regionRev`, `regionLatestRev`, `regionEditRoles`)
VALUES
	(1,1,'Sidebar: become a member','*','<div class=\"box members minor\">\n	<h2>Become a member</h2>\n	<p>Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!</p>\n	<a class=\"button\" href=\"/members/register/\">Request an invitation</a>\n</div>',0,0,'sidebars/members.html',0,'{\"edit_mode\":\"listdetail\",\"searchURL\":\"\",\"title_delimit\":\"\",\"adminOnly\":0,\"addToTop\":0,\"limit\":false}',0,5,5,'*'),
	(2,1,'Sidebar: social links','*','	<div class=\"social\">\n		<ul>\n			\n			<li><a class=\"twitter icon\" href=\"https://twitter.com/grabaperch\">Follow us on Twitter</a></li>\n			\n			<li><a class=\"facebook icon\" href=\"https://facebook.com/grabaperch\">Befriend us on Facebook</a></li>\n		</ul>\n	</div>',0,1,'sidebars/social.html',0,'{\"edit_mode\":\"listdetail\",\"searchURL\":\"\",\"title_delimit\":\"\",\"adminOnly\":0,\"addToTop\":0,\"limit\":false}',0,4,4,'*'),
	(3,1,'Banner','/index.php','<div class=\"banner\">\n	<img src=\"/perch/resources/home-banner.jpg\" alt=\"\" class=\"bg\" />\n	<h1 class=\"icon logo\"><span class=\"offscreen\"></span></h1>\n	<h2 class=\"strap\"><span class=\"offscreen\"></span></h2>\n</div>',0,0,'home/banner.html',0,'{\"edit_mode\":\"singlepage\"}',1,3,3,'*'),
	(6,1,'Site name','*','\n\nNest Running Club\nRun for your life',0,0,'home/site_name.html',0,'{\"edit_mode\":\"singlepage\"}',0,1,1,'*'),
	(9,12,'Invitation to register','/members/register/index.php','<div class=\"box\">\n	<h1>Register today</h1>\n\n<p>Nest running club members should already have their membership details, but if you&#8217;re new to the club you can sign up here.</p>\n\n<p>Members get access to information such as personal contact information that we&#8217;d rather not have freely available to all. It&#8217;s not that we&#8217;re paranoid, but you just never know who&#8217;s watching.</p>\n</div>',0,1,'text_block.html',0,'{\"edit_mode\":\"singlepage\"}',1,2,2,'*'),
	(7,2,'About us','/about/index.php','<div class=\"box about\">\n	<h1>Who are we?</h1>\n\n	\n		<img src=\"/perch/resources/img1069-2-w280.jpg\" width=\"280\" height=\"186\" class=\"embedded\" alt=\"\" />\n	\n\n	<p>Hello, we&#8217;re <strong>Nest</strong> &#8212; a local running club for local people who like to run, locally. We&#8217;re really friendly and always welcome new members, as long as you&#8217;re local. So if you&#8217;re a local person who likes to run locally, pop along for a taster session. There&#8217;s no need to worry about joining, just come along and get a feel for the place. You can join if you&#8217;d like to attend regularly. We&#8217;re your local running club, locals.</p>\n\n<p>We meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. <em>On the run!</em> Ah haha!</p>\n\n<h2>Bring your own shoes</h2>\n\n<p>Sharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn&#8217;t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let&#8217;s face it, the risk isn&#8217;t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)</p>\n\n<p>Come and join us!</p>\n</div>\n\n',0,1,'about/about_us.html',0,'{\"edit_mode\":\"singlepage\"}',1,16,16,'*'),
	(8,7,'Contact form','/contact/index.php','<perch:form template=\"/templates/content/contact/form.html\" id=\"contact\" method=\"post\" app=\"perch_forms\" class=\"box contact\">\n	\n	<h2>Send us a message</h2>\n\n	\n\n	<div>\n		<perch:label for=\"name\">Your name:</perch:label>\n		<perch:input type=\"text\" id=\"name\" required=\"true\" label=\"Name\" />\n		<perch:error for=\"name\" type=\"required\">Please enter your name</perch:error>\n	</div>\n\n	<div>\n		<perch:label for=\"email\">Email address:</perch:label>\n		<perch:input type=\"email\" id=\"email\" required=\"true\" label=\"Email\" placeholder=\"you@example.com\" />\n		<perch:error for=\"email\" type=\"required\">Please add your email address</perch:error>\n		<perch:error for=\"email\" type=\"format\">Please check your email address</perch:error>\n	</div>\n\n	<div>\n		<perch:label for=\"message\">Comment:</perch:label>\n		<perch:input type=\"textarea\" id=\"message\" required=\"true\" label=\"Message\" />\n		<perch:error for=\"message\" type=\"required\">Please add a message</perch:error>\n	</div>\n\n	<div>\n		<perch:input type=\"submit\" value=\"Send message\" class=\"button\" />\n	</div>\n\n	<perch:success>\n		<div class=\"box contact\">\n			<h1>Thank you!</h1>\n\n<p>Thanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running!</p>\n		</div>\n	</perch:success>\n</perch:form>',0,1,'contact/form.html',0,'{\"edit_mode\":\"singlepage\"}',1,6,6,'*'),
	(10,14,'Password reset information','/members/reset/index.php','<div class=\"box\">\n	<h2>Get a new password</h2>\n\n<p>Have you forgotten your password? You idiot! We can&#8217;t remind you of your old password (it&#8217;s stored in a secure way that means we can&#8217;t retrieve it) but we can send you a new one.</p>\n\n<p>If you&#8217;re already registered, enter your email address below, submit the form and we&#8217;ll send a new password to that email address.</p>\n</div>',0,1,'text_block.html',0,'{\"edit_mode\":\"singlepage\"}',1,3,3,'*'),
	(11,10,'Login instructions','/members/index.php','<div class=\"box\">\n	<h1>Member login</h1>\n\n<p>The restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.</p>\n\n<p>If you&#8217;re a member but don&#8217;t yet have a website account, the you need to <a href=\"/members/register/\">register</a> first. If you&#8217;re not a member and have no intention of becoming one, there&#8217;s really nothing here for you. Nothing. Not a sausage.</p>\n</div>',0,1,'text_block.html',0,'{\"edit_mode\":\"singlepage\"}',1,4,4,'*'),
	(12,10,'Private members intro','/members/index.php','<div class=\"box members\">\n	<h1>Members Area</h1>\n\n	\n		<img src=\"/perch/resources/img0043-w280.jpg\" width=\"280\" height=\"186\" class=\"embedded\" />\n	\n\n	<p>Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! </p>\n\n<p>Would we do that? Of course we wouldn&#8217;t. Instead we&#8217;ve got some boring old documents with members addresses and phone numbers and stuff.</p>\n\n<h2>Training Plans</h2>\n\n<p>One thing we wouldn&#8217;t want other clubs to get their filthy mitts on is our exciting Training Plan <span class=\"caps\">PDF</span>! Exclusive to club members, this <span class=\"caps\">PDF</span> helps you plan out your complete training programme. It&#8217;s such a competitive advantage that by the time you&#8217;ve filled it out you hardly need to train at all. Check it out!</p>\n</div>\n\n',0,1,'members/intro.html',0,'{\"edit_mode\":\"singlepage\"}',1,4,4,'*'),
	(13,10,'Files for members','/members/index.php','\n<div class=\"box members minor\">\n	<h2>Members only info</h2>\n\n\n<div class=\"file\">\n	<a href=\"/members/file/annual-report.pdf\" class=\"button\">Annual Report</a>\n	<p>This is our annual club report, as presented and signed off at this year&#8217;s Annual General Meeting by the committee and the club chairman.</p>\n	\n</div>\n\n\n\n<div class=\"file\">\n	<a href=\"/members/file/training-plan.pdf\" class=\"button\">Training Plan</a>\n	<p>Our exclusive club training plan <span class=\"caps\">PDF</span>. This is like <em>training gold</em>! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.</p>\n	\n</div>\n\n\n</div>\n',0,2,'members/secure_file.html',1,'{\"edit_mode\":\"listdetail\",\"sortOrder\":\"ASC\",\"sortField\":\"\",\"limit\":\"\",\"searchURL\":\"\",\"addToTop\":\"\",\"column_ids\":\"title, file[size]\",\"title_delimit\":\"\",\"adminOnly\":0}',1,14,14,'*');

/*!40000 ALTER TABLE `perch2_content_regions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_content_resources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_content_resources`;

CREATE TABLE `perch2_content_resources` (
  `itemRowID` int(10) unsigned NOT NULL,
  `resourceID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`itemRowID`,`resourceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_content_resources` WRITE;
/*!40000 ALTER TABLE `perch2_content_resources` DISABLE KEYS */;

INSERT INTO `perch2_content_resources` (`itemRowID`, `resourceID`)
VALUES
	(51,15),
	(51,16),
	(51,17),
	(63,29),
	(63,30),
	(63,31),
	(76,33),
	(77,34),
	(83,1),
	(83,2);

/*!40000 ALTER TABLE `perch2_content_resources` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_events`;

CREATE TABLE `perch2_events` (
  `eventID` int(11) NOT NULL AUTO_INCREMENT,
  `eventTitle` varchar(255) NOT NULL DEFAULT '',
  `eventSlug` varchar(255) NOT NULL DEFAULT '',
  `eventDateTime` datetime DEFAULT NULL,
  `eventDescRaw` text,
  `eventDescHTML` text,
  `eventDynamicFields` text,
  PRIMARY KEY (`eventID`),
  KEY `idx_date` (`eventDateTime`),
  FULLTEXT KEY `idx_search` (`eventTitle`,`eventDescRaw`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

LOCK TABLES `perch2_events` WRITE;
/*!40000 ALTER TABLE `perch2_events` DISABLE KEYS */;

INSERT INTO `perch2_events` (`eventID`, `eventTitle`, `eventSlug`, `eventDateTime`, `eventDescRaw`, `eventDescHTML`, `eventDynamicFields`)
VALUES
	(1,'2013 Award Ceremony','2020-07-14-2013-award-ceremony','2020-07-14 19:30:00','Our annual awards show. Join us for a lavish formal dinner and awards ceremony. Just like last year, this is being held at the Birds Golf Club, just up road from the running club.\r\n\r\n*Dress code is black tie.* That means strictly _no lycra_ and absolutely _no running shoes_. The golf club have been quite clear on this point. Quite clear.\r\n\r\nTo encourage a high standard of dress, there will be a special prize for the best dressed couple on the evening, as judged by the committee. So gents get your dinner jackets dry cleaned, and ladies perhaps it\'s time for a new frock. We know you don\'t need an excuse! (_Our lady chairman informs me this may be a bit sexist. So ladies, any old frock will do._)','<p>Our annual awards show. Join us for a lavish formal dinner and awards ceremony. Just like last year, this is being held at the Birds Golf Club, just up road from the running club.</p>\n\n<p><strong>Dress code is black tie.</strong> That means strictly <em>no lycra</em> and absolutely <em>no running shoes</em>. The golf club have been quite clear on this point. Quite clear.</p>\n\n<p>To encourage a high standard of dress, there will be a special prize for the best dressed couple on the evening, as judged by the committee. So gents get your dinner jackets dry cleaned, and ladies perhaps it&#8217;s time for a new frock. We know you don&#8217;t need an excuse! (<em>Our lady chairman informs me this may be a bit sexist. So ladies, any old frock will do.</em>)</p>','{\"eventTitle\":\"2013 Award Ceremony\",\"summary\":{\"raw\":\"Our annual awards show. Join us for a lavish formal dinner and awards ceremony.\",\"processed\":\"<p>Our annual awards show. Join us for a lavish formal dinner and awards ceremony.<\\/p>\"}}'),
	(2,'The Nest 10k','2020-07-23-the-nest-10k','2020-07-23 09:15:00','We host our very own 10k race for other local clubs to compete in. \r\n\r\nWe run about 10,000 metres in more or less a circle. I know that sounds like a pointless activity, but it\'s really quite fun. Ok, maybe not exactly fun, but it\'s really healthy. Fresh air, a bracing wind, sunshine (sometimes) and birdsong. What more could you want?\r\n\r\nThe race starts at 9.15am sharp from the start line. Or the finish line -- they\'re both the same thing. It doesn\'t matter if you think of it as the start of the finish, but strictly speaking it\'s the start. It becomes the finish at the end. But 9.15 sharp!\r\n\r\nThere will be a water stop halfway around near St Abbott\'s primary school playground. Following last year\'s incident at the water station (which I\'m sure I need not mention) all runners are required to keep all their running kit on at the water stop.\r\n\r\nPlease invite your friends from other clubs to join us!','<p>We host our very own 10k race for other local clubs to compete in. </p>\n\n<p>We run about 10,000 metres in more or less a circle. I know that sounds like a pointless activity, but it&#8217;s really quite fun. Ok, maybe not exactly fun, but it&#8217;s really healthy. Fresh air, a bracing wind, sunshine (sometimes) and birdsong. What more could you want?</p>\n\n<p>The race starts at 9.15am sharp from the start line. Or the finish line &#8212; they&#8217;re both the same thing. It doesn&#8217;t matter if you think of it as the start of the finish, but strictly speaking it&#8217;s the start. It becomes the finish at the end. But 9.15 sharp!</p>\n\n<p>There will be a water stop halfway around near St Abbott&#8217;s primary school playground. Following last year&#8217;s incident at the water station (which I&#8217;m sure I need not mention) all runners are required to keep all their running kit on at the water stop.</p>\n\n<p>Please invite your friends from other clubs to join us!</p>','{\"eventTitle\":\"The Nest 10k\",\"summary\":{\"raw\":\"We host our very own 10k race for other local clubs to compete in.\",\"processed\":\"<p>We host our very own 10k race for other local clubs to compete in.<\\/p>\"}}'),
	(3,'Summer BBQ Social','2020-08-23-summer-bbq-social','2020-08-23 18:00:00','Following the success of last year\'s BBQ, despite the weather, we\'re holding another one! This is a real family event, so bring the kids and the dog! _(No dogs allowed.)_\r\n\r\nWe\'re taking over the field in the centre of the running track. There will be games, fun competitions and plenty of hot dogs and burgers-in-a-bun. Vegetarians are advised to bring some lettuce. Vegans should bring whatever it is you people eat. Or try a burger!\r\n\r\nLast year the weather was a little on the damp side. Although no one was actually struck by the lightening, it did get a bit hairy. This year we\'ll make sure that someone brings the keys to the clubhouse so that we can get in and shelter should the weather turn.\r\n\r\nI\'ll remind all members that Tony is still missing a green tartan picnic rug from last year, so keep your eyes peeled. \r\n\r\nTickets are £8 each, or £20 for a family of four.','<p>Following the success of last year&#8217;s <span class=\"caps\">BBQ</span>, despite the weather, we&#8217;re holding another one! This is a real family event, so bring the kids and the dog! <em>(No dogs allowed.)</em></p>\n\n<p>We&#8217;re taking over the field in the centre of the running track. There will be games, fun competitions and plenty of hot dogs and burgers-in-a-bun. Vegetarians are advised to bring some lettuce. Vegans should bring whatever it is you people eat. Or try a burger!</p>\n\n<p>Last year the weather was a little on the damp side. Although no one was actually struck by the lightening, it did get a bit hairy. This year we&#8217;ll make sure that someone brings the keys to the clubhouse so that we can get in and shelter should the weather turn.</p>\n\n<p>I&#8217;ll remind all members that Tony is still missing a green tartan picnic rug from last year, so keep your eyes peeled. </p>\n\n<p>Tickets are £8 each, or £20 for a family of four.</p>','{\"eventTitle\":\"Summer BBQ Social\",\"summary\":{\"raw\":\"Our summer BBQ special returns! This is a real family event, so bring the kids and the dog! (No dogs allowed.)\",\"processed\":\"<p>Our summer <span class=\\\"caps\\\">BBQ<\\/span> special returns! This is a real family event, so bring the kids and the dog! (No dogs allowed.)<\\/p>\"}}');

/*!40000 ALTER TABLE `perch2_events` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_events_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_events_categories`;

CREATE TABLE `perch2_events_categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryTitle` varchar(255) NOT NULL DEFAULT '',
  `categorySlug` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryID`),
  KEY `idx_slug` (`categorySlug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

LOCK TABLES `perch2_events_categories` WRITE;
/*!40000 ALTER TABLE `perch2_events_categories` DISABLE KEYS */;

INSERT INTO `perch2_events_categories` (`categoryID`, `categoryTitle`, `categorySlug`)
VALUES
	(1,'Social events','social-events'),
	(2,'Races','races');

/*!40000 ALTER TABLE `perch2_events_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_events_to_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_events_to_categories`;

CREATE TABLE `perch2_events_to_categories` (
  `eventID` int(11) NOT NULL DEFAULT '0',
  `categoryID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventID`,`categoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

LOCK TABLES `perch2_events_to_categories` WRITE;
/*!40000 ALTER TABLE `perch2_events_to_categories` DISABLE KEYS */;

INSERT INTO `perch2_events_to_categories` (`eventID`, `categoryID`)
VALUES
	(1,1),
	(2,2),
	(3,1);

/*!40000 ALTER TABLE `perch2_events_to_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_forms`;

CREATE TABLE `perch2_forms` (
  `formID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `formKey` varchar(64) NOT NULL DEFAULT '',
  `formTitle` varchar(255) NOT NULL DEFAULT '',
  `formTemplate` varchar(255) NOT NULL DEFAULT '',
  `formOptions` text,
  PRIMARY KEY (`formID`),
  KEY `idx_formKey` (`formKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_forms` WRITE;
/*!40000 ALTER TABLE `perch2_forms` DISABLE KEYS */;

INSERT INTO `perch2_forms` (`formID`, `formKey`, `formTitle`, `formTemplate`, `formOptions`)
VALUES
	(1,'contact','Contact','/templates/content/contact/form.html','{\"store\":\"1\",\"fileLocation\":\"\",\"email\":\"1\",\"emailAddress\":\"{email}\",\"adminEmailMessage\":\"Here\'s a message someone has sent from the website contact form.\",\"adminEmailSubject\":\"Nest running club contact form\",\"adminEmailFromName\":\"{firstname} {lastname}\",\"adminEmailFromAddress\":\"{email}\",\"akismetAPIKey\":\"\"}');

/*!40000 ALTER TABLE `perch2_forms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_forms_responses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_forms_responses`;

CREATE TABLE `perch2_forms_responses` (
  `responseID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `formID` int(10) unsigned NOT NULL,
  `responseCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `responseJSON` mediumtext,
  `responseIP` varchar(16) NOT NULL DEFAULT '',
  `responseSpam` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `responseSpamData` text,
  PRIMARY KEY (`responseID`),
  KEY `idx_formID` (`formID`),
  KEY `idx_spam` (`responseSpam`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_forms_responses` WRITE;
/*!40000 ALTER TABLE `perch2_forms_responses` DISABLE KEYS */;

INSERT INTO `perch2_forms_responses` (`responseID`, `formID`, `responseCreated`, `responseJSON`, `responseIP`, `responseSpam`, `responseSpamData`)
VALUES
	(4,1,'2013-06-22 16:08:44','{\"fields\":{\"name\":{\"attributes\":{\"type\":\"text\",\"id\":\"name\",\"required\":\"true\",\"label\":\"Name\"},\"value\":\"Drew McLellan\"},\"email\":{\"attributes\":{\"type\":\"email\",\"id\":\"email\",\"required\":\"true\",\"label\":\"Email\",\"placeholder\":\"you@example.com\"},\"value\":\"comments@allinthehead.com\"},\"message\":{\"attributes\":{\"type\":\"textarea\",\"id\":\"message\",\"required\":\"true\",\"label\":\"Message\"},\"value\":\"Hello - your club looks great! Do you have a beginner\'s night I could attend?\"}},\"files\":[]}','127.0.0.1',0,'{\"fields\":[],\"environment\":{\"HTTP_HOST\":\"perchdemo-nest.rocker.eoms\",\"HTTP_CONNECTION\":\"keep-alive\",\"CONTENT_LENGTH\":\"232\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"HTTP_ORIGIN\":\"http:\\/\\/perchdemo-nest.rocker.eoms\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/29.0.1545.0 Safari\\/537.36\",\"CONTENT_TYPE\":\"application\\/x-www-form-urlencoded\",\"HTTP_REFERER\":\"http:\\/\\/perchdemo-nest.rocker.eoms\\/contact\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate,sdch\",\"HTTP_ACCEPT_LANGUAGE\":\"en-US,en;q=0.8\",\"HTTP_COOKIE\":\"mp_aca1134b1691f97fca23dd82df07fa8f_mixpanel=%7B%22distinct_id%22%3A%20%2213db1092e6c1-0a8cfd912-67570c2a-384000-13db1092e6e8e8%22%2C%22%24initial_referrer%22%3A%20%22%24direct%22%2C%22%24initial_referring_domain%22%3A%20%22%24direct%22%7D; p_m=e307daeb6227c520ad0dcd47447632bde214bbc9; PHPSESSID=0d85c260dc2acb5995b3eac6e8ed0d4b; cmssb=0\",\"PATH\":\"\\/usr\\/bin:\\/bin:\\/usr\\/sbin:\\/sbin\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"perchdemo-nest.rocker.eoms\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\",\"SERVER_ADMIN\":\"you@example.com\",\"SCRIPT_FILENAME\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\\/contact\\/index.php\",\"REMOTE_PORT\":\"59061\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"POST\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/contact\\/\",\"SCRIPT_NAME\":\"\\/contact\\/index.php\",\"PHP_SELF\":\"\\/contact\\/index.php\",\"REQUEST_TIME_FLOAT\":1371913724.46,\"REQUEST_TIME\":1371913724,\"argv\":[],\"argc\":0}}');

/*!40000 ALTER TABLE `perch2_forms_responses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_gallery_albums
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_gallery_albums`;

CREATE TABLE `perch2_gallery_albums` (
  `albumID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `albumTitle` varchar(255) NOT NULL DEFAULT '',
  `albumSlug` varchar(255) NOT NULL DEFAULT '',
  `albumOrder` int(11) NOT NULL DEFAULT '0',
  `albumDynamicFields` text,
  `imageCount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`albumID`),
  KEY `idx_slug` (`albumSlug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

LOCK TABLES `perch2_gallery_albums` WRITE;
/*!40000 ALTER TABLE `perch2_gallery_albums` DISABLE KEYS */;

INSERT INTO `perch2_gallery_albums` (`albumID`, `albumTitle`, `albumSlug`, `albumOrder`, `albumDynamicFields`, `imageCount`)
VALUES
	(1,'Race Highlights','race-highlights',1,'{\"description\":{\"raw\":\"Some highlights from recent races run by our members or organised by the club. Can you see yourself?\",\"processed\":\"<p>Some highlights from recent races run by our members or organised by the club. Can you see yourself?<\\/p>\"},\"date\":\"2013-05-20\",\"featured\":\"1\",\"albumTitle\":\"Race Highlights\"}',5),
	(2,'Reading Half 2012','reading-half-2012',2,'{\"description\":{\"raw\":\"The Reading Half Marathon, April 2012, in Reading.\",\"processed\":\"<p>The Reading Half Marathon, April 2012, in Reading.<\\/p>\"},\"date\":\"2012-04-01\",\"albumTitle\":\"Reading Half 2012\"}',4),
	(3,'Reading Half 2011','reading-half-2011',3,'{\"description\":{\"raw\":\"The Reading Half Marathon 2011.\",\"processed\":\"<p>The Reading Half Marathon 2011.<\\/p>\"},\"date\":\"2011-03-20\",\"albumTitle\":\"Reading Half 2011\"}',9),
	(4,'Wycombe 10k 2011','wycombe-10k-2011',4,'{\"description\":{\"raw\":\"The Wycombe 10k race held in High Wycombe\",\"processed\":\"<p>The Wycombe 10k race held in High Wycombe<\\/p>\"},\"date\":\"2011-07-17\",\"albumTitle\":\"Wycombe 10k 2011\"}',8);

/*!40000 ALTER TABLE `perch2_gallery_albums` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_gallery_image_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_gallery_image_versions`;

CREATE TABLE `perch2_gallery_image_versions` (
  `versionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `versionPath` varchar(255) NOT NULL DEFAULT '',
  `versionKey` varchar(50) NOT NULL DEFAULT '',
  `versionWidth` int(10) unsigned NOT NULL DEFAULT '0',
  `versionHeight` int(10) unsigned NOT NULL DEFAULT '0',
  `imageID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`versionID`),
  KEY `idx_imageID` (`imageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

LOCK TABLES `perch2_gallery_image_versions` WRITE;
/*!40000 ALTER TABLE `perch2_gallery_image_versions` DISABLE KEYS */;

INSERT INTO `perch2_gallery_image_versions` (`versionID`, `versionPath`, `versionKey`, `versionWidth`, `versionHeight`, `imageID`)
VALUES
	(1,'img_1039-w620.jpg','feature',620,412,1),
	(2,'img_1039-w300h300.jpg','square',300,300,1),
	(3,'img_1039-w1024.jpg','main',1024,682,1),
	(4,'img_1039-w140h140@2x.jpg','thumb',140,140,1),
	(5,'img_1039.jpg','original',1024,682,1),
	(6,'img_1039-w80h80@2x.jpg','admin_thumb',80,80,1),
	(7,'img_1039-w180@2x.jpg','admin_preview',180,119,1),
	(8,'img_1069-w620.jpg','feature',620,413,2),
	(9,'img_1069-w300h300.jpg','square',300,300,2),
	(10,'img_1069-w1024.jpg','main',1024,683,2),
	(11,'img_1069-w140h140@2x.jpg','thumb',140,140,2),
	(12,'img_1069.jpg','original',1024,683,2),
	(13,'img_1069-w80h80@2x.jpg','admin_thumb',80,80,2),
	(14,'img_1069-w180@2x.jpg','admin_preview',180,120,2),
	(15,'img_1084-w620.jpg','feature',620,413,3),
	(16,'img_1084-w300h300.jpg','square',300,300,3),
	(17,'img_1084-w1024.jpg','main',1024,683,3),
	(18,'img_1084-w140h140@2x.jpg','thumb',140,140,3),
	(19,'img_1084.jpg','original',1024,683,3),
	(20,'img_1084-w80h80@2x.jpg','admin_thumb',80,80,3),
	(21,'img_1084-w180@2x.jpg','admin_preview',180,120,3),
	(22,'img_1096-w620.jpg','feature',620,413,4),
	(23,'img_1096-w300h300.jpg','square',300,300,4),
	(24,'img_1096-w1024.jpg','main',1024,683,4),
	(25,'img_1096-w140h140@2x.jpg','thumb',140,140,4),
	(26,'img_1096.jpg','original',1024,683,4),
	(27,'img_1096-w80h80@2x.jpg','admin_thumb',80,80,4),
	(28,'img_1096-w180@2x.jpg','admin_preview',180,120,4),
	(29,'img_1099-w620.jpg','feature',620,413,5),
	(30,'img_1099-w300h300.jpg','square',300,300,5),
	(31,'img_1099-w1024.jpg','main',1024,683,5),
	(32,'img_1099-w140h140@2x.jpg','thumb',140,140,5),
	(33,'img_1099.jpg','original',1024,683,5),
	(34,'img_1099-w80h80@2x.jpg','admin_thumb',80,80,5),
	(35,'img_1099-w180@2x.jpg','admin_preview',180,120,5),
	(36,'img_1102-w620.jpg','feature',620,413,6),
	(37,'img_1102-w300h300.jpg','square',300,300,6),
	(38,'img_1102-w1024.jpg','main',1024,683,6),
	(39,'img_1102-w140h140@2x.jpg','thumb',140,140,6),
	(40,'img_1102.jpg','original',1024,683,6),
	(41,'img_1102-w80h80@2x.jpg','admin_thumb',80,80,6),
	(42,'img_1102-w180@2x.jpg','admin_preview',180,120,6),
	(43,'img_1109-w620.jpg','feature',620,413,7),
	(44,'img_1109-w300h300.jpg','square',300,300,7),
	(45,'img_1109-w1024.jpg','main',1024,683,7),
	(46,'img_1109-w140h140@2x.jpg','thumb',140,140,7),
	(47,'img_1109.jpg','original',1024,683,7),
	(48,'img_1109-w80h80@2x.jpg','admin_thumb',80,80,7),
	(49,'img_1109-w180@2x.jpg','admin_preview',180,120,7),
	(50,'img_1114-w620.jpg','feature',620,412,8),
	(51,'img_1114-w300h300.jpg','square',300,300,8),
	(52,'img_1114-w1024.jpg','main',1024,682,8),
	(53,'img_1114-w140h140@2x.jpg','thumb',140,140,8),
	(54,'img_1114.jpg','original',1024,682,8),
	(55,'img_1114-w80h80@2x.jpg','admin_thumb',80,80,8),
	(56,'img_1114-w180@2x.jpg','admin_preview',180,119,8),
	(57,'img_1117-w620.jpg','feature',620,413,9),
	(58,'img_1117-w300h300.jpg','square',300,300,9),
	(59,'img_1117-w1024.jpg','main',1024,683,9),
	(60,'img_1117-w140h140@2x.jpg','thumb',140,140,9),
	(61,'img_1117.jpg','original',1024,683,9),
	(62,'img_1117-w80h80@2x.jpg','admin_thumb',80,80,9),
	(63,'img_1117-w180@2x.jpg','admin_preview',180,120,9),
	(64,'img_0043-w620.jpg','feature',620,413,10),
	(65,'img_0043-w300h300.jpg','square',300,300,10),
	(66,'img_0043-w1024.jpg','main',1024,683,10),
	(67,'img_0043-w140h140@2x.jpg','thumb',140,140,10),
	(68,'img_0043.jpg','original',1024,683,10),
	(69,'img_0043-w80h80@2x.jpg','admin_thumb',80,80,10),
	(70,'img_0043-w180@2x.jpg','admin_preview',180,120,10),
	(71,'img_0259-w620.jpg','feature',620,413,11),
	(72,'img_0259-w300h300.jpg','square',300,300,11),
	(73,'img_0259-w1024.jpg','main',1024,683,11),
	(74,'img_0259-w140h140@2x.jpg','thumb',140,140,11),
	(75,'img_0259.jpg','original',1024,683,11),
	(76,'img_0259-w80h80@2x.jpg','admin_thumb',80,80,11),
	(77,'img_0259-w180@2x.jpg','admin_preview',180,120,11),
	(78,'img_0260-w620.jpg','feature',620,413,12),
	(79,'img_0260-w300h300.jpg','square',300,300,12),
	(80,'img_0260-w1024.jpg','main',1024,683,12),
	(81,'img_0260-w140h140@2x.jpg','thumb',140,140,12),
	(82,'img_0260.jpg','original',1024,683,12),
	(83,'img_0260-w80h80@2x.jpg','admin_thumb',80,80,12),
	(84,'img_0260-w180@2x.jpg','admin_preview',180,120,12),
	(85,'img_0261-w620.jpg','feature',620,413,13),
	(86,'img_0261-w300h300.jpg','square',300,300,13),
	(87,'img_0261-w1024.jpg','main',1024,683,13),
	(88,'img_0261-w140h140@2x.jpg','thumb',140,140,13),
	(89,'img_0261.jpg','original',1024,683,13),
	(90,'img_0261-w80h80@2x.jpg','admin_thumb',80,80,13),
	(91,'img_0261-w180@2x.jpg','admin_preview',180,120,13),
	(92,'img_0267-w620.jpg','feature',620,413,14),
	(93,'img_0267-w300h300.jpg','square',300,300,14),
	(94,'img_0267-w1024.jpg','main',1024,683,14),
	(95,'img_0267-w140h140@2x.jpg','thumb',140,140,14),
	(96,'img_0267.jpg','original',1024,683,14),
	(97,'img_0267-w80h80@2x.jpg','admin_thumb',80,80,14),
	(98,'img_0267-w180@2x.jpg','admin_preview',180,120,14),
	(99,'img_0276-w620.jpg','feature',620,413,15),
	(100,'img_0276-w300h300.jpg','square',300,300,15),
	(101,'img_0276-w1024.jpg','main',1024,683,15),
	(102,'img_0276-w140h140@2x.jpg','thumb',140,140,15),
	(103,'img_0276.jpg','original',1024,683,15),
	(104,'img_0276-w80h80@2x.jpg','admin_thumb',80,80,15),
	(105,'img_0276-w180@2x.jpg','admin_preview',180,120,15),
	(106,'img_0280-w620.jpg','feature',620,413,16),
	(107,'img_0280-w300h300.jpg','square',300,300,16),
	(108,'img_0280-w1024.jpg','main',1024,683,16),
	(109,'img_0280-w140h140@2x.jpg','thumb',140,140,16),
	(110,'img_0280.jpg','original',1024,683,16),
	(111,'img_0280-w80h80@2x.jpg','admin_thumb',80,80,16),
	(112,'img_0280-w180@2x.jpg','admin_preview',180,120,16),
	(113,'img_0306-w620.jpg','feature',620,413,17),
	(114,'img_0306-w300h300.jpg','square',300,300,17),
	(115,'img_0306-w1024.jpg','main',1024,683,17),
	(116,'img_0306-w140h140@2x.jpg','thumb',140,140,17),
	(117,'img_0306.jpg','original',1024,683,17),
	(118,'img_0306-w80h80@2x.jpg','admin_thumb',80,80,17),
	(119,'img_0306-w180@2x.jpg','admin_preview',180,120,17),
	(120,'img_4309-w620.jpg','feature',620,413,18),
	(121,'img_4309-w300h300.jpg','square',300,300,18),
	(122,'img_4309-w1024.jpg','main',1024,683,18),
	(123,'img_4309-w140h140@2x.jpg','thumb',140,140,18),
	(124,'img_4309.jpg','original',1024,683,18),
	(125,'img_4309-w80h80@2x.jpg','admin_thumb',80,80,18),
	(126,'img_4309-w180@2x.jpg','admin_preview',180,120,18),
	(127,'img_4310-w620.jpg','feature',620,413,19),
	(128,'img_4310-w300h300.jpg','square',300,300,19),
	(129,'img_4310-w1024.jpg','main',1024,683,19),
	(130,'img_4310-w140h140@2x.jpg','thumb',140,140,19),
	(131,'img_4310.jpg','original',1024,683,19),
	(132,'img_4310-w80h80@2x.jpg','admin_thumb',80,80,19),
	(133,'img_4310-w180@2x.jpg','admin_preview',180,120,19),
	(134,'img_4311-w620.jpg','feature',620,413,20),
	(135,'img_4311-w300h300.jpg','square',300,300,20),
	(136,'img_4311-w1024.jpg','main',1024,683,20),
	(137,'img_4311-w140h140@2x.jpg','thumb',140,140,20),
	(138,'img_4311.jpg','original',1024,683,20),
	(139,'img_4311-w80h80@2x.jpg','admin_thumb',80,80,20),
	(140,'img_4311-w180@2x.jpg','admin_preview',180,120,20),
	(141,'img_4316-w620.jpg','feature',620,413,21),
	(142,'img_4316-w300h300.jpg','square',300,300,21),
	(143,'img_4316-w1024.jpg','main',1024,683,21),
	(144,'img_4316-w140h140@2x.jpg','thumb',140,140,21),
	(145,'img_4316.jpg','original',1024,683,21),
	(146,'img_4316-w80h80@2x.jpg','admin_thumb',80,80,21),
	(147,'img_4316-w180@2x.jpg','admin_preview',180,120,21),
	(148,'img_7847-w620.jpg','feature',620,413,22),
	(149,'img_7847-w300h300.jpg','square',300,300,22),
	(150,'img_7847-w1024.jpg','main',1024,683,22),
	(151,'img_7847-w140h140@2x.jpg','thumb',140,140,22),
	(152,'img_7847.jpg','original',1024,683,22),
	(153,'img_7847-w80h80@2x.jpg','admin_thumb',80,80,22),
	(154,'img_7847-w180@2x.jpg','admin_preview',180,120,22),
	(155,'img_7848-w620.jpg','feature',620,413,23),
	(156,'img_7848-w300h300.jpg','square',300,300,23),
	(157,'img_7848-w1024.jpg','main',1024,683,23),
	(158,'img_7848-w140h140@2x.jpg','thumb',140,140,23),
	(159,'img_7848.jpg','original',1024,683,23),
	(160,'img_7848-w80h80@2x.jpg','admin_thumb',80,80,23),
	(161,'img_7848-w180@2x.jpg','admin_preview',180,120,23),
	(162,'img_7853-w620.jpg','feature',620,413,24),
	(163,'img_7853-w300h300.jpg','square',300,300,24),
	(164,'img_7853-w1024.jpg','main',1024,683,24),
	(165,'img_7853-w140h140@2x.jpg','thumb',140,140,24),
	(166,'img_7853.jpg','original',1024,683,24),
	(167,'img_7853-w80h80@2x.jpg','admin_thumb',80,80,24),
	(168,'img_7853-w180@2x.jpg','admin_preview',180,120,24),
	(169,'img_7877-w620.jpg','feature',620,413,25),
	(170,'img_7877-w300h300.jpg','square',300,300,25),
	(171,'img_7877-w1024.jpg','main',1024,683,25),
	(172,'img_7877-w140h140@2x.jpg','thumb',140,140,25),
	(173,'img_7877.jpg','original',1024,683,25),
	(174,'img_7877-w80h80@2x.jpg','admin_thumb',80,80,25),
	(175,'img_7877-w180@2x.jpg','admin_preview',180,120,25),
	(176,'img_7879-w620.jpg','feature',620,413,26),
	(177,'img_7879-w300h300.jpg','square',300,300,26),
	(178,'img_7879-w1024.jpg','main',1024,683,26),
	(179,'img_7879-w140h140@2x.jpg','thumb',140,140,26),
	(180,'img_7879.jpg','original',1024,683,26),
	(181,'img_7879-w80h80@2x.jpg','admin_thumb',80,80,26),
	(182,'img_7879-w180@2x.jpg','admin_preview',180,120,26);

/*!40000 ALTER TABLE `perch2_gallery_image_versions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_gallery_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_gallery_images`;

CREATE TABLE `perch2_gallery_images` (
  `imageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imageAlt` varchar(255) NOT NULL DEFAULT '',
  `imageSlug` varchar(255) NOT NULL DEFAULT '',
  `albumID` int(10) unsigned NOT NULL DEFAULT '0',
  `imageOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `imageDynamicFields` text,
  `imageStatus` enum('active','uploading','failed') NOT NULL DEFAULT 'active',
  `imageBucket` varchar(255) NOT NULL DEFAULT 'default',
  PRIMARY KEY (`imageID`),
  KEY `idx_albumID` (`albumID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

LOCK TABLES `perch2_gallery_images` WRITE;
/*!40000 ALTER TABLE `perch2_gallery_images` DISABLE KEYS */;

INSERT INTO `perch2_gallery_images` (`imageID`, `imageAlt`, `imageSlug`, `albumID`, `imageOrder`, `imageDynamicFields`, `imageStatus`, `imageBucket`)
VALUES
	(1,'img_1039','img1039',3,1,NULL,'active','gallery'),
	(2,'img_1069','img1069',3,2,NULL,'active','gallery'),
	(3,'img_1084','img1084',3,3,NULL,'active','gallery'),
	(4,'img_1096','img1096',3,4,NULL,'active','gallery'),
	(5,'img_1099','img1099',3,5,NULL,'active','gallery'),
	(6,'img_1102','img1102',3,6,NULL,'active','gallery'),
	(7,'img_1109','img1109',3,7,NULL,'active','gallery'),
	(8,'img_1114','img1114',3,8,NULL,'active','gallery'),
	(9,'img_1117','img1117',3,9,NULL,'active','gallery'),
	(10,'img_0043','img0043',4,1,NULL,'active','gallery'),
	(11,'img_0259','img0259',4,2,NULL,'active','gallery'),
	(12,'img_0260','img0260',4,8,NULL,'active','gallery'),
	(13,'img_0261','img0261',4,3,NULL,'active','gallery'),
	(14,'img_0267','img0267',4,4,NULL,'active','gallery'),
	(15,'img_0276','img0276',4,5,NULL,'active','gallery'),
	(16,'img_0280','img0280',4,6,NULL,'active','gallery'),
	(17,'img_0306','img0306',4,7,NULL,'active','gallery'),
	(18,'img_4309','img4309',2,1,NULL,'active','gallery'),
	(19,'img_4310','img4310',2,2,NULL,'active','gallery'),
	(20,'img_4311','img4311',2,3,NULL,'active','gallery'),
	(21,'img_4316','img4316',2,4,NULL,'active','gallery'),
	(22,'img_7847','img7847',1,1,NULL,'active','gallery'),
	(23,'img_7848','img7848',1,2,NULL,'active','gallery'),
	(24,'img_7853','img7853',1,3,NULL,'active','gallery'),
	(25,'img_7877','img7877',1,4,NULL,'active','gallery'),
	(26,'img_7879','img7879',1,5,NULL,'active','gallery');

/*!40000 ALTER TABLE `perch2_gallery_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_members`;

CREATE TABLE `perch2_members` (
  `memberID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberAuthType` char(32) NOT NULL DEFAULT 'native',
  `memberAuthID` char(64) NOT NULL DEFAULT '',
  `memberEmail` char(255) NOT NULL DEFAULT '',
  `memberPassword` char(255) NOT NULL DEFAULT '',
  `memberStatus` enum('pending','active','inactive') NOT NULL DEFAULT 'pending',
  `memberCreated` datetime NOT NULL DEFAULT '2013-01-01 00:00:00',
  `memberExpires` datetime DEFAULT NULL,
  `memberProperties` text NOT NULL,
  PRIMARY KEY (`memberID`),
  KEY `idx_email` (`memberEmail`),
  KEY `idx_type` (`memberAuthType`),
  KEY `idx_active` (`memberStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_members` WRITE;
/*!40000 ALTER TABLE `perch2_members` DISABLE KEYS */;

INSERT INTO `perch2_members` (`memberID`, `memberAuthType`, `memberAuthID`, `memberEmail`, `memberPassword`, `memberStatus`, `memberCreated`, `memberExpires`, `memberProperties`)
VALUES
	(3,'native','3','drew.mclellan@gmail.com','$P$BDaR2b5PhqBBjj57Myak4ac4aL13x8.','active','2013-06-10 17:28:09',NULL,'{\"first_name\":\"Fred\",\"last_name\":\"Flintstone\",\"membership_no\":\"123454798\"}');

/*!40000 ALTER TABLE `perch2_members` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_members_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_members_forms`;

CREATE TABLE `perch2_members_forms` (
  `formID` int(10) NOT NULL AUTO_INCREMENT,
  `formKey` char(64) NOT NULL DEFAULT '',
  `formTitle` varchar(255) NOT NULL,
  `formSettings` text NOT NULL,
  PRIMARY KEY (`formID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_members_forms` WRITE;
/*!40000 ALTER TABLE `perch2_members_forms` DISABLE KEYS */;

INSERT INTO `perch2_members_forms` (`formID`, `formKey`, `formTitle`, `formSettings`)
VALUES
	(1,'register.default','Registration form','{\"moderate\":\"1\",\"moderator_email\":\"drew.mclellan@gmail.com\",\"default_tags\":\"member\"}');

/*!40000 ALTER TABLE `perch2_members_forms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_members_member_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_members_member_tags`;

CREATE TABLE `perch2_members_member_tags` (
  `memberID` int(10) NOT NULL,
  `tagID` int(10) NOT NULL,
  `tagExpires` datetime DEFAULT NULL,
  PRIMARY KEY (`memberID`,`tagID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_members_member_tags` WRITE;
/*!40000 ALTER TABLE `perch2_members_member_tags` DISABLE KEYS */;

INSERT INTO `perch2_members_member_tags` (`memberID`, `tagID`, `tagExpires`)
VALUES
	(3,1,NULL);

/*!40000 ALTER TABLE `perch2_members_member_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_members_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_members_sessions`;

CREATE TABLE `perch2_members_sessions` (
  `sessionID` char(40) NOT NULL DEFAULT '',
  `sessionExpires` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `sessionHttpFootprint` char(40) NOT NULL DEFAULT '',
  `memberID` int(10) unsigned NOT NULL DEFAULT '0',
  `sessionData` text NOT NULL,
  PRIMARY KEY (`sessionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table perch2_members_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_members_tags`;

CREATE TABLE `perch2_members_tags` (
  `tagID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` char(64) NOT NULL DEFAULT '',
  `tagDisplay` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`tagID`),
  KEY `idx_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `perch2_members_tags` WRITE;
/*!40000 ALTER TABLE `perch2_members_tags` DISABLE KEYS */;

INSERT INTO `perch2_members_tags` (`tagID`, `tag`, `tagDisplay`)
VALUES
	(1,'member','member');

/*!40000 ALTER TABLE `perch2_members_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_navigation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_navigation`;

CREATE TABLE `perch2_navigation` (
  `groupID` int(10) NOT NULL AUTO_INCREMENT,
  `groupTitle` varchar(255) NOT NULL DEFAULT '',
  `groupSlug` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`groupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_navigation` WRITE;
/*!40000 ALTER TABLE `perch2_navigation` DISABLE KEYS */;

INSERT INTO `perch2_navigation` (`groupID`, `groupTitle`, `groupSlug`)
VALUES
	(1,'Members','members');

/*!40000 ALTER TABLE `perch2_navigation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_navigation_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_navigation_pages`;

CREATE TABLE `perch2_navigation_pages` (
  `navpageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageID` int(10) unsigned NOT NULL DEFAULT '0',
  `groupID` int(10) unsigned NOT NULL DEFAULT '0',
  `pageParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `pageOrder` int(10) unsigned NOT NULL DEFAULT '1',
  `pageDepth` tinyint(10) unsigned NOT NULL,
  `pageTreePosition` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`navpageID`),
  KEY `idx_group` (`groupID`),
  KEY `idx_page_group` (`pageID`,`groupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_navigation_pages` WRITE;
/*!40000 ALTER TABLE `perch2_navigation_pages` DISABLE KEYS */;

INSERT INTO `perch2_navigation_pages` (`navpageID`, `pageID`, `groupID`, `pageParentID`, `pageOrder`, `pageDepth`, `pageTreePosition`)
VALUES
	(1,10,1,0,1,1,'000-000'),
	(2,11,1,0,1,1,'000-000'),
	(3,12,1,10,2,2,'000-000-002'),
	(4,13,1,0,1,2,'000-000'),
	(5,14,1,0,1,2,'000-000');

/*!40000 ALTER TABLE `perch2_navigation_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_page_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_page_templates`;

CREATE TABLE `perch2_page_templates` (
  `templateID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `templateTitle` varchar(255) NOT NULL DEFAULT '',
  `templatePath` varchar(255) NOT NULL DEFAULT '',
  `optionsPageID` int(10) unsigned NOT NULL DEFAULT '0',
  `templateReference` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `templateNavGroups` varchar(255) DEFAULT '',
  PRIMARY KEY (`templateID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_page_templates` WRITE;
/*!40000 ALTER TABLE `perch2_page_templates` DISABLE KEYS */;

INSERT INTO `perch2_page_templates` (`templateID`, `templateTitle`, `templatePath`, `optionsPageID`, `templateReference`, `templateNavGroups`)
VALUES
	(1,'Default','default.php',0,1,'');

/*!40000 ALTER TABLE `perch2_page_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_pages`;

CREATE TABLE `perch2_pages` (
  `pageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `pagePath` varchar(255) NOT NULL DEFAULT '',
  `pageTitle` varchar(255) NOT NULL DEFAULT '',
  `pageNavText` varchar(255) NOT NULL DEFAULT '',
  `pageNew` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pageOrder` int(10) unsigned NOT NULL DEFAULT '1',
  `pageDepth` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `pageSortPath` varchar(255) NOT NULL DEFAULT '',
  `pageTreePosition` varchar(64) NOT NULL DEFAULT '',
  `pageSubpageRoles` varchar(255) NOT NULL DEFAULT '',
  `pageSubpagePath` varchar(255) NOT NULL DEFAULT '',
  `pageHidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pageNavOnly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pageAccessTags` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pageID`),
  KEY `idx_parent` (`pageParentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_pages` WRITE;
/*!40000 ALTER TABLE `perch2_pages` DISABLE KEYS */;

INSERT INTO `perch2_pages` (`pageID`, `pageParentID`, `pagePath`, `pageTitle`, `pageNavText`, `pageNew`, `pageOrder`, `pageDepth`, `pageSortPath`, `pageTreePosition`, `pageSubpageRoles`, `pageSubpagePath`, `pageHidden`, `pageNavOnly`, `pageAccessTags`)
VALUES
	(1,0,'/index.php','Welcome','Home page',0,1,1,'','000-001','','/',1,0,''),
	(2,0,'/about/index.php','About','About',0,2,1,'/about','000-002','','/about',0,0,''),
	(3,0,'/events/index.php','Events','Events',0,3,1,'/events','000-003','','',0,0,''),
	(4,0,'/gallery/index.php','Gallery','Gallery',0,4,1,'/gallery','000-004','','',0,0,''),
	(5,0,'/blog/index.php','Blog','Blog',0,5,1,'/blog','000-005','','',0,0,''),
	(6,0,'/shop/index.php','Shop','Shop',0,7,1,'/shop','000-007','','',0,0,''),
	(7,0,'/contact/index.php','Contact','Contact',0,6,1,'/contact','000-006','','',0,0,''),
	(10,0,'/members/index.php','Members','Member Login',0,8,1,'/members','000-009','','/members',1,0,''),
	(11,0,'/logout','Log out','Log out',0,9,1,'/log-out','000-010','','/',1,0,'member'),
	(12,10,'/members/register/index.php','Register','Register',0,1,2,'/register','000-009-001','','/',0,0,''),
	(15,5,'/blog/post.php','Post','Post',0,1,2,'/blog/post','000-005-001','','/blog',1,0,''),
	(14,10,'/members/reset/index.php','Reset','Reset',0,3,2,'/members/reset','000-009-004','','/members/reset',0,0,'');

/*!40000 ALTER TABLE `perch2_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_resources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_resources`;

CREATE TABLE `perch2_resources` (
  `resourceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resourceApp` char(32) NOT NULL DEFAULT 'content',
  `resourceBucket` char(16) NOT NULL DEFAULT 'default',
  `resourceFile` char(255) NOT NULL DEFAULT '',
  `resourceKey` enum('orig','thumb') DEFAULT NULL,
  `resourceParentID` int(10) NOT NULL DEFAULT '0',
  `resourceType` char(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`resourceID`),
  UNIQUE KEY `idx_file` (`resourceBucket`,`resourceFile`),
  KEY `idx_app` (`resourceApp`),
  KEY `idx_key` (`resourceKey`),
  KEY `idx_type` (`resourceType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_resources` WRITE;
/*!40000 ALTER TABLE `perch2_resources` DISABLE KEYS */;

INSERT INTO `perch2_resources` (`resourceID`, `resourceApp`, `resourceBucket`, `resourceFile`, `resourceKey`, `resourceParentID`, `resourceType`)
VALUES
	(1,'content','default','home-banner.jpg','orig',0,'jpg'),
	(2,'content','default','home-banner-thumb.jpg','thumb',1,'jpg'),
	(37,'perch_shop','default','dscf0729-w600h600@2x.jpg','',35,'jpg'),
	(36,'perch_shop','default','dscf0729-thumb.jpg','thumb',35,'jpg'),
	(35,'perch_shop','default','dscf0729.jpg','orig',0,'jpg'),
	(33,'content','members','annual-report.pdf','orig',0,'pdf'),
	(15,'content','default','img1069-2.jpg','orig',0,'jpg'),
	(16,'content','default','img1069-2-thumb.jpg','thumb',15,'jpg'),
	(17,'content','default','img1069-2-w280.jpg','',15,'jpg'),
	(18,'perch_blog','default','img0306.jpg','orig',0,'jpg'),
	(19,'perch_blog','default','img0306-thumb.jpg','thumb',18,'jpg'),
	(20,'perch_blog','default','img0306-w320h240.jpg','',18,'jpg'),
	(21,'perch_blog','default','img0306-w50h50.jpg','',18,'jpg'),
	(22,'perch_blog','default','img0306-1.jpg','orig',0,'jpg'),
	(23,'perch_blog','default','img0306-1-thumb.jpg','thumb',22,'jpg'),
	(24,'perch_blog','default','img0306-1-w500.jpg','',22,'jpg'),
	(25,'perch_blog','default','img0306-1-w140h140@2x.jpg','',22,'jpg'),
	(26,'perch_shop','default','img0259.jpg','orig',0,'jpg'),
	(27,'perch_shop','default','img0259-thumb.jpg','thumb',26,'jpg'),
	(28,'perch_shop','default','img0259-w600h600@2x.jpg','',26,'jpg'),
	(29,'content','default','img0043.jpg','orig',0,'jpg'),
	(30,'content','default','img0043-thumb.jpg','thumb',29,'jpg'),
	(31,'content','default','img0043-w280.jpg','',29,'jpg'),
	(34,'content','members','training-plan.pdf','orig',0,'pdf');

/*!40000 ALTER TABLE `perch2_resources` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_settings`;

CREATE TABLE `perch2_settings` (
  `settingID` varchar(60) NOT NULL DEFAULT '',
  `userID` int(10) unsigned NOT NULL DEFAULT '0',
  `settingValue` text NOT NULL,
  PRIMARY KEY (`settingID`,`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_settings` WRITE;
/*!40000 ALTER TABLE `perch2_settings` DISABLE KEYS */;

INSERT INTO `perch2_settings` (`settingID`, `userID`, `settingValue`)
VALUES
	('headerColour',0,'#272727'),
	('content_singlePageEdit',0,'1'),
	('helpURL',0,'http://docs.grabaperch.com/demo/nest'),
	('siteURL',0,'/'),
	('hideBranding',0,'1'),
	('content_collapseList',0,'1'),
	('lang',0,'en-gb'),
	('update_2.2.4',0,'done'),
	('latest_version',0,'2.0.8'),
	('perch_blog_post_url',0,'/blog/{postSlug}/'),
	('perch_blog_update',0,'3.7.2'),
	('update_2.2.6',0,'done'),
	('perch_gallery_update',0,'2.7'),
	('headerScheme',0,'dark'),
	('perch_blog_slug_format',0,'{postID}-{postTitle}'),
	('perch_blog_akismet_key',0,''),
	('perch_events_detail_url',0,'/events/event.php?event={eventSlug}'),
	('perch_gallery_bucket_mode',0,'single'),
	('perch_gallery_bucket',0,'gallery'),
	('dashboard',0,'1'),
	('content_hideNonEditableRegions',0,'0'),
	('perch_blog_comment_notify',0,'0'),
	('perch_gallery_basicUpload',0,'0'),
	('perch_members_login_page',0,'/members/login.php?r={returnURL}'),
	('perch_shop_paypal_email',0,''),
	('perch_shop_product_url',0,'/shop/product.php?s={productSlug}'),
	('perch_shop_display_oos',0,'0'),
	('update_2.2.9',0,'done'),
	('dashboard_order',1,'perch_blog,perch_gallery,content,perch_forms,perch_events');

/*!40000 ALTER TABLE `perch2_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_shop_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_shop_categories`;

CREATE TABLE `perch2_shop_categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryTitle` varchar(255) NOT NULL DEFAULT '',
  `categorySlug` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryID`),
  KEY `idx_slug` (`categorySlug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

LOCK TABLES `perch2_shop_categories` WRITE;
/*!40000 ALTER TABLE `perch2_shop_categories` DISABLE KEYS */;

INSERT INTO `perch2_shop_categories` (`categoryID`, `categoryTitle`, `categorySlug`)
VALUES
	(1,'Clothing','clothing'),
	(2,'Merchandise','merchandise');

/*!40000 ALTER TABLE `perch2_shop_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_shop_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_shop_log`;

CREATE TABLE `perch2_shop_log` (
  `logID` int(11) NOT NULL AUTO_INCREMENT,
  `logData` text,
  `logDateTime` datetime DEFAULT NULL,
  `logTransaction` varchar(255) DEFAULT '',
  `logVerify` varchar(255) DEFAULT '',
  PRIMARY KEY (`logID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



# Dump of table perch2_shop_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_shop_orders`;

CREATE TABLE `perch2_shop_orders` (
  `orderID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderTxnID` varchar(32) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `orderPayerEmail` varchar(255) DEFAULT NULL,
  `orderPayerID` varchar(64) DEFAULT NULL,
  `orderPaymentStatus` varchar(64) DEFAULT NULL,
  `orderCurrency` char(3) NOT NULL,
  `orderFee` float(10,2) NOT NULL DEFAULT '0.00',
  `orderTax` float(10,2) NOT NULL DEFAULT '0.00',
  `orderShipping` float(10,2) NOT NULL DEFAULT '0.00',
  `orderTotal` float(10,2) NOT NULL DEFAULT '0.00',
  `orderTotalItems` int(10) unsigned NOT NULL DEFAULT '0',
  `orderFirstName` varchar(255) DEFAULT NULL,
  `orderLastName` varchar(255) DEFAULT NULL,
  `orderAddressName` varchar(255) DEFAULT NULL,
  `orderAddressStreet` varchar(255) DEFAULT NULL,
  `orderAddressCity` varchar(255) DEFAULT NULL,
  `orderAddressState` varchar(255) DEFAULT NULL,
  `orderAddressCountry` varchar(255) DEFAULT NULL,
  `orderAddressZIP` varchar(255) DEFAULT NULL,
  `orderItems` text,
  `orderStatus` enum('New','Dispatched') NOT NULL DEFAULT 'New',
  PRIMARY KEY (`orderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table perch2_shop_product_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_shop_product_options`;

CREATE TABLE `perch2_shop_product_options` (
  `optionID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL DEFAULT '0',
  `optionKey` varchar(255) NOT NULL DEFAULT '',
  `optionValues` text,
  PRIMARY KEY (`optionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

LOCK TABLES `perch2_shop_product_options` WRITE;
/*!40000 ALTER TABLE `perch2_shop_product_options` DISABLE KEYS */;

INSERT INTO `perch2_shop_product_options` (`optionID`, `productID`, `optionKey`, `optionValues`)
VALUES
	(1,2,'Size','S,M,L,XL,XXL'),
	(2,3,'Race','Reading Half, Wycombe 10k, London Marathon');

/*!40000 ALTER TABLE `perch2_shop_product_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_shop_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_shop_products`;

CREATE TABLE `perch2_shop_products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productCode` varchar(255) NOT NULL DEFAULT '',
  `productTitle` varchar(255) NOT NULL DEFAULT '',
  `productSlug` varchar(255) NOT NULL DEFAULT '',
  `productDescRaw` text,
  `productDescHTML` text,
  `productDynamicFields` text,
  `productStatus` enum('Live','Draft') NOT NULL DEFAULT 'Live',
  `productCount` int(10) DEFAULT NULL,
  `productPrice` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  FULLTEXT KEY `idx_search` (`productTitle`,`productDescRaw`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

LOCK TABLES `perch2_shop_products` WRITE;
/*!40000 ALTER TABLE `perch2_shop_products` DISABLE KEYS */;

INSERT INTO `perch2_shop_products` (`productID`, `productCode`, `productTitle`, `productSlug`, `productDescRaw`, `productDescHTML`, `productDynamicFields`, `productStatus`, `productCount`, `productPrice`)
VALUES
	(2,'NESTVEST1','Club Vest','club-vest','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','{\"productTitle\":\"Club Vest\",\"productImage\":{\"_default\":\"\\/perch\\/resources\\/img0259.jpg\",\"path\":\"img0259.jpg\",\"size\":169219,\"bucket\":\"default\",\"w\":1024,\"h\":683,\"sizes\":{\"thumb\":{\"w\":150,\"h\":100,\"path\":\"img0259-thumb.jpg\",\"size\":5155,\"mime\":\"image\\/jpeg\"},\"w600h600c1@2x\":{\"w\":600,\"h\":600,\"density\":\"2\",\"path\":\"img0259-w600h600@2x.jpg\",\"size\":159715,\"mime\":\"image\\/jpeg\"}}},\"productCode\":\"NESTVEST1\",\"productPrice\":\"24.99\"}','Live',20,24.99),
	(3,'MEDAL01','Fake Race Medal','fake-race-medal','Did you fail to finish a race, but need others to think you did? No problem! Pick up your fake race medal here.','<p>Did you fail to finish a race, but need others to think you did? No problem! Pick up your fake race medal here.</p>','{\"productTitle\":\"Fake Race Medal\",\"productImage\":{\"_default\":\"\\/perch\\/resources\\/dscf0729.jpg\",\"path\":\"dscf0729.jpg\",\"size\":131389,\"bucket\":\"default\",\"w\":1024,\"h\":768,\"sizes\":{\"thumb\":{\"w\":150,\"h\":112,\"path\":\"dscf0729-thumb.jpg\",\"size\":5886,\"mime\":\"image\\/jpeg\"},\"w600h600c1@2x\":{\"w\":600,\"h\":600,\"density\":\"2\",\"path\":\"dscf0729-w600h600@2x.jpg\",\"size\":210345,\"mime\":\"image\\/jpeg\"}}},\"productCode\":\"MEDAL01\",\"productPrice\":\"19.99\"}','Live',12,19.99);

/*!40000 ALTER TABLE `perch2_shop_products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_shop_products_to_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_shop_products_to_categories`;

CREATE TABLE `perch2_shop_products_to_categories` (
  `productID` int(11) NOT NULL DEFAULT '0',
  `categoryID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`productID`,`categoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

LOCK TABLES `perch2_shop_products_to_categories` WRITE;
/*!40000 ALTER TABLE `perch2_shop_products_to_categories` DISABLE KEYS */;

INSERT INTO `perch2_shop_products_to_categories` (`productID`, `categoryID`)
VALUES
	(2,1),
	(3,2);

/*!40000 ALTER TABLE `perch2_shop_products_to_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_user_privileges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_user_privileges`;

CREATE TABLE `perch2_user_privileges` (
  `privID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `privKey` varchar(255) NOT NULL DEFAULT '',
  `privTitle` varchar(255) NOT NULL DEFAULT '',
  `privOrder` int(10) unsigned NOT NULL DEFAULT '99',
  PRIMARY KEY (`privID`),
  UNIQUE KEY `idx_key` (`privKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_user_privileges` WRITE;
/*!40000 ALTER TABLE `perch2_user_privileges` DISABLE KEYS */;

INSERT INTO `perch2_user_privileges` (`privID`, `privKey`, `privTitle`, `privOrder`)
VALUES
	(1,'perch.login','Log in',1),
	(2,'perch.settings','Change settings',2),
	(3,'perch.users.manage','Manage users',3),
	(4,'perch.updatenotices','View update notices',4),
	(5,'content.regions.delete','Delete regions',1),
	(6,'content.regions.options','Edit region options',2),
	(7,'content.pages.edit','Edit page details',1),
	(8,'content.pages.reorder','Reorder pages',2),
	(9,'content.pages.create','Add new pages',3),
	(10,'content.pages.configure','Configure page settings',5),
	(11,'content.pages.delete','Delete pages',4),
	(12,'content.templates.delete','Delete master pages',6),
	(13,'content.navgroups.configure','Configure navigation groups',7),
	(14,'content.navgroups.create','Create navigation groups',8),
	(15,'content.navgroups.delete','Delete navigation groups',9),
	(16,'perch_events','Access events',1),
	(17,'perch_events.categories.manage','Manage categories',1),
	(18,'perch_blog','Access the blog',1),
	(19,'perch_blog.post.create','Create posts',1),
	(20,'perch_blog.post.delete','Delete posts',1),
	(21,'perch_blog.post.publish','Publish posts',1),
	(22,'perch_blog.comments.moderate','Moderate comments',1),
	(23,'perch_blog.comments.enable','Enable comments on a post',1),
	(24,'perch_blog.categories.manage','Manage categories',1),
	(25,'perch_blog.import','Import data',1),
	(26,'perch_blog.authors.manage','Manage authors',1),
	(27,'content.pages.republish','Republish pages',12),
	(28,'perch_gallery','Access the gallery',1),
	(29,'perch_gallery.album.create','Create albums',1),
	(30,'perch_gallery.image.upload','Upload images',1),
	(31,'perch_forms','Access forms',1),
	(32,'perch_forms.configure','Configure forms',1),
	(33,'perch_forms.delete','Delete forms',1),
	(34,'perch_shop','Access shop',1),
	(35,'perch_shop.categories.manage','Manage categories',1),
	(36,'perch_members','Manage members',1);

/*!40000 ALTER TABLE `perch2_user_privileges` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_user_role_privileges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_user_role_privileges`;

CREATE TABLE `perch2_user_role_privileges` (
  `roleID` int(10) unsigned NOT NULL,
  `privID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`roleID`,`privID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_user_role_privileges` WRITE;
/*!40000 ALTER TABLE `perch2_user_role_privileges` DISABLE KEYS */;

INSERT INTO `perch2_user_role_privileges` (`roleID`, `privID`)
VALUES
	(1,1),
	(1,7),
	(1,8),
	(2,1),
	(2,2),
	(2,3),
	(2,4),
	(2,5),
	(2,6),
	(2,7),
	(2,8),
	(2,9),
	(2,10),
	(2,11),
	(2,12);

/*!40000 ALTER TABLE `perch2_user_role_privileges` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_user_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_user_roles`;

CREATE TABLE `perch2_user_roles` (
  `roleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleTitle` varchar(255) NOT NULL DEFAULT '',
  `roleSlug` varchar(255) NOT NULL DEFAULT '',
  `roleMasterAdmin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_user_roles` WRITE;
/*!40000 ALTER TABLE `perch2_user_roles` DISABLE KEYS */;

INSERT INTO `perch2_user_roles` (`roleID`, `roleTitle`, `roleSlug`, `roleMasterAdmin`)
VALUES
	(1,'Editor','editor',0),
	(2,'Admin','admin',1);

/*!40000 ALTER TABLE `perch2_user_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table perch2_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `perch2_users`;

CREATE TABLE `perch2_users` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userUsername` varchar(255) NOT NULL DEFAULT '',
  `userPassword` varchar(255) NOT NULL DEFAULT '',
  `userCreated` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `userUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userLastLogin` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `userGivenName` varchar(255) NOT NULL DEFAULT '',
  `userFamilyName` varchar(255) NOT NULL DEFAULT '',
  `userEmail` varchar(255) NOT NULL DEFAULT '',
  `userEnabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userHash` char(32) NOT NULL DEFAULT '',
  `roleID` int(10) unsigned NOT NULL DEFAULT '1',
  `userMasterAdmin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`),
  KEY `idx_enabled` (`userEnabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `perch2_users` WRITE;
/*!40000 ALTER TABLE `perch2_users` DISABLE KEYS */;

INSERT INTO `perch2_users` (`userID`, `userUsername`, `userPassword`, `userCreated`, `userUpdated`, `userLastLogin`, `userGivenName`, `userFamilyName`, `userEmail`, `userEnabled`, `userHash`, `roleID`, `userMasterAdmin`)
VALUES
	(1,'{username}','{password}','2013-04-30 13:11:53','2013-06-23 10:48:29','2013-06-22 11:33:02','{firstname}','{lastname}','{email}',1,'241a2ce4d4b24a454cbc1da5b6d5fd6f',2,1);

/*!40000 ALTER TABLE `perch2_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
