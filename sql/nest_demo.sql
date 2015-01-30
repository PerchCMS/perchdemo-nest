-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_demo_nest
-- ------------------------------------------------------
-- Server version	5.5.41-0+wheezy1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `perch2_blog_authors`
--

DROP TABLE IF EXISTS `perch2_blog_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_blog_authors` (
  `authorID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorGivenName` varchar(255) NOT NULL DEFAULT '',
  `authorFamilyName` varchar(255) NOT NULL DEFAULT '',
  `authorEmail` varchar(255) NOT NULL DEFAULT '',
  `authorPostCount` int(10) unsigned NOT NULL DEFAULT '0',
  `authorSlug` varchar(255) NOT NULL DEFAULT '',
  `authorImportRef` varchar(64) DEFAULT NULL,
  `authorDynamicFields` text,
  PRIMARY KEY (`authorID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_blog_authors`
--

LOCK TABLES `perch2_blog_authors` WRITE;
/*!40000 ALTER TABLE `perch2_blog_authors` DISABLE KEYS */;
INSERT INTO `perch2_blog_authors` VALUES (1,'{firstname}','{lastname}','{email}',4,'{username}',NULL,NULL);
/*!40000 ALTER TABLE `perch2_blog_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_blog_categories`
--

DROP TABLE IF EXISTS `perch2_blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_blog_categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryTitle` varchar(255) NOT NULL DEFAULT '',
  `categorySlug` varchar(255) NOT NULL DEFAULT '',
  `categoryPostCount` int(10) unsigned NOT NULL DEFAULT '0',
  `categoryDynamicFields` text,
  `categoryCoreID` int(10) DEFAULT NULL,
  PRIMARY KEY (`categoryID`),
  KEY `idx_slug` (`categorySlug`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_blog_categories`
--

LOCK TABLES `perch2_blog_categories` WRITE;
/*!40000 ALTER TABLE `perch2_blog_categories` DISABLE KEYS */;
INSERT INTO `perch2_blog_categories` VALUES (1,'Events','events',2,NULL,1),(2,'News','news',1,NULL,2),(3,'Information for members','information',1,'{\"categoryTitle\":\"Information for members\",\"categorySlug\":\"information-for-members\"}',3);
/*!40000 ALTER TABLE `perch2_blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_blog_comments`
--

DROP TABLE IF EXISTS `perch2_blog_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_blog_comments`
--

LOCK TABLES `perch2_blog_comments` WRITE;
/*!40000 ALTER TABLE `perch2_blog_comments` DISABLE KEYS */;
INSERT INTO `perch2_blog_comments` VALUES (1,2,'Drew McLellan','hello@grabaperch.com','',2130706433,'2013-06-22 16:03:50','<p>Brilliant! Last year was so good, despite the calling problems. To be honest, I think that was mostly down to the caller not knowing their left from their right. But anyway, I&#8217;ll be contacting Jan for my tickets!</p>','LIVE','{\"fields\":{\"name\":\"Drew McLellan\",\"email\":\"hello@grabaperch.com\",\"body\":\"Brilliant! Last year was so good, despite the calling problems. To be honest, I think that was mostly down to the caller not knowing their left from their right. But anyway, I\'ll be contacting Jan for my tickets!\"},\"environment\":{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"perchdemo-nest.rocker.eoms\",\"HTTP_CONNECTION\":\"keep-alive\",\"CONTENT_LENGTH\":\"419\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"HTTP_ORIGIN\":\"http:\\/\\/perchdemo-nest.rocker.eoms\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/29.0.1545.0 Safari\\/537.36\",\"CONTENT_TYPE\":\"application\\/x-www-form-urlencoded\",\"HTTP_REFERER\":\"http:\\/\\/perchdemo-nest.rocker.eoms\\/blog\\/2-tickets-on-sale-for-july-social\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate,sdch\",\"HTTP_ACCEPT_LANGUAGE\":\"en-US,en;q=0.8\",\"HTTP_COOKIE\":\"mp_aca1134b1691f97fca23dd82df07fa8f_mixpanel=%7B%22distinct_id%22%3A%20%2213db1092e6c1-0a8cfd912-67570c2a-384000-13db1092e6e8e8%22%2C%22%24initial_referrer%22%3A%20%22%24direct%22%2C%22%24initial_referring_domain%22%3A%20%22%24direct%22%7D; p_m=e307daeb6227c520ad0dcd47447632bde214bbc9; PHPSESSID=0d85c260dc2acb5995b3eac6e8ed0d4b; cmssb=0\",\"PATH\":\"\\/usr\\/bin:\\/bin:\\/usr\\/sbin:\\/sbin\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"perchdemo-nest.rocker.eoms\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\",\"SERVER_ADMIN\":\"you@example.com\",\"SCRIPT_FILENAME\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\\/blog\\/post.php\",\"REMOTE_PORT\":\"58975\",\"REDIRECT_QUERY_STRING\":\"s=2-tickets-on-sale-for-july-social\",\"REDIRECT_URL\":\"\\/blog\\/2-tickets-on-sale-for-july-social\\/\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"POST\",\"QUERY_STRING\":\"s=2-tickets-on-sale-for-july-social\",\"REQUEST_URI\":\"\\/blog\\/2-tickets-on-sale-for-july-social\\/\",\"SCRIPT_NAME\":\"\\/blog\\/post.php\",\"PHP_SELF\":\"\\/blog\\/post.php\",\"REQUEST_TIME_FLOAT\":1371913430.75,\"REQUEST_TIME\":1371913430,\"argv\":[\"s=2-tickets-on-sale-for-july-social\"],\"argc\":1}}','{\"submitComment\":\"Submit\"}'),(2,4,'Drew McLellan','hello@grabaperch.com','',2130706433,'2013-06-22 16:04:20','<p>Well done, {firstname}! You&#8217;re very brave.</p>','LIVE','{\"fields\":{\"name\":\"Drew McLellan\",\"email\":\"hello@grabaperch.com\",\"body\":\"Well done, {firstname}! You\'re very brave.\"},\"environment\":{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"perchdemo-nest.rocker.eoms\",\"HTTP_CONNECTION\":\"keep-alive\",\"CONTENT_LENGTH\":\"247\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"HTTP_ORIGIN\":\"http:\\/\\/perchdemo-nest.rocker.eoms\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/29.0.1545.0 Safari\\/537.36\",\"CONTENT_TYPE\":\"application\\/x-www-form-urlencoded\",\"HTTP_REFERER\":\"http:\\/\\/perchdemo-nest.rocker.eoms\\/blog\\/4-meet-our-new-chairman\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate,sdch\",\"HTTP_ACCEPT_LANGUAGE\":\"en-US,en;q=0.8\",\"HTTP_COOKIE\":\"mp_aca1134b1691f97fca23dd82df07fa8f_mixpanel=%7B%22distinct_id%22%3A%20%2213db1092e6c1-0a8cfd912-67570c2a-384000-13db1092e6e8e8%22%2C%22%24initial_referrer%22%3A%20%22%24direct%22%2C%22%24initial_referring_domain%22%3A%20%22%24direct%22%7D; p_m=e307daeb6227c520ad0dcd47447632bde214bbc9; PHPSESSID=0d85c260dc2acb5995b3eac6e8ed0d4b; cmssb=0\",\"PATH\":\"\\/usr\\/bin:\\/bin:\\/usr\\/sbin:\\/sbin\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"perchdemo-nest.rocker.eoms\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\",\"SERVER_ADMIN\":\"you@example.com\",\"SCRIPT_FILENAME\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\\/blog\\/post.php\",\"REMOTE_PORT\":\"58991\",\"REDIRECT_QUERY_STRING\":\"s=4-meet-our-new-chairman\",\"REDIRECT_URL\":\"\\/blog\\/4-meet-our-new-chairman\\/\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"POST\",\"QUERY_STRING\":\"s=4-meet-our-new-chairman\",\"REQUEST_URI\":\"\\/blog\\/4-meet-our-new-chairman\\/\",\"SCRIPT_NAME\":\"\\/blog\\/post.php\",\"PHP_SELF\":\"\\/blog\\/post.php\",\"REQUEST_TIME_FLOAT\":1371913460.37,\"REQUEST_TIME\":1371913460,\"argv\":[\"s=4-meet-our-new-chairman\"],\"argc\":1}}','{\"submitComment\":\"Submit\"}');
/*!40000 ALTER TABLE `perch2_blog_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_blog_index`
--

DROP TABLE IF EXISTS `perch2_blog_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_blog_index` (
  `indexID` int(10) NOT NULL AUTO_INCREMENT,
  `itemKey` char(64) NOT NULL DEFAULT '-',
  `itemID` int(10) NOT NULL DEFAULT '0',
  `indexKey` char(64) NOT NULL DEFAULT '-',
  `indexValue` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`indexID`),
  KEY `idx_fk` (`itemKey`,`itemID`),
  KEY `idx_key` (`indexKey`),
  KEY `idx_key_val` (`indexKey`,`indexValue`),
  KEY `idx_keys` (`itemKey`,`indexKey`)
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_blog_index`
--

LOCK TABLES `perch2_blog_index` WRITE;
/*!40000 ALTER TABLE `perch2_blog_index` DISABLE KEYS */;
INSERT INTO `perch2_blog_index` VALUES (163,'postID',2,'_id','2'),(162,'postID',2,'postURL','/blog/2-tickets-on-sale-for-july-social/'),(161,'postID',2,'perch_image_h','683'),(160,'postID',2,'perch_image_w','1024'),(159,'postID',2,'perch_image_bucket','default'),(158,'postID',2,'perch_image_size','192464'),(157,'postID',2,'perch_image_path','img0306-1.jpg'),(156,'postID',2,'perch_image__default','/perch/resources/img0306-1.jpg'),(155,'postID',2,'perch_image','/perch/resources/img0306-1.jpg'),(154,'postID',2,'perch_categories_0','1'),(153,'postID',2,'perch_excerpt_processed','<p>Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We&#8217;ve learned our lesson f'),(152,'postID',2,'perch_excerpt_raw','Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We\'ve learned our lesson from last'),(151,'postID',2,'perch_excerpt','<p>Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We&#8217;ve learned our lesson f'),(150,'postID',2,'cat_ids_0','1'),(149,'postID',2,'postTemplate','post.html'),(148,'postID',2,'postAllowComments','1'),(147,'postID',2,'postLegacyURL',''),(146,'postID',2,'postImportID',''),(145,'postID',2,'postCommentCount','1'),(144,'postID',2,'sectionID','1'),(143,'postID',2,'authorID','1'),(142,'postID',2,'postStatus','Published'),(141,'postID',2,'postTags',''),(140,'postID',2,'postDynamicFields','{\"excerpt\":{\"raw\":\"Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We\'ve learned ou'),(139,'postID',2,'postDescHTML','<p>Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We&#8217;ve learned our lesson f'),(138,'postID',2,'postDescRaw','Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We\'ve learned our lesson from last'),(137,'postID',2,'postDateTime','2013-05-28'),(136,'postID',2,'postSlug','2-tickets-on-sale-for-july-social'),(135,'postID',2,'postTitle','Tickets on sale for July Social'),(134,'postID',2,'postID','2'),(133,'postID',2,'image_h','683'),(132,'postID',2,'image_w','1024'),(131,'postID',2,'image_bucket','default'),(130,'postID',2,'image_size','192464'),(129,'postID',2,'image_path','img0306-1.jpg'),(128,'postID',2,'image__default','/perch/resources/img0306-1.jpg'),(127,'postID',2,'image','/perch/resources/img0306-1.jpg'),(126,'postID',2,'_category','blog/events/'),(125,'postID',2,'excerpt_processed','<p>Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We&#8217;ve learned our lesson f'),(124,'postID',2,'excerpt_raw','Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We\'ve learned our lesson from last'),(123,'postID',2,'excerpt','<p>Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We&#8217;ve learned our lesson f'),(190,'postID',4,'_id','4'),(189,'postID',4,'postURL','/blog/4-meet-our-new-chairman/'),(188,'postID',4,'perch_categories_0','2'),(187,'postID',4,'perch_excerpt_processed','<p>The committee is pleased to announce that <span class=\"caps\">REPLACE</span>_firstname <span class=\"caps\">REPLACE</span>_lastname has been voted as our new chairman, almost unanimously.</p>'),(186,'postID',4,'perch_excerpt_raw','The committee is pleased to announce that {firstname} {lastname} has been voted as our new chairman, almost unanimously.'),(185,'postID',4,'perch_excerpt','<p>The committee is pleased to announce that <span class=\"caps\">REPLACE</span>_firstname <span class=\"caps\">REPLACE</span>_lastname has been voted as our new chairman, almost unanimously.</p>'),(184,'postID',4,'cat_ids_0','2'),(183,'postID',4,'postTemplate','post.html'),(182,'postID',4,'postAllowComments','1'),(181,'postID',4,'postLegacyURL',''),(180,'postID',4,'postImportID',''),(179,'postID',4,'postCommentCount','1'),(178,'postID',4,'sectionID','1'),(177,'postID',4,'authorID','1'),(176,'postID',4,'postStatus','Published'),(175,'postID',4,'postTags',''),(174,'postID',4,'postDynamicFields','{\"excerpt\":{\"raw\":\"The committee is pleased to announce that {firstname} {lastname} has been voted as our new chairman, almost unanimously.\",\"processed\":\"<p>The committee is pleased to announce that <span class=\\\"caps\\\">REPLACE<\\/span>_firstna'),(173,'postID',4,'postDescHTML','<p>The committee is pleased to announce that <strong><span class=\"caps\">REPLACE</span>_firstname <span class=\"caps\">REPLACE</span>_lastname</strong> has been voted as our new chairman. The result was almost unanimous, and the only abstention was due to Ga'),(172,'postID',4,'postDescRaw','The committee is pleased to announce that *{firstname} {lastname}* has been voted as our new chairman. The result was almost unanimous, and the only abstention was due to Gavin still maintaining that it was {firstname} who scratched his'),(171,'postID',4,'postDateTime','2013-05-22'),(170,'postID',4,'postSlug','4-meet-our-new-chairman'),(169,'postID',4,'postTitle','Meet our new chairman!'),(168,'postID',4,'postID','4'),(167,'postID',4,'_category','blog/news/'),(166,'postID',4,'excerpt_processed','<p>The committee is pleased to announce that <span class=\"caps\">REPLACE</span>_firstname <span class=\"caps\">REPLACE</span>_lastname has been voted as our new chairman, almost unanimously.</p>'),(165,'postID',4,'excerpt_raw','The committee is pleased to announce that {firstname} {lastname} has been voted as our new chairman, almost unanimously.'),(164,'postID',4,'excerpt','<p>The committee is pleased to announce that <span class=\"caps\">REPLACE</span>_firstname <span class=\"caps\">REPLACE</span>_lastname has been voted as our new chairman, almost unanimously.</p>'),(217,'postID',1,'_id','1'),(216,'postID',1,'postURL','/blog/1-next-race-is-23rd-july/'),(215,'postID',1,'perch_categories_0','1'),(214,'postID',1,'perch_excerpt_processed','<p>Our next club race is 23rd July; it&#8217;s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It&#8217;s going to be a lot of fun.</p>'),(213,'postID',1,'perch_excerpt_raw','Our next club race is 23rd July; it\'s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It\'s going to be a lot of fun.'),(212,'postID',1,'perch_excerpt','<p>Our next club race is 23rd July; it&#8217;s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It&#8217;s going to be a lot of fun.</p>'),(211,'postID',1,'cat_ids_0','1'),(210,'postID',1,'postTemplate','post.html'),(209,'postID',1,'postAllowComments','1'),(208,'postID',1,'postLegacyURL',''),(207,'postID',1,'postImportID',''),(206,'postID',1,'postCommentCount','0'),(205,'postID',1,'sectionID','1'),(204,'postID',1,'authorID','1'),(203,'postID',1,'postStatus','Published'),(202,'postID',1,'postTags',''),(201,'postID',1,'postDynamicFields','{\"excerpt\":{\"raw\":\"Our next club race is 23rd July; it\'s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It\'s going to be a lot of fun.\",\"processed\":\"<p>Our next club race is 23rd July; it&#8217;s t'),(200,'postID',1,'postDescHTML','<p>Our next club race is 23rd July; it&#8217;s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It&#8217;s going to be a lot of fun.</p>\n\n<p>Parking on the day will be restricted, as a new parking su'),(199,'postID',1,'postDescRaw','Our next club race is 23rd July; it\'s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It\'s going to be a lot of fun.\r\n\r\nParking on the day will be restricted, as a new parking surface is being laid'),(198,'postID',1,'postDateTime','2013-05-03'),(197,'postID',1,'postSlug','1-next-race-is-23rd-july'),(196,'postID',1,'postTitle','Next race is 23rd July'),(195,'postID',1,'postID','1'),(194,'postID',1,'_category','blog/events/'),(193,'postID',1,'excerpt_processed','<p>Our next club race is 23rd July; it&#8217;s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It&#8217;s going to be a lot of fun.</p>'),(192,'postID',1,'excerpt_raw','Our next club race is 23rd July; it\'s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It\'s going to be a lot of fun.'),(191,'postID',1,'excerpt','<p>Our next club race is 23rd July; it&#8217;s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It&#8217;s going to be a lot of fun.</p>'),(244,'postID',3,'_id','3'),(243,'postID',3,'postURL','/blog/3-clubhouse-rules/'),(242,'postID',3,'perch_categories_0','3'),(241,'postID',3,'perch_excerpt_processed','<p>It&#8217;s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.</p>'),(240,'postID',3,'perch_excerpt_raw','It\'s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.'),(239,'postID',3,'perch_excerpt','<p>It&#8217;s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.</p>'),(238,'postID',3,'cat_ids_0','3'),(237,'postID',3,'postTemplate','post.html'),(236,'postID',3,'postAllowComments','1'),(235,'postID',3,'postLegacyURL',''),(234,'postID',3,'postImportID',''),(233,'postID',3,'postCommentCount','0'),(232,'postID',3,'sectionID','1'),(231,'postID',3,'authorID','1'),(230,'postID',3,'postStatus','Published'),(229,'postID',3,'postTags','clubhouse, rules'),(228,'postID',3,'postDynamicFields','{\"excerpt\":{\"raw\":\"It\'s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.\",\"processed\":\"<p>It&#8217;s been suggested that we publish the clubhouse rules (or house rules'),(227,'postID',3,'postDescHTML','<p>Or should that be Clubhouse House Rules? I&#8217;m not sure, but it&#8217;s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.</p>\n\n<h2>These are The Rules</h2>\n\n<ol>'),(226,'postID',3,'postDescRaw','Or should that be Clubhouse House Rules? I\'m not sure, but it\'s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.\r\n\r\nh2. These are The Rules\r\n\r\n# *No ball games.* Ha ha'),(225,'postID',3,'postDateTime','2012-06-22'),(224,'postID',3,'postSlug','3-clubhouse-rules'),(223,'postID',3,'postTitle','Clubhouse Rules'),(222,'postID',3,'postID','3'),(221,'postID',3,'_category','blog/information/'),(220,'postID',3,'excerpt_processed','<p>It&#8217;s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.</p>'),(219,'postID',3,'excerpt_raw','It\'s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.'),(218,'postID',3,'excerpt','<p>It&#8217;s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.</p>');
/*!40000 ALTER TABLE `perch2_blog_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_blog_posts`
--

DROP TABLE IF EXISTS `perch2_blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `sectionID` int(10) unsigned NOT NULL DEFAULT '1',
  `postCommentCount` int(10) unsigned NOT NULL DEFAULT '0',
  `postImportID` varchar(64) DEFAULT NULL,
  `postLegacyURL` varchar(255) DEFAULT NULL,
  `postAllowComments` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `postTemplate` varchar(255) NOT NULL DEFAULT 'post.html',
  PRIMARY KEY (`postID`),
  KEY `idx_date` (`postDateTime`),
  FULLTEXT KEY `idx_search` (`postTitle`,`postDescRaw`,`postTags`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_blog_posts`
--

LOCK TABLES `perch2_blog_posts` WRITE;
/*!40000 ALTER TABLE `perch2_blog_posts` DISABLE KEYS */;
INSERT INTO `perch2_blog_posts` VALUES (1,'Next race is 23rd July','1-next-race-is-23rd-july','2013-05-03 00:00:00','Our next club race is 23rd July; it\'s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It\'s going to be a lot of fun.\r\n\r\nParking on the day will be restricted, as a new parking surface is being laid that weekend. Just bad timing, I\'m afraid. Fortunately, local company Data Networks has said we can use their car park. To apply for a pass, email event organiser Sandra at \"sandra@nestrunning.com\":mailto:sandra@nestrunning.com with your car registration plate. Passes are free, but we need to keep track of which cars are allowed into the car park for insurance reasons.\r\n\r\nThere are no on-site changing facilities, but Ann says she\'s got a changing tent you can borrow if you need it.','<p>Our next club race is 23rd July; it&#8217;s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It&#8217;s going to be a lot of fun.</p>\n\n<p>Parking on the day will be restricted, as a new parking surface is being laid that weekend. Just bad timing, I&#8217;m afraid. Fortunately, local company Data Networks has said we can use their car park. To apply for a pass, email event organiser Sandra at <a href=\"mailto:sandra@nestrunning.com\">sandra@nestrunning.com</a> with your car registration plate. Passes are free, but we need to keep track of which cars are allowed into the car park for insurance reasons.</p>\n\n<p>There are no on-site changing facilities, but Ann says she&#8217;s got a changing tent you can borrow if you need it.</p>','{\"excerpt\":{\"raw\":\"Our next club race is 23rd July; it\'s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It\'s going to be a lot of fun.\",\"processed\":\"<p>Our next club race is 23rd July; it&#8217;s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It&#8217;s going to be a lot of fun.<\\/p>\"},\"categories\":[\"1\"]}','','Published',1,1,0,NULL,NULL,1,'post.html'),(2,'Tickets on sale for July Social','2-tickets-on-sale-for-july-social','2013-05-28 00:00:00','Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We\'ve learned our lesson from last year, and we won\'t be trying to do the calling ourselves.\r\n\r\nContact Jan for tickets - she\'s got, like, loads. It\'s a barn.\r\n\r\nA ploughman\'s dinner will be served with cheese for vegetarians and pâté _and_ cheese for everyone else. Us non-vegetarians need to keep our strength up. Local ale will be on tap to help with the dancing. Children are recommended to wear cycle helmets for their own safety.','<p>Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We&#8217;ve learned our lesson from last year, and we won&#8217;t be trying to do the calling ourselves.</p>\n\n<p>Contact Jan for tickets &#8211; she&#8217;s got, like, loads. It&#8217;s a barn.</p>\n\n<p>A ploughman&#8217;s dinner will be served with cheese for vegetarians and pâté <em>and</em> cheese for everyone else. Us non-vegetarians need to keep our strength up. Local ale will be on tap to help with the dancing. Children are recommended to wear cycle helmets for their own safety.</p>','{\"excerpt\":{\"raw\":\"Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We\'ve learned our lesson from last year, and we won\'t be trying to do the calling ourselves.\",\"processed\":\"<p>Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Giles once again. There will be a barn dance with live band and an expert caller. We&#8217;ve learned our lesson from last year, and we won&#8217;t be trying to do the calling ourselves.<\\/p>\"},\"categories\":[\"1\"],\"image\":{\"_default\":\"\\/perch\\/resources\\/img0306-1.jpg\",\"path\":\"img0306-1.jpg\",\"size\":192464,\"bucket\":\"default\",\"w\":1024,\"h\":683,\"sizes\":{\"thumb\":{\"w\":150,\"h\":100,\"path\":\"img0306-1-thumb.jpg\",\"size\":6767,\"mime\":\"image\\/jpeg\"},\"w500hc0\":{\"w\":500,\"h\":333,\"density\":\"1\",\"path\":\"img0306-1-w500.jpg\",\"size\":37127,\"mime\":\"image\\/jpeg\"},\"w140h140c1@2x\":{\"w\":140,\"h\":140,\"density\":\"2\",\"path\":\"img0306-1-w140h140@2x.jpg\",\"size\":19671,\"mime\":\"image\\/jpeg\"}}}}','','Published',1,1,1,NULL,NULL,1,'post.html'),(3,'Clubhouse Rules','3-clubhouse-rules','2012-06-22 00:00:00','Or should that be Clubhouse House Rules? I\'m not sure, but it\'s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.\r\n\r\nh2. These are The Rules\r\n\r\n# *No ball games.* Ha ha! No, seriously. No ball games. The walls are really thin and will dent if hit by a ball or a knee.\r\n# *Wipe your feet.* We understand that you may be tired having just run a half-marathon through the woods, but _please_ remember to wipe your feet as you enter the clubhouse. On that note...\r\n# *Clean up after yourself.* The club does not employ a cleaner. A volunteer team come in one day a month to give everything a good once-over, but otherwise it\'s up to _you_ to clean up _your mess_. It would really help to remind each other, and if you see a mess with no culprit in sight, please be neighbourly and help by cleaning it up.\r\n# *The keyholder is boss!* Whoever unlocks the clubhouse is responsible for the clubhouse and those within it for that session. Therefore, they\'re in charge and what they says goes. Please respect their authority and do as you\'re jolly well told.\r\n# *No smoking.* And that means smoking _of any kind_. You know who you are. There\'s a covered area outside the porch for _legal_ smoking if you really think that\'s a good idea before your run.\r\n# *No advertising on the club notice board.* The notice board is for club notices only. Please do not post business cards plying your trades or, err, _services_ here. This is not the place. There is a phone booth across the road outside the rugby club.','<p>Or should that be Clubhouse House Rules? I&#8217;m not sure, but it&#8217;s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.</p>\n\n<h2>These are The Rules</h2>\n\n<ol>\n	<li><strong>No ball games.</strong> Ha ha! No, seriously. No ball games. The walls are really thin and will dent if hit by a ball or a knee.</li>\n	<li><strong>Wipe your feet.</strong> We understand that you may be tired having just run a half-marathon through the woods, but <em>please</em> remember to wipe your feet as you enter the clubhouse. On that note&#8230;</li>\n	<li><strong>Clean up after yourself.</strong> The club does not employ a cleaner. A volunteer team come in one day a month to give everything a good once-over, but otherwise it&#8217;s up to <em>you</em> to clean up <em>your mess</em>. It would really help to remind each other, and if you see a mess with no culprit in sight, please be neighbourly and help by cleaning it up.</li>\n	<li><strong>The keyholder is boss!</strong> Whoever unlocks the clubhouse is responsible for the clubhouse and those within it for that session. Therefore, they&#8217;re in charge and what they says goes. Please respect their authority and do as you&#8217;re jolly well told.</li>\n	<li><strong>No smoking.</strong> And that means smoking <em>of any kind</em>. You know who you are. There&#8217;s a covered area outside the porch for <em>legal</em> smoking if you really think that&#8217;s a good idea before your run.</li>\n	<li><strong>No advertising on the club notice board.</strong> The notice board is for club notices only. Please do not post business cards plying your trades or, err, <em>services</em> here. This is not the place. There is a phone booth across the road outside the rugby club.</li>\n</ol>','{\"excerpt\":{\"raw\":\"It\'s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.\",\"processed\":\"<p>It&#8217;s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.<\\/p>\"},\"categories\":[\"3\"]}','clubhouse, rules','Published',1,1,0,NULL,NULL,1,'post.html'),(4,'Meet our new chairman!','4-meet-our-new-chairman','2013-05-22 00:00:00','The committee is pleased to announce that *{firstname} {lastname}* has been voted as our new chairman. The result was almost unanimous, and the only abstention was due to Gavin still maintaining that it was {firstname} who scratched his car outside the clubhouse last year, despite the complete lack of evidence. \r\n\r\nWe all know {firstname} was out marathon training at the time and couldn\'t possibly have been involved. Anyway, that\'s by the by.\r\n\r\n{firstname} will serve a two-year term as club chairman (or should we say _chairperson_ these days? I\'m never sure) until the next elections following our centenary year!\r\n\r\nWe thank {firstname} for standing and being willing to take on such an unruly club.','<p>The committee is pleased to announce that <strong><span class=\"caps\">REPLACE</span>_firstname <span class=\"caps\">REPLACE</span>_lastname</strong> has been voted as our new chairman. The result was almost unanimous, and the only abstention was due to Gavin still maintaining that it was <span class=\"caps\">REPLACE</span>_firstname who scratched his car outside the clubhouse last year, despite the complete lack of evidence. </p>\n\n<p>We all know <span class=\"caps\">REPLACE</span>_firstname was out marathon training at the time and couldn&#8217;t possibly have been involved. Anyway, that&#8217;s by the by.</p>\n\n<p><span class=\"caps\">REPLACE</span>_firstname will serve a two-year term as club chairman (or should we say <em>chairperson</em> these days? I&#8217;m never sure) until the next elections following our centenary year!</p>\n\n<p>We thank <span class=\"caps\">REPLACE</span>_firstname for standing and being willing to take on such an unruly club.</p>','{\"excerpt\":{\"raw\":\"The committee is pleased to announce that {firstname} {lastname} has been voted as our new chairman, almost unanimously.\",\"processed\":\"<p>The committee is pleased to announce that <span class=\\\"caps\\\">REPLACE<\\/span>_firstname <span class=\\\"caps\\\">REPLACE<\\/span>_lastname has been voted as our new chairman, almost unanimously.<\\/p>\"},\"categories\":[\"2\"]}','','Published',1,1,1,NULL,NULL,1,'post.html');
/*!40000 ALTER TABLE `perch2_blog_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_blog_posts_to_categories`
--

DROP TABLE IF EXISTS `perch2_blog_posts_to_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_blog_posts_to_categories` (
  `postID` int(11) NOT NULL DEFAULT '0',
  `categoryID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`postID`,`categoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_blog_posts_to_categories`
--

LOCK TABLES `perch2_blog_posts_to_categories` WRITE;
/*!40000 ALTER TABLE `perch2_blog_posts_to_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_blog_posts_to_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_blog_posts_to_tags`
--

DROP TABLE IF EXISTS `perch2_blog_posts_to_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_blog_posts_to_tags` (
  `postID` int(11) NOT NULL DEFAULT '0',
  `tagID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`postID`,`tagID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_blog_posts_to_tags`
--

LOCK TABLES `perch2_blog_posts_to_tags` WRITE;
/*!40000 ALTER TABLE `perch2_blog_posts_to_tags` DISABLE KEYS */;
INSERT INTO `perch2_blog_posts_to_tags` VALUES (3,1),(3,2);
/*!40000 ALTER TABLE `perch2_blog_posts_to_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_blog_sections`
--

DROP TABLE IF EXISTS `perch2_blog_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_blog_sections` (
  `sectionID` int(11) NOT NULL AUTO_INCREMENT,
  `sectionTitle` varchar(255) NOT NULL DEFAULT '',
  `sectionSlug` varchar(255) NOT NULL DEFAULT '',
  `sectionPostCount` int(10) unsigned NOT NULL DEFAULT '0',
  `sectionDynamicFields` text,
  PRIMARY KEY (`sectionID`),
  KEY `idx_slug` (`sectionSlug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_blog_sections`
--

LOCK TABLES `perch2_blog_sections` WRITE;
/*!40000 ALTER TABLE `perch2_blog_sections` DISABLE KEYS */;
INSERT INTO `perch2_blog_sections` VALUES (1,'Posts','posts',4,'');
/*!40000 ALTER TABLE `perch2_blog_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_blog_tags`
--

DROP TABLE IF EXISTS `perch2_blog_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_blog_tags` (
  `tagID` int(11) NOT NULL AUTO_INCREMENT,
  `tagTitle` varchar(255) NOT NULL DEFAULT '',
  `tagSlug` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tagID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_blog_tags`
--

LOCK TABLES `perch2_blog_tags` WRITE;
/*!40000 ALTER TABLE `perch2_blog_tags` DISABLE KEYS */;
INSERT INTO `perch2_blog_tags` VALUES (1,'clubhouse','clubhouse'),(2,'rules','rules');
/*!40000 ALTER TABLE `perch2_blog_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_categories`
--

DROP TABLE IF EXISTS `perch2_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_categories` (
  `catID` int(10) NOT NULL AUTO_INCREMENT,
  `setID` int(10) unsigned NOT NULL,
  `catParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `catTitle` char(64) NOT NULL DEFAULT '',
  `catSlug` char(64) NOT NULL DEFAULT '',
  `catPath` char(255) NOT NULL DEFAULT '',
  `catDisplayPath` char(255) NOT NULL DEFAULT '',
  `catOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `catTreePosition` char(255) NOT NULL DEFAULT '000',
  `catDynamicFields` text NOT NULL,
  PRIMARY KEY (`catID`),
  KEY `idx_set` (`setID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_categories`
--

LOCK TABLES `perch2_categories` WRITE;
/*!40000 ALTER TABLE `perch2_categories` DISABLE KEYS */;
INSERT INTO `perch2_categories` VALUES (1,1,0,'Events','events','blog/events/','Events',1,'001-001','[]'),(2,1,0,'News','news','blog/news/','News',2,'001-002','[]'),(3,1,0,'Information for members','information','blog/information/','Information for members',3,'001-003','{\"categoryTitle\":\"Information for members\",\"categorySlug\":\"information-for-members\"}');
/*!40000 ALTER TABLE `perch2_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_category_counts`
--

DROP TABLE IF EXISTS `perch2_category_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_category_counts` (
  `countID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catID` int(10) unsigned NOT NULL,
  `countType` char(64) NOT NULL DEFAULT '',
  `countValue` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`countID`),
  KEY `idx_cat` (`catID`),
  KEY `idx_cat_type` (`countType`,`catID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_category_counts`
--

LOCK TABLES `perch2_category_counts` WRITE;
/*!40000 ALTER TABLE `perch2_category_counts` DISABLE KEYS */;
INSERT INTO `perch2_category_counts` VALUES (6,1,'blog.post',2),(8,2,'blog.post',1),(7,3,'blog.post',1);
/*!40000 ALTER TABLE `perch2_category_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_category_sets`
--

DROP TABLE IF EXISTS `perch2_category_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_category_sets` (
  `setID` int(10) NOT NULL AUTO_INCREMENT,
  `setTitle` char(64) NOT NULL DEFAULT '',
  `setSlug` char(64) NOT NULL DEFAULT '',
  `setTemplate` char(255) NOT NULL DEFAULT 'set.html',
  `setCatTemplate` char(255) NOT NULL DEFAULT 'category.html',
  `setDynamicFields` text,
  PRIMARY KEY (`setID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_category_sets`
--

LOCK TABLES `perch2_category_sets` WRITE;
/*!40000 ALTER TABLE `perch2_category_sets` DISABLE KEYS */;
INSERT INTO `perch2_category_sets` VALUES (1,'Blog','blog','set.html','category.html','[]');
/*!40000 ALTER TABLE `perch2_category_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_content_index`
--

DROP TABLE IF EXISTS `perch2_content_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=385 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_content_index`
--

LOCK TABLES `perch2_content_index` WRITE;
/*!40000 ALTER TABLE `perch2_content_index` DISABLE KEYS */;
INSERT INTO `perch2_content_index` VALUES (295,1,1,1,5,'_order','1000'),(294,1,1,1,5,'_id','1'),(293,1,1,1,5,'cta','Request an invitation'),(292,1,1,1,5,'desc_processed','<p>Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!</p>'),(291,1,1,1,5,'desc_raw','Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!'),(290,1,1,1,5,'desc','<p>Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!</p>'),(289,1,1,1,5,'title','Become a member'),(304,3,3,1,3,'_order','1000'),(303,3,3,1,3,'_id','3'),(302,3,3,1,3,'image_h','350'),(301,3,3,1,3,'image_w','1200'),(300,3,3,1,3,'image_bucket','default'),(299,3,3,1,3,'image_size','34130'),(298,3,3,1,3,'image_path','home-banner.jpg'),(297,3,3,1,3,'image__default','/perch/resources/home-banner.jpg'),(296,3,3,1,3,'image','/perch/resources/home-banner.jpg'),(308,16,6,1,1,'_order','1000'),(307,16,6,1,1,'_id','16'),(306,16,6,1,1,'strapline','Run for your life'),(305,16,6,1,1,'site_name','Nest Running Club'),(312,2,2,1,4,'_order','1000'),(311,2,2,1,4,'_id','2'),(310,2,2,1,4,'facebook','grabaperch'),(309,2,2,1,4,'twitter','grabaperch'),(317,7,9,12,2,'_order','1000'),(316,7,9,12,2,'_id','7'),(315,7,9,12,2,'text_processed','<h1>Register today</h1>\n\n<p>Nest running club members should already have their membership details, but if you&#8217;re new to the club you can sign up here.</p>\n\n<p>Members get access to information such as personal contact information that we&#8217;d ra'),(314,7,9,12,2,'text_raw','h1. Register today\r\n\r\nNest running club members should already have their membership details, but if you\'re new to the club you can sign up here.\r\n\r\nMembers get access to information such as personal contact information that we\'d rather not have freely av'),(313,7,9,12,2,'text','<h1>Register today</h1>\n\n<p>Nest running club members should already have their membership details, but if you&#8217;re new to the club you can sign up here.</p>\n\n<p>Members get access to information such as personal contact information that we&#8217;d ra'),(330,5,7,2,16,'_order','1000'),(329,5,7,2,16,'_id','5'),(328,5,7,2,16,'body_processed','<p>Hello, we&#8217;re <strong>Nest</strong> &#8212; a local running club for local people who like to run, locally. We&#8217;re really friendly and always welcome new members, as long as you&#8217;re local. So if you&#8217;re a local person who likes to r'),(327,5,7,2,16,'body_raw','Hello, we\'re *Nest* -- a local running club for local people who like to run, locally. We\'re really friendly and always welcome new members, as long as you\'re local. So if you\'re a local person who likes to run locally, pop along for a taster session. The'),(326,5,7,2,16,'body','<p>Hello, we&#8217;re <strong>Nest</strong> &#8212; a local running club for local people who like to run, locally. We&#8217;re really friendly and always welcome new members, as long as you&#8217;re local. So if you&#8217;re a local person who likes to r'),(325,5,7,2,16,'image_h','683'),(324,5,7,2,16,'image_w','1024'),(323,5,7,2,16,'image_bucket','default'),(322,5,7,2,16,'image_size','207516'),(321,5,7,2,16,'image_path','img1069-2.jpg'),(320,5,7,2,16,'image__default','/perch/resources/img1069-2.jpg'),(319,5,7,2,16,'image','/perch/resources/img1069-2.jpg'),(318,5,7,2,16,'heading','Who are we?'),(339,6,8,7,6,'_order','1000'),(338,6,8,7,6,'_id','6'),(337,6,8,7,6,'success_processed','<h1>Thank you!</h1>\n\n<p>Thanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running!</p>'),(336,6,8,7,6,'success_raw','h1. Thank you!\r\n\r\nThanks for dropping us a line. We\'ll be in touch with a response shortly. Happy running!'),(335,6,8,7,6,'success','<h1>Thank you!</h1>\n\n<p>Thanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running!</p>'),(334,6,8,7,6,'intro_processed',''),(333,6,8,7,6,'intro_raw',''),(332,6,8,7,6,'intro',''),(331,6,8,7,6,'heading','Send us a message'),(344,8,10,14,3,'_order','1000'),(343,8,10,14,3,'_id','8'),(342,8,10,14,3,'text_processed','<h2>Get a new password</h2>\n\n<p>Have you forgotten your password? You idiot! We can&#8217;t remind you of your old password (it&#8217;s stored in a secure way that means we can&#8217;t retrieve it) but we can send you a new one.</p>\n\n<p>If you&#8217;re al'),(341,8,10,14,3,'text_raw','h2. Get a new password\r\n\r\nHave you forgotten your password? You idiot! We can\'t remind you of your old password (it\'s stored in a secure way that means we can\'t retrieve it) but we can send you a new one.\r\n\r\nIf you\'re already registered, enter your email'),(340,8,10,14,3,'text','<h2>Get a new password</h2>\n\n<p>Have you forgotten your password? You idiot! We can&#8217;t remind you of your old password (it&#8217;s stored in a secure way that means we can&#8217;t retrieve it) but we can send you a new one.</p>\n\n<p>If you&#8217;re al'),(349,9,11,10,4,'_order','1000'),(348,9,11,10,4,'_id','9'),(347,9,11,10,4,'text_processed','<h1>Member login</h1>\n\n<p>The restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.</p>\n\n<p>If you&#8217;re a member but don&#8217;t yet have a website account, the you need'),(346,9,11,10,4,'text_raw','h1. Member login\r\n\r\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\r\n\r\nIf you\'re a member but don\'t yet have a website account, the you need to \"register\":/members'),(345,9,11,10,4,'text','<h1>Member login</h1>\n\n<p>The restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.</p>\n\n<p>If you&#8217;re a member but don&#8217;t yet have a website account, the you need'),(362,10,12,10,4,'_order','1000'),(361,10,12,10,4,'_id','10'),(360,10,12,10,4,'body_processed','<p>Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! </p>\n\n<p>Would we do that? Of course we wouldn&#8217;t. Instead we&#8217;ve got some boring old documents with members'),(359,10,12,10,4,'body_raw','Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! \r\n\r\nWould we do that? Of course we wouldn\'t. Instead we\'ve got some boring old documents with members addresses and phone'),(358,10,12,10,4,'body','<p>Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! </p>\n\n<p>Would we do that? Of course we wouldn&#8217;t. Instead we&#8217;ve got some boring old documents with members'),(357,10,12,10,4,'image_h','683'),(356,10,12,10,4,'image_w','1024'),(355,10,12,10,4,'image_bucket','default'),(354,10,12,10,4,'image_size','342150'),(353,10,12,10,4,'image_path','img0043.jpg'),(352,10,12,10,4,'image__default','/perch/resources/img0043.jpg'),(351,10,12,10,4,'image','/perch/resources/img0043.jpg'),(350,10,12,10,4,'heading','Members Area'),(384,15,13,10,14,'_order','1001'),(383,15,13,10,14,'_id','15'),(382,15,13,10,14,'file_bucket','members'),(381,15,13,10,14,'file_size','30553'),(380,15,13,10,14,'file_path','training-plan.pdf'),(379,15,13,10,14,'file__default','/members/file/training-plan.pdf'),(378,15,13,10,14,'file','/members/file/training-plan.pdf'),(377,15,13,10,14,'desc_processed','<p>Our exclusive club training plan <span class=\"caps\">PDF</span>. This is like <em>training gold</em>! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.</p>'),(376,15,13,10,14,'desc_raw','Our exclusive club training plan PDF. This is like _training gold_! Fill out all the boxes and you\'re bound to beat your PB by miles.'),(375,15,13,10,14,'desc','<p>Our exclusive club training plan <span class=\"caps\">PDF</span>. This is like <em>training gold</em>! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.</p>'),(374,15,13,10,14,'title','Training Plan'),(373,14,13,10,14,'_order','1000'),(372,14,13,10,14,'_id','14'),(371,14,13,10,14,'file_bucket','members'),(370,14,13,10,14,'file_size','23364'),(369,14,13,10,14,'file_path','annual-report.pdf'),(368,14,13,10,14,'file__default','/members/file/annual-report.pdf'),(367,14,13,10,14,'file','/members/file/annual-report.pdf'),(366,14,13,10,14,'desc_processed','<p>This is our annual club report, as presented and signed off at this year&#8217;s Annual General Meeting by the committee and the club chairman.</p>'),(365,14,13,10,14,'desc_raw','This is our annual club report, as presented and signed off at this year\'s Annual General Meeting by the committee and the club chairman.'),(364,14,13,10,14,'desc','<p>This is our annual club report, as presented and signed off at this year&#8217;s Annual General Meeting by the committee and the club chairman.</p>'),(363,14,13,10,14,'title','Annual Report');
/*!40000 ALTER TABLE `perch2_content_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_content_items`
--

DROP TABLE IF EXISTS `perch2_content_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_content_items` (
  `itemRowID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemID` int(10) unsigned NOT NULL DEFAULT '0',
  `regionID` int(10) unsigned NOT NULL DEFAULT '0',
  `pageID` int(10) unsigned NOT NULL DEFAULT '0',
  `itemRev` int(10) unsigned NOT NULL DEFAULT '0',
  `itemOrder` int(10) unsigned NOT NULL DEFAULT '1000',
  `itemJSON` mediumtext NOT NULL,
  `itemSearch` mediumtext NOT NULL,
  `itemUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `itemUpdatedBy` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemRowID`),
  KEY `idx_item` (`itemID`),
  KEY `idx_rev` (`itemRev`),
  KEY `idx_region` (`regionID`),
  KEY `idx_regrev` (`itemID`,`regionID`,`itemRev`),
  KEY `idx_order` (`itemOrder`),
  FULLTEXT KEY `idx_search` (`itemSearch`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_content_items`
--

LOCK TABLES `perch2_content_items` WRITE;
/*!40000 ALTER TABLE `perch2_content_items` DISABLE KEYS */;
INSERT INTO `perch2_content_items` VALUES (84,6,8,7,6,1000,'{\"_id\":\"6\",\"heading\":\"Send us a message\",\"intro\":{\"raw\":\"\",\"processed\":\"\"},\"success\":{\"raw\":\"h1. Thank you!\\r\\n\\r\\nThanks for dropping us a line. We\'ll be in touch with a response shortly. Happy running!\",\"processed\":\"<h1>Thank you!<\\/h1>\\n\\n<p>Thanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running!<\\/p>\"}}',' Send us a message  Thank you!\n\nThanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running! ','0000-00-00 00:00:00',''),(51,5,7,2,16,1000,'{\"_id\":\"5\",\"heading\":\"Who are we?\",\"image\":{\"_default\":\"\\/perch\\/resources\\/img1069-2.jpg\",\"path\":\"img1069-2.jpg\",\"size\":207516,\"bucket\":\"default\",\"w\":1024,\"h\":683,\"sizes\":{\"thumb\":{\"w\":150,\"h\":100,\"path\":\"img1069-2-thumb.jpg\",\"size\":7503,\"mime\":\"image\\/jpeg\"},\"w280hc0\":{\"w\":280,\"h\":186,\"density\":\"1\",\"path\":\"img1069-2-w280.jpg\",\"size\":16739,\"mime\":\"image\\/jpeg\"}}},\"body\":{\"raw\":\"Hello, we\'re *Nest* -- a local running club for local people who like to run, locally. We\'re really friendly and always welcome new members, as long as you\'re local. So if you\'re a local person who likes to run locally, pop along for a taster session. There\'s no need to worry about joining, just come along and get a feel for the place. You can join if you\'d like to attend regularly. We\'re your local running club, locals.\\r\\n\\r\\nWe meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. _On the run!_ Ah haha!\\r\\n\\r\\nh2. Bring your own shoes\\r\\n\\r\\nSharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn\'t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let\'s face it, the risk isn\'t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)\\r\\n\\r\\nCome and join us!\",\"processed\":\"<p>Hello, we&#8217;re <strong>Nest<\\/strong> &#8212; a local running club for local people who like to run, locally. We&#8217;re really friendly and always welcome new members, as long as you&#8217;re local. So if you&#8217;re a local person who likes to run locally, pop along for a taster session. There&#8217;s no need to worry about joining, just come along and get a feel for the place. You can join if you&#8217;d like to attend regularly. We&#8217;re your local running club, locals.<\\/p>\\n\\n<p>We meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. <em>On the run!<\\/em> Ah haha!<\\/p>\\n\\n<h2>Bring your own shoes<\\/h2>\\n\\n<p>Sharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn&#8217;t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let&#8217;s face it, the risk isn&#8217;t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)<\\/p>\\n\\n<p>Come and join us!<\\/p>\"}}',' Who are we?  Hello, we&#8217;re Nest &#8212; a local running club for local people who like to run, locally. We&#8217;re really friendly and always welcome new members, as long as you&#8217;re local. So if you&#8217;re a local person who likes to run locally, pop along for a taster session. There&#8217;s no need to worry about joining, just come along and get a feel for the place. You can join if you&#8217;d like to attend regularly. We&#8217;re your local running club, locals.\n\nWe meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. On the run! Ah haha!\n\nBring your own shoes\n\nSharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn&#8217;t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let&#8217;s face it, the risk isn&#8217;t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)\n\nCome and join us! ','0000-00-00 00:00:00',''),(63,10,12,10,4,1000,'{\"_id\":\"10\",\"heading\":\"Members Area\",\"image\":{\"_default\":\"\\/perch\\/resources\\/img0043.jpg\",\"path\":\"img0043.jpg\",\"size\":342150,\"bucket\":\"default\",\"w\":1024,\"h\":683,\"sizes\":{\"thumb\":{\"w\":150,\"h\":100,\"path\":\"img0043-thumb.jpg\",\"size\":8001,\"mime\":\"image\\/jpeg\"},\"w280hc0\":{\"w\":280,\"h\":186,\"density\":\"1\",\"path\":\"img0043-w280.jpg\",\"size\":22693,\"mime\":\"image\\/jpeg\"}}},\"body\":{\"raw\":\"Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! \\r\\n\\r\\nWould we do that? Of course we wouldn\'t. Instead we\'ve got some boring old documents with members addresses and phone numbers and stuff.\\r\\n\\r\\nh2. Training Plans\\r\\n\\r\\nOne thing we wouldn\'t want other clubs to get their filthy mitts on is our exciting Training Plan PDF! Exclusive to club members, this PDF helps you plan out your complete training programme. It\'s such a competitive advantage that by the time you\'ve filled it out you hardly need to train at all. Check it out!\",\"processed\":\"<p>Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! <\\/p>\\n\\n<p>Would we do that? Of course we wouldn&#8217;t. Instead we&#8217;ve got some boring old documents with members addresses and phone numbers and stuff.<\\/p>\\n\\n<h2>Training Plans<\\/h2>\\n\\n<p>One thing we wouldn&#8217;t want other clubs to get their filthy mitts on is our exciting Training Plan <span class=\\\"caps\\\">PDF<\\/span>! Exclusive to club members, this <span class=\\\"caps\\\">PDF<\\/span> helps you plan out your complete training programme. It&#8217;s such a competitive advantage that by the time you&#8217;ve filled it out you hardly need to train at all. Check it out!<\\/p>\"}}',' Members Area  Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! \n\nWould we do that? Of course we wouldn&#8217;t. Instead we&#8217;ve got some boring old documents with members addresses and phone numbers and stuff.\n\nTraining Plans\n\nOne thing we wouldn&#8217;t want other clubs to get their filthy mitts on is our exciting Training Plan PDF! Exclusive to club members, this PDF helps you plan out your complete training programme. It&#8217;s such a competitive advantage that by the time you&#8217;ve filled it out you hardly need to train at all. Check it out! ','0000-00-00 00:00:00',''),(76,14,13,10,14,1000,'{\"_id\":\"14\",\"title\":\"Annual Report\",\"_title\":\"Annual Report\",\"desc\":{\"raw\":\"This is our annual club report, as presented and signed off at this year\'s Annual General Meeting by the committee and the club chairman.\",\"processed\":\"<p>This is our annual club report, as presented and signed off at this year&#8217;s Annual General Meeting by the committee and the club chairman.<\\/p>\"},\"file\":{\"_default\":\"\\/members\\/file\\/annual-report.pdf\",\"path\":\"annual-report.pdf\",\"size\":23364,\"bucket\":\"members\"}}',' Annual Report This is our annual club report, as presented and signed off at this year&#8217;s Annual General Meeting by the committee and the club chairman.  members file annual report pdf ','0000-00-00 00:00:00',''),(77,15,13,10,14,1001,'{\"_id\":\"15\",\"title\":\"Training Plan\",\"_title\":\"Training Plan\",\"desc\":{\"raw\":\"Our exclusive club training plan PDF. This is like _training gold_! Fill out all the boxes and you\'re bound to beat your PB by miles.\",\"processed\":\"<p>Our exclusive club training plan <span class=\\\"caps\\\">PDF<\\/span>. This is like <em>training gold<\\/em>! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.<\\/p>\"},\"file\":{\"_default\":\"\\/members\\/file\\/training-plan.pdf\",\"path\":\"training-plan.pdf\",\"size\":30553,\"bucket\":\"members\"}}',' Training Plan Our exclusive club training plan PDF. This is like training gold! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.  members file training plan pdf ','0000-00-00 00:00:00',''),(82,16,6,1,1,1000,'{\"_id\":\"16\",\"site_name\":\"Nest Running Club\",\"strapline\":\"Run for your life\"}',' Nest Running Club Run for your life ','0000-00-00 00:00:00',''),(83,3,3,1,3,1000,'{\"_id\":\"3\",\"image\":{\"_default\":\"\\/perch\\/resources\\/home-banner.jpg\",\"path\":\"home-banner.jpg\",\"size\":34130,\"bucket\":\"default\",\"w\":1200,\"h\":350,\"sizes\":{\"thumb\":{\"w\":150,\"h\":43,\"path\":\"home-banner-thumb.jpg\",\"size\":1897,\"mime\":\"image\\/jpeg\"}}}}','    ','0000-00-00 00:00:00',''),(80,2,2,1,4,1000,'{\"_id\":\"2\",\"twitter\":\"grabaperch\",\"facebook\":\"grabaperch\"}',' grabaperch grabaperch ','0000-00-00 00:00:00',''),(56,7,9,12,2,1000,'{\"_id\":\"7\",\"text\":{\"raw\":\"h1. Register today\\r\\n\\r\\nNest running club members should already have their membership details, but if you\'re new to the club you can sign up here.\\r\\n\\r\\nMembers get access to information such as personal contact information that we\'d rather not have freely available to all. It\'s not that we\'re paranoid, but you just never know who\'s watching.\",\"processed\":\"<h1>Register today<\\/h1>\\n\\n<p>Nest running club members should already have their membership details, but if you&#8217;re new to the club you can sign up here.<\\/p>\\n\\n<p>Members get access to information such as personal contact information that we&#8217;d rather not have freely available to all. It&#8217;s not that we&#8217;re paranoid, but you just never know who&#8217;s watching.<\\/p>\"}}',' Register today\n\nNest running club members should already have their membership details, but if you&#8217;re new to the club you can sign up here.\n\nMembers get access to information such as personal contact information that we&#8217;d rather not have freely available to all. It&#8217;s not that we&#8217;re paranoid, but you just never know who&#8217;s watching. ','0000-00-00 00:00:00',''),(79,1,1,1,5,1000,'{\"_id\":\"1\",\"title\":\"Become a member\",\"_title\":\"Become a member\",\"desc\":{\"raw\":\"Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!\",\"processed\":\"<p>Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!<\\/p>\"},\"cta\":\"Request an invitation\"}',' Become a member Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today! Request an invitation ','0000-00-00 00:00:00',''),(78,8,10,14,3,1000,'{\"_id\":\"8\",\"text\":{\"raw\":\"h2. Get a new password\\r\\n\\r\\nHave you forgotten your password? You idiot! We can\'t remind you of your old password (it\'s stored in a secure way that means we can\'t retrieve it) but we can send you a new one.\\r\\n\\r\\nIf you\'re already registered, enter your email address below, submit the form and we\'ll send a new password to that email address.\",\"processed\":\"<h2>Get a new password<\\/h2>\\n\\n<p>Have you forgotten your password? You idiot! We can&#8217;t remind you of your old password (it&#8217;s stored in a secure way that means we can&#8217;t retrieve it) but we can send you a new one.<\\/p>\\n\\n<p>If you&#8217;re already registered, enter your email address below, submit the form and we&#8217;ll send a new password to that email address.<\\/p>\"}}',' Get a new password\n\nHave you forgotten your password? You idiot! We can&#8217;t remind you of your old password (it&#8217;s stored in a secure way that means we can&#8217;t retrieve it) but we can send you a new one.\n\nIf you&#8217;re already registered, enter your email address below, submit the form and we&#8217;ll send a new password to that email address. ','0000-00-00 00:00:00',''),(59,13,14,16,1,1000,'{\"_id\":\"13\",\"text\":{\"raw\":\"This is my content!\",\"processed\":\"<p>This is my content!<\\/p>\"}}',' This is my content! ','0000-00-00 00:00:00',''),(60,9,11,10,4,1000,'{\"_id\":\"9\",\"text\":{\"raw\":\"h1. Member login\\r\\n\\r\\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\\r\\n\\r\\nIf you\'re a member but don\'t yet have a website account, the you need to \\\"register\\\":\\/members\\/register\\/ first. If you\'re not a member and have no intention of becoming one, there\'s really nothing here for you. Nothing. Not a sausage.\",\"processed\":\"<h1>Member login<\\/h1>\\n\\n<p>The restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.<\\/p>\\n\\n<p>If you&#8217;re a member but don&#8217;t yet have a website account, the you need to <a href=\\\"\\/members\\/register\\/\\\">register<\\/a> first. If you&#8217;re not a member and have no intention of becoming one, there&#8217;s really nothing here for you. Nothing. Not a sausage.<\\/p>\"}}',' Member login\n\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\n\nIf you&#8217;re a member but don&#8217;t yet have a website account, the you need to register first. If you&#8217;re not a member and have no intention of becoming one, there&#8217;s really nothing here for you. Nothing. Not a sausage. ','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `perch2_content_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_content_regions`
--

DROP TABLE IF EXISTS `perch2_content_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `regionUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`regionID`),
  KEY `idx_key` (`regionKey`) USING BTREE,
  KEY `idx_path` (`regionPage`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_content_regions`
--

LOCK TABLES `perch2_content_regions` WRITE;
/*!40000 ALTER TABLE `perch2_content_regions` DISABLE KEYS */;
INSERT INTO `perch2_content_regions` VALUES (1,1,'Sidebar: become a member','*','<div class=\"box members minor\">\n	<h2>Become a member</h2>\n	<p>Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!</p>\n	<a class=\"button\" href=\"/members/register/\">Request an invitation</a>\n</div>',0,0,'sidebars/members.html',0,'{\"edit_mode\":\"listdetail\",\"searchURL\":\"\",\"title_delimit\":\"\",\"adminOnly\":0,\"addToTop\":0,\"limit\":false}',0,5,5,'*','0000-00-00 00:00:00'),(2,1,'Sidebar: social links','*','	<div class=\"social\">\n		<ul>\n			\n			<li><a class=\"twitter icon\" href=\"https://twitter.com/grabaperch\">Follow us on Twitter</a></li>\n			\n			<li><a class=\"facebook icon\" href=\"https://facebook.com/grabaperch\">Befriend us on Facebook</a></li>\n		</ul>\n	</div>',0,1,'sidebars/social.html',0,'{\"edit_mode\":\"listdetail\",\"searchURL\":\"\",\"title_delimit\":\"\",\"adminOnly\":0,\"addToTop\":0,\"limit\":false}',0,4,4,'*','0000-00-00 00:00:00'),(3,1,'Banner','/index.php','<div class=\"banner\">\n	<img src=\"/perch/resources/home-banner.jpg\" alt=\"\" class=\"bg\" />\n	<h1 class=\"icon logo\"><span class=\"offscreen\"></span></h1>\n	<h2 class=\"strap\"><span class=\"offscreen\"></span></h2>\n</div>',0,0,'home/banner.html',0,'{\"edit_mode\":\"singlepage\"}',1,3,3,'*','0000-00-00 00:00:00'),(6,1,'Site name','*','\n\nNest Running Club\nRun for your life',0,0,'home/site_name.html',0,'{\"edit_mode\":\"singlepage\"}',0,1,1,'*','0000-00-00 00:00:00'),(9,12,'Invitation to register','/members/register/index.php','<div class=\"box\">\n	<h1>Register today</h1>\n\n<p>Nest running club members should already have their membership details, but if you&#8217;re new to the club you can sign up here.</p>\n\n<p>Members get access to information such as personal contact information that we&#8217;d rather not have freely available to all. It&#8217;s not that we&#8217;re paranoid, but you just never know who&#8217;s watching.</p>\n</div>',0,1,'text_block.html',0,'{\"edit_mode\":\"singlepage\"}',1,2,2,'*','0000-00-00 00:00:00'),(7,2,'About us','/about/index.php','<div class=\"box about\">\n	<h1>Who are we?</h1>\n\n	\n		<img src=\"/perch/resources/img1069-2-w280.jpg\" width=\"280\" height=\"186\" class=\"embedded\" alt=\"\" />\n	\n\n	<p>Hello, we&#8217;re <strong>Nest</strong> &#8212; a local running club for local people who like to run, locally. We&#8217;re really friendly and always welcome new members, as long as you&#8217;re local. So if you&#8217;re a local person who likes to run locally, pop along for a taster session. There&#8217;s no need to worry about joining, just come along and get a feel for the place. You can join if you&#8217;d like to attend regularly. We&#8217;re your local running club, locals.</p>\n\n<p>We meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. <em>On the run!</em> Ah haha!</p>\n\n<h2>Bring your own shoes</h2>\n\n<p>Sharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn&#8217;t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let&#8217;s face it, the risk isn&#8217;t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)</p>\n\n<p>Come and join us!</p>\n</div>\n\n',0,1,'about/about_us.html',0,'{\"edit_mode\":\"singlepage\"}',1,16,16,'*','0000-00-00 00:00:00'),(8,7,'Contact form','/contact/index.php','<perch:form template=\"/templates/content/contact/form.html\" id=\"contact\" method=\"post\" app=\"perch_forms\" class=\"box contact\">\n	\n	<h2>Send us a message</h2>\n\n	\n\n	<div>\n		<perch:label for=\"name\">Your name:</perch:label>\n		<perch:input type=\"text\" id=\"name\" required=\"true\" label=\"Name\" />\n		<perch:error for=\"name\" type=\"required\">Please enter your name</perch:error>\n	</div>\n\n	<div>\n		<perch:label for=\"email\">Email address:</perch:label>\n		<perch:input type=\"email\" id=\"email\" required=\"true\" label=\"Email\" placeholder=\"you@example.com\" />\n		<perch:error for=\"email\" type=\"required\">Please add your email address</perch:error>\n		<perch:error for=\"email\" type=\"format\">Please check your email address</perch:error>\n	</div>\n\n	<div>\n		<perch:label for=\"message\">Comment:</perch:label>\n		<perch:input type=\"textarea\" id=\"message\" required=\"true\" label=\"Message\" />\n		<perch:error for=\"message\" type=\"required\">Please add a message</perch:error>\n	</div>\n\n	<div>\n		<perch:input type=\"submit\" value=\"Send message\" class=\"button\" />\n	</div>\n\n	<perch:success>\n		<div class=\"box contact\">\n			<h1>Thank you!</h1>\n\n<p>Thanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running!</p>\n		</div>\n	</perch:success>\n</perch:form>',0,1,'contact/form.html',0,'{\"edit_mode\":\"singlepage\"}',1,6,6,'*','0000-00-00 00:00:00'),(10,14,'Password reset information','/members/reset/index.php','<div class=\"box\">\n	<h2>Get a new password</h2>\n\n<p>Have you forgotten your password? You idiot! We can&#8217;t remind you of your old password (it&#8217;s stored in a secure way that means we can&#8217;t retrieve it) but we can send you a new one.</p>\n\n<p>If you&#8217;re already registered, enter your email address below, submit the form and we&#8217;ll send a new password to that email address.</p>\n</div>',0,1,'text_block.html',0,'{\"edit_mode\":\"singlepage\"}',1,3,3,'*','0000-00-00 00:00:00'),(11,10,'Login instructions','/members/index.php','<div class=\"box\">\n	<h1>Member login</h1>\n\n<p>The restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.</p>\n\n<p>If you&#8217;re a member but don&#8217;t yet have a website account, the you need to <a href=\"/members/register/\">register</a> first. If you&#8217;re not a member and have no intention of becoming one, there&#8217;s really nothing here for you. Nothing. Not a sausage.</p>\n</div>',0,1,'text_block.html',0,'{\"edit_mode\":\"singlepage\"}',1,4,4,'*','0000-00-00 00:00:00'),(12,10,'Private members intro','/members/index.php','<div class=\"box members\">\n	<h1>Members Area</h1>\n\n	\n		<img src=\"/perch/resources/img0043-w280.jpg\" width=\"280\" height=\"186\" class=\"embedded\" />\n	\n\n	<p>Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! </p>\n\n<p>Would we do that? Of course we wouldn&#8217;t. Instead we&#8217;ve got some boring old documents with members addresses and phone numbers and stuff.</p>\n\n<h2>Training Plans</h2>\n\n<p>One thing we wouldn&#8217;t want other clubs to get their filthy mitts on is our exciting Training Plan <span class=\"caps\">PDF</span>! Exclusive to club members, this <span class=\"caps\">PDF</span> helps you plan out your complete training programme. It&#8217;s such a competitive advantage that by the time you&#8217;ve filled it out you hardly need to train at all. Check it out!</p>\n</div>\n\n',0,1,'members/intro.html',0,'{\"edit_mode\":\"singlepage\"}',1,4,4,'*','0000-00-00 00:00:00'),(13,10,'Files for members','/members/index.php','\n<div class=\"box members minor\">\n	<h2>Members only info</h2>\n\n\n<div class=\"file\">\n	<a href=\"/members/file/annual-report.pdf\" class=\"button\">Annual Report</a>\n	<p>This is our annual club report, as presented and signed off at this year&#8217;s Annual General Meeting by the committee and the club chairman.</p>\n	\n</div>\n\n\n\n<div class=\"file\">\n	<a href=\"/members/file/training-plan.pdf\" class=\"button\">Training Plan</a>\n	<p>Our exclusive club training plan <span class=\"caps\">PDF</span>. This is like <em>training gold</em>! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.</p>\n	\n</div>\n\n\n</div>\n',0,2,'members/secure_file.html',1,'{\"edit_mode\":\"listdetail\",\"sortOrder\":\"ASC\",\"sortField\":\"\",\"limit\":\"\",\"searchURL\":\"\",\"addToTop\":\"\",\"column_ids\":\"title, file[size]\",\"title_delimit\":\"\",\"adminOnly\":0}',1,14,14,'*','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `perch2_content_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_content_resources`
--

DROP TABLE IF EXISTS `perch2_content_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_content_resources` (
  `itemRowID` int(10) unsigned NOT NULL,
  `resourceID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`itemRowID`,`resourceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_content_resources`
--

LOCK TABLES `perch2_content_resources` WRITE;
/*!40000 ALTER TABLE `perch2_content_resources` DISABLE KEYS */;
INSERT INTO `perch2_content_resources` VALUES (51,15),(51,16),(51,17),(63,29),(63,30),(63,31),(76,33),(77,34),(83,1),(83,2);
/*!40000 ALTER TABLE `perch2_content_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_events`
--

DROP TABLE IF EXISTS `perch2_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_events`
--

LOCK TABLES `perch2_events` WRITE;
/*!40000 ALTER TABLE `perch2_events` DISABLE KEYS */;
INSERT INTO `perch2_events` VALUES (1,'Award Ceremony','2020-07-14-award-ceremony','2020-07-14 19:30:00','Our annual awards show. Join us for a lavish formal dinner and awards ceremony. Just like last year, this is being held at the Birds Golf Club, just up road from the running club.\r\n\r\n*Dress code is black tie.* That means strictly _no lycra_ and absolutely _no running shoes_. The golf club have been quite clear on this point. Quite clear.\r\n\r\nTo encourage a high standard of dress, there will be a special prize for the best dressed couple on the evening, as judged by the committee. So gents get your dinner jackets dry cleaned, and ladies perhaps it\'s time for a new frock. We know you don\'t need an excuse! (_Our lady chairman informs me this may be a bit sexist. So ladies, any old frock will do._)','<p>Our annual awards show. Join us for a lavish formal dinner and awards ceremony. Just like last year, this is being held at the Birds Golf Club, just up road from the running club.</p>\n\n<p><strong>Dress code is black tie.</strong> That means strictly <em>no lycra</em> and absolutely <em>no running shoes</em>. The golf club have been quite clear on this point. Quite clear.</p>\n\n<p>To encourage a high standard of dress, there will be a special prize for the best dressed couple on the evening, as judged by the committee. So gents get your dinner jackets dry cleaned, and ladies perhaps it&#8217;s time for a new frock. We know you don&#8217;t need an excuse! (<em>Our lady chairman informs me this may be a bit sexist. So ladies, any old frock will do.</em>)</p>','{\"summary\":{\"raw\":\"Our annual awards show. Join us for a lavish formal dinner and awards ceremony.\",\"processed\":\"<p>Our annual awards show. Join us for a lavish formal dinner and awards ceremony.<\\/p>\"}}'),(2,'The Nest 10k','2020-07-23-the-nest-10k','2020-07-23 09:15:00','We host our very own 10k race for other local clubs to compete in. \r\n\r\nWe run about 10,000 metres in more or less a circle. I know that sounds like a pointless activity, but it\'s really quite fun. Ok, maybe not exactly fun, but it\'s really healthy. Fresh air, a bracing wind, sunshine (sometimes) and birdsong. What more could you want?\r\n\r\nThe race starts at 9.15am sharp from the start line. Or the finish line -- they\'re both the same thing. It doesn\'t matter if you think of it as the start of the finish, but strictly speaking it\'s the start. It becomes the finish at the end. But 9.15 sharp!\r\n\r\nThere will be a water stop halfway around near St Abbott\'s primary school playground. Following last year\'s incident at the water station (which I\'m sure I need not mention) all runners are required to keep all their running kit on at the water stop.\r\n\r\nPlease invite your friends from other clubs to join us!','<p>We host our very own 10k race for other local clubs to compete in. </p>\n\n<p>We run about 10,000 metres in more or less a circle. I know that sounds like a pointless activity, but it&#8217;s really quite fun. Ok, maybe not exactly fun, but it&#8217;s really healthy. Fresh air, a bracing wind, sunshine (sometimes) and birdsong. What more could you want?</p>\n\n<p>The race starts at 9.15am sharp from the start line. Or the finish line &#8212; they&#8217;re both the same thing. It doesn&#8217;t matter if you think of it as the start of the finish, but strictly speaking it&#8217;s the start. It becomes the finish at the end. But 9.15 sharp!</p>\n\n<p>There will be a water stop halfway around near St Abbott&#8217;s primary school playground. Following last year&#8217;s incident at the water station (which I&#8217;m sure I need not mention) all runners are required to keep all their running kit on at the water stop.</p>\n\n<p>Please invite your friends from other clubs to join us!</p>','{\"eventTitle\":\"The Nest 10k\",\"summary\":{\"raw\":\"We host our very own 10k race for other local clubs to compete in.\",\"processed\":\"<p>We host our very own 10k race for other local clubs to compete in.<\\/p>\"}}'),(3,'Summer BBQ Social','2020-08-23-summer-bbq-social','2020-08-23 18:00:00','Following the success of last year\'s BBQ, despite the weather, we\'re holding another one! This is a real family event, so bring the kids and the dog! _(No dogs allowed.)_\r\n\r\nWe\'re taking over the field in the centre of the running track. There will be games, fun competitions and plenty of hot dogs and burgers-in-a-bun. Vegetarians are advised to bring some lettuce. Vegans should bring whatever it is you people eat. Or try a burger!\r\n\r\nLast year the weather was a little on the damp side. Although no one was actually struck by the lightening, it did get a bit hairy. This year we\'ll make sure that someone brings the keys to the clubhouse so that we can get in and shelter should the weather turn.\r\n\r\nI\'ll remind all members that Tony is still missing a green tartan picnic rug from last year, so keep your eyes peeled. \r\n\r\nTickets are £8 each, or £20 for a family of four.','<p>Following the success of last year&#8217;s <span class=\"caps\">BBQ</span>, despite the weather, we&#8217;re holding another one! This is a real family event, so bring the kids and the dog! <em>(No dogs allowed.)</em></p>\n\n<p>We&#8217;re taking over the field in the centre of the running track. There will be games, fun competitions and plenty of hot dogs and burgers-in-a-bun. Vegetarians are advised to bring some lettuce. Vegans should bring whatever it is you people eat. Or try a burger!</p>\n\n<p>Last year the weather was a little on the damp side. Although no one was actually struck by the lightening, it did get a bit hairy. This year we&#8217;ll make sure that someone brings the keys to the clubhouse so that we can get in and shelter should the weather turn.</p>\n\n<p>I&#8217;ll remind all members that Tony is still missing a green tartan picnic rug from last year, so keep your eyes peeled. </p>\n\n<p>Tickets are £8 each, or £20 for a family of four.</p>','{\"eventTitle\":\"Summer BBQ Social\",\"summary\":{\"raw\":\"Our summer BBQ special returns! This is a real family event, so bring the kids and the dog! (No dogs allowed.)\",\"processed\":\"<p>Our summer <span class=\\\"caps\\\">BBQ<\\/span> special returns! This is a real family event, so bring the kids and the dog! (No dogs allowed.)<\\/p>\"}}');
/*!40000 ALTER TABLE `perch2_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_events_categories`
--

DROP TABLE IF EXISTS `perch2_events_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_events_categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryTitle` varchar(255) NOT NULL DEFAULT '',
  `categorySlug` varchar(255) NOT NULL DEFAULT '',
  `categoryEventCount` int(10) unsigned NOT NULL DEFAULT '0',
  `categoryFutureEventCount` int(10) unsigned NOT NULL DEFAULT '0',
  `categoryDynamicFields` text,
  PRIMARY KEY (`categoryID`),
  KEY `idx_slug` (`categorySlug`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_events_categories`
--

LOCK TABLES `perch2_events_categories` WRITE;
/*!40000 ALTER TABLE `perch2_events_categories` DISABLE KEYS */;
INSERT INTO `perch2_events_categories` VALUES (1,'Social events','social-events',2,2,NULL),(2,'Races','races',1,1,NULL);
/*!40000 ALTER TABLE `perch2_events_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_events_to_categories`
--

DROP TABLE IF EXISTS `perch2_events_to_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_events_to_categories` (
  `eventID` int(11) NOT NULL DEFAULT '0',
  `categoryID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventID`,`categoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_events_to_categories`
--

LOCK TABLES `perch2_events_to_categories` WRITE;
/*!40000 ALTER TABLE `perch2_events_to_categories` DISABLE KEYS */;
INSERT INTO `perch2_events_to_categories` VALUES (1,1),(2,2),(3,1);
/*!40000 ALTER TABLE `perch2_events_to_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_forms`
--

DROP TABLE IF EXISTS `perch2_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_forms` (
  `formID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `formKey` varchar(64) NOT NULL DEFAULT '',
  `formTitle` varchar(255) NOT NULL DEFAULT '',
  `formTemplate` varchar(255) NOT NULL DEFAULT '',
  `formOptions` text,
  PRIMARY KEY (`formID`),
  KEY `idx_formKey` (`formKey`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_forms`
--

LOCK TABLES `perch2_forms` WRITE;
/*!40000 ALTER TABLE `perch2_forms` DISABLE KEYS */;
INSERT INTO `perch2_forms` VALUES (1,'contact','Contact','/templates/content/contact/form.html','{\"store\":\"1\",\"fileLocation\":\"\",\"email\":\"1\",\"emailAddress\":\"{email}\",\"adminEmailMessage\":\"Here\'s a message someone has sent from the website contact form.\",\"adminEmailSubject\":\"Nest running club contact form\",\"adminEmailFromName\":\"{firstname} {lastname}\",\"adminEmailFromAddress\":\"{email}\",\"akismetAPIKey\":\"\"}');
/*!40000 ALTER TABLE `perch2_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_forms_responses`
--

DROP TABLE IF EXISTS `perch2_forms_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_forms_responses`
--

LOCK TABLES `perch2_forms_responses` WRITE;
/*!40000 ALTER TABLE `perch2_forms_responses` DISABLE KEYS */;
INSERT INTO `perch2_forms_responses` VALUES (4,1,'2013-06-22 15:08:44','{\"fields\":{\"name\":{\"attributes\":{\"type\":\"text\",\"id\":\"name\",\"required\":\"true\",\"label\":\"Name\"},\"value\":\"Drew McLellan\"},\"email\":{\"attributes\":{\"type\":\"email\",\"id\":\"email\",\"required\":\"true\",\"label\":\"Email\",\"placeholder\":\"you@example.com\"},\"value\":\"hello@grabaperch.com\"},\"message\":{\"attributes\":{\"type\":\"textarea\",\"id\":\"message\",\"required\":\"true\",\"label\":\"Message\"},\"value\":\"Hello - your club looks great! Do you have a beginner\'s night I could attend?\"}},\"files\":[]}','127.0.0.1',0,'{\"fields\":[],\"environment\":{\"HTTP_HOST\":\"perchdemo-nest.rocker.eoms\",\"HTTP_CONNECTION\":\"keep-alive\",\"CONTENT_LENGTH\":\"232\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"HTTP_ORIGIN\":\"http:\\/\\/perchdemo-nest.rocker.eoms\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/29.0.1545.0 Safari\\/537.36\",\"CONTENT_TYPE\":\"application\\/x-www-form-urlencoded\",\"HTTP_REFERER\":\"http:\\/\\/perchdemo-nest.rocker.eoms\\/contact\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate,sdch\",\"HTTP_ACCEPT_LANGUAGE\":\"en-US,en;q=0.8\",\"HTTP_COOKIE\":\"mp_aca1134b1691f97fca23dd82df07fa8f_mixpanel=%7B%22distinct_id%22%3A%20%2213db1092e6c1-0a8cfd912-67570c2a-384000-13db1092e6e8e8%22%2C%22%24initial_referrer%22%3A%20%22%24direct%22%2C%22%24initial_referring_domain%22%3A%20%22%24direct%22%7D; p_m=e307daeb6227c520ad0dcd47447632bde214bbc9; PHPSESSID=0d85c260dc2acb5995b3eac6e8ed0d4b; cmssb=0\",\"PATH\":\"\\/usr\\/bin:\\/bin:\\/usr\\/sbin:\\/sbin\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"perchdemo-nest.rocker.eoms\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\",\"SERVER_ADMIN\":\"you@example.com\",\"SCRIPT_FILENAME\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\\/contact\\/index.php\",\"REMOTE_PORT\":\"59061\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"POST\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/contact\\/\",\"SCRIPT_NAME\":\"\\/contact\\/index.php\",\"PHP_SELF\":\"\\/contact\\/index.php\",\"REQUEST_TIME_FLOAT\":1371913724.46,\"REQUEST_TIME\":1371913724,\"argv\":[],\"argc\":0}}');
/*!40000 ALTER TABLE `perch2_forms_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_gallery_albums`
--

DROP TABLE IF EXISTS `perch2_gallery_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_gallery_albums` (
  `albumID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `albumTitle` varchar(255) NOT NULL DEFAULT '',
  `albumSlug` varchar(255) NOT NULL DEFAULT '',
  `albumOrder` int(11) NOT NULL DEFAULT '0',
  `albumDynamicFields` text,
  `imageCount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`albumID`),
  KEY `idx_slug` (`albumSlug`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_gallery_albums`
--

LOCK TABLES `perch2_gallery_albums` WRITE;
/*!40000 ALTER TABLE `perch2_gallery_albums` DISABLE KEYS */;
INSERT INTO `perch2_gallery_albums` VALUES (1,'Race Highlights','race-highlights',1,'{\"description\":{\"raw\":\"Some highlights from recent races run by our members or organised by the club. Can you see yourself?\",\"processed\":\"<p>Some highlights from recent races run by our members or organised by the club. Can you see yourself?<\\/p>\"},\"date\":\"2013-05-20\",\"featured\":\"1\",\"albumTitle\":\"Race Highlights\"}',5),(2,'Reading Half 2012','reading-half-2012',2,'{\"description\":{\"raw\":\"The Reading Half Marathon, April 2012, in Reading.\",\"processed\":\"<p>The Reading Half Marathon, April 2012, in Reading.<\\/p>\"},\"date\":\"2012-04-01\",\"albumTitle\":\"Reading Half 2012\"}',4),(3,'Reading Half 2011','reading-half-2011',3,'{\"description\":{\"raw\":\"The Reading Half Marathon 2011.\",\"processed\":\"<p>The Reading Half Marathon 2011.<\\/p>\"},\"date\":\"2011-03-20\",\"albumTitle\":\"Reading Half 2011\"}',9),(4,'Wycombe 10k 2011','wycombe-10k-2011',4,'{\"description\":{\"raw\":\"The Wycombe 10k race held in High Wycombe\",\"processed\":\"<p>The Wycombe 10k race held in High Wycombe<\\/p>\"},\"date\":\"2011-07-17\",\"albumTitle\":\"Wycombe 10k 2011\"}',8);
/*!40000 ALTER TABLE `perch2_gallery_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_gallery_image_versions`
--

DROP TABLE IF EXISTS `perch2_gallery_image_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_gallery_image_versions` (
  `versionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `versionPath` varchar(255) NOT NULL DEFAULT '',
  `versionKey` varchar(50) NOT NULL DEFAULT '',
  `versionWidth` int(10) unsigned NOT NULL DEFAULT '0',
  `versionHeight` int(10) unsigned NOT NULL DEFAULT '0',
  `imageID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`versionID`),
  KEY `idx_imageID` (`imageID`)
) ENGINE=MyISAM AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_gallery_image_versions`
--

LOCK TABLES `perch2_gallery_image_versions` WRITE;
/*!40000 ALTER TABLE `perch2_gallery_image_versions` DISABLE KEYS */;
INSERT INTO `perch2_gallery_image_versions` VALUES (1,'img_1039-w620.jpg','feature',620,412,1),(2,'img_1039-w300h300.jpg','square',300,300,1),(3,'img_1039-w1024.jpg','main',1024,682,1),(4,'img_1039-w140h140@2x.jpg','thumb',140,140,1),(5,'img_1039.jpg','original',1024,682,1),(6,'img_1039-w80h80@2x.jpg','admin_thumb',80,80,1),(7,'img_1039-w180@2x.jpg','admin_preview',180,119,1),(8,'img_1069-w620.jpg','feature',620,413,2),(9,'img_1069-w300h300.jpg','square',300,300,2),(10,'img_1069-w1024.jpg','main',1024,683,2),(11,'img_1069-w140h140@2x.jpg','thumb',140,140,2),(12,'img_1069.jpg','original',1024,683,2),(13,'img_1069-w80h80@2x.jpg','admin_thumb',80,80,2),(14,'img_1069-w180@2x.jpg','admin_preview',180,120,2),(15,'img_1084-w620.jpg','feature',620,413,3),(16,'img_1084-w300h300.jpg','square',300,300,3),(17,'img_1084-w1024.jpg','main',1024,683,3),(18,'img_1084-w140h140@2x.jpg','thumb',140,140,3),(19,'img_1084.jpg','original',1024,683,3),(20,'img_1084-w80h80@2x.jpg','admin_thumb',80,80,3),(21,'img_1084-w180@2x.jpg','admin_preview',180,120,3),(22,'img_1096-w620.jpg','feature',620,413,4),(23,'img_1096-w300h300.jpg','square',300,300,4),(24,'img_1096-w1024.jpg','main',1024,683,4),(25,'img_1096-w140h140@2x.jpg','thumb',140,140,4),(26,'img_1096.jpg','original',1024,683,4),(27,'img_1096-w80h80@2x.jpg','admin_thumb',80,80,4),(28,'img_1096-w180@2x.jpg','admin_preview',180,120,4),(29,'img_1099-w620.jpg','feature',620,413,5),(30,'img_1099-w300h300.jpg','square',300,300,5),(31,'img_1099-w1024.jpg','main',1024,683,5),(32,'img_1099-w140h140@2x.jpg','thumb',140,140,5),(33,'img_1099.jpg','original',1024,683,5),(34,'img_1099-w80h80@2x.jpg','admin_thumb',80,80,5),(35,'img_1099-w180@2x.jpg','admin_preview',180,120,5),(36,'img_1102-w620.jpg','feature',620,413,6),(37,'img_1102-w300h300.jpg','square',300,300,6),(38,'img_1102-w1024.jpg','main',1024,683,6),(39,'img_1102-w140h140@2x.jpg','thumb',140,140,6),(40,'img_1102.jpg','original',1024,683,6),(41,'img_1102-w80h80@2x.jpg','admin_thumb',80,80,6),(42,'img_1102-w180@2x.jpg','admin_preview',180,120,6),(43,'img_1109-w620.jpg','feature',620,413,7),(44,'img_1109-w300h300.jpg','square',300,300,7),(45,'img_1109-w1024.jpg','main',1024,683,7),(46,'img_1109-w140h140@2x.jpg','thumb',140,140,7),(47,'img_1109.jpg','original',1024,683,7),(48,'img_1109-w80h80@2x.jpg','admin_thumb',80,80,7),(49,'img_1109-w180@2x.jpg','admin_preview',180,120,7),(50,'img_1114-w620.jpg','feature',620,412,8),(51,'img_1114-w300h300.jpg','square',300,300,8),(52,'img_1114-w1024.jpg','main',1024,682,8),(53,'img_1114-w140h140@2x.jpg','thumb',140,140,8),(54,'img_1114.jpg','original',1024,682,8),(55,'img_1114-w80h80@2x.jpg','admin_thumb',80,80,8),(56,'img_1114-w180@2x.jpg','admin_preview',180,119,8),(57,'img_1117-w620.jpg','feature',620,413,9),(58,'img_1117-w300h300.jpg','square',300,300,9),(59,'img_1117-w1024.jpg','main',1024,683,9),(60,'img_1117-w140h140@2x.jpg','thumb',140,140,9),(61,'img_1117.jpg','original',1024,683,9),(62,'img_1117-w80h80@2x.jpg','admin_thumb',80,80,9),(63,'img_1117-w180@2x.jpg','admin_preview',180,120,9),(64,'img_0043-w620.jpg','feature',620,413,10),(65,'img_0043-w300h300.jpg','square',300,300,10),(66,'img_0043-w1024.jpg','main',1024,683,10),(67,'img_0043-w140h140@2x.jpg','thumb',140,140,10),(68,'img_0043.jpg','original',1024,683,10),(69,'img_0043-w80h80@2x.jpg','admin_thumb',80,80,10),(70,'img_0043-w180@2x.jpg','admin_preview',180,120,10),(71,'img_0259-w620.jpg','feature',620,413,11),(72,'img_0259-w300h300.jpg','square',300,300,11),(73,'img_0259-w1024.jpg','main',1024,683,11),(74,'img_0259-w140h140@2x.jpg','thumb',140,140,11),(75,'img_0259.jpg','original',1024,683,11),(76,'img_0259-w80h80@2x.jpg','admin_thumb',80,80,11),(77,'img_0259-w180@2x.jpg','admin_preview',180,120,11),(78,'img_0260-w620.jpg','feature',620,413,12),(79,'img_0260-w300h300.jpg','square',300,300,12),(80,'img_0260-w1024.jpg','main',1024,683,12),(81,'img_0260-w140h140@2x.jpg','thumb',140,140,12),(82,'img_0260.jpg','original',1024,683,12),(83,'img_0260-w80h80@2x.jpg','admin_thumb',80,80,12),(84,'img_0260-w180@2x.jpg','admin_preview',180,120,12),(85,'img_0261-w620.jpg','feature',620,413,13),(86,'img_0261-w300h300.jpg','square',300,300,13),(87,'img_0261-w1024.jpg','main',1024,683,13),(88,'img_0261-w140h140@2x.jpg','thumb',140,140,13),(89,'img_0261.jpg','original',1024,683,13),(90,'img_0261-w80h80@2x.jpg','admin_thumb',80,80,13),(91,'img_0261-w180@2x.jpg','admin_preview',180,120,13),(92,'img_0267-w620.jpg','feature',620,413,14),(93,'img_0267-w300h300.jpg','square',300,300,14),(94,'img_0267-w1024.jpg','main',1024,683,14),(95,'img_0267-w140h140@2x.jpg','thumb',140,140,14),(96,'img_0267.jpg','original',1024,683,14),(97,'img_0267-w80h80@2x.jpg','admin_thumb',80,80,14),(98,'img_0267-w180@2x.jpg','admin_preview',180,120,14),(99,'img_0276-w620.jpg','feature',620,413,15),(100,'img_0276-w300h300.jpg','square',300,300,15),(101,'img_0276-w1024.jpg','main',1024,683,15),(102,'img_0276-w140h140@2x.jpg','thumb',140,140,15),(103,'img_0276.jpg','original',1024,683,15),(104,'img_0276-w80h80@2x.jpg','admin_thumb',80,80,15),(105,'img_0276-w180@2x.jpg','admin_preview',180,120,15),(106,'img_0280-w620.jpg','feature',620,413,16),(107,'img_0280-w300h300.jpg','square',300,300,16),(108,'img_0280-w1024.jpg','main',1024,683,16),(109,'img_0280-w140h140@2x.jpg','thumb',140,140,16),(110,'img_0280.jpg','original',1024,683,16),(111,'img_0280-w80h80@2x.jpg','admin_thumb',80,80,16),(112,'img_0280-w180@2x.jpg','admin_preview',180,120,16),(113,'img_0306-w620.jpg','feature',620,413,17),(114,'img_0306-w300h300.jpg','square',300,300,17),(115,'img_0306-w1024.jpg','main',1024,683,17),(116,'img_0306-w140h140@2x.jpg','thumb',140,140,17),(117,'img_0306.jpg','original',1024,683,17),(118,'img_0306-w80h80@2x.jpg','admin_thumb',80,80,17),(119,'img_0306-w180@2x.jpg','admin_preview',180,120,17),(120,'img_4309-w620.jpg','feature',620,413,18),(121,'img_4309-w300h300.jpg','square',300,300,18),(122,'img_4309-w1024.jpg','main',1024,683,18),(123,'img_4309-w140h140@2x.jpg','thumb',140,140,18),(124,'img_4309.jpg','original',1024,683,18),(125,'img_4309-w80h80@2x.jpg','admin_thumb',80,80,18),(126,'img_4309-w180@2x.jpg','admin_preview',180,120,18),(127,'img_4310-w620.jpg','feature',620,413,19),(128,'img_4310-w300h300.jpg','square',300,300,19),(129,'img_4310-w1024.jpg','main',1024,683,19),(130,'img_4310-w140h140@2x.jpg','thumb',140,140,19),(131,'img_4310.jpg','original',1024,683,19),(132,'img_4310-w80h80@2x.jpg','admin_thumb',80,80,19),(133,'img_4310-w180@2x.jpg','admin_preview',180,120,19),(134,'img_4311-w620.jpg','feature',620,413,20),(135,'img_4311-w300h300.jpg','square',300,300,20),(136,'img_4311-w1024.jpg','main',1024,683,20),(137,'img_4311-w140h140@2x.jpg','thumb',140,140,20),(138,'img_4311.jpg','original',1024,683,20),(139,'img_4311-w80h80@2x.jpg','admin_thumb',80,80,20),(140,'img_4311-w180@2x.jpg','admin_preview',180,120,20),(141,'img_4316-w620.jpg','feature',620,413,21),(142,'img_4316-w300h300.jpg','square',300,300,21),(143,'img_4316-w1024.jpg','main',1024,683,21),(144,'img_4316-w140h140@2x.jpg','thumb',140,140,21),(145,'img_4316.jpg','original',1024,683,21),(146,'img_4316-w80h80@2x.jpg','admin_thumb',80,80,21),(147,'img_4316-w180@2x.jpg','admin_preview',180,120,21),(148,'img_7847-w620.jpg','feature',620,413,22),(149,'img_7847-w300h300.jpg','square',300,300,22),(150,'img_7847-w1024.jpg','main',1024,683,22),(151,'img_7847-w140h140@2x.jpg','thumb',140,140,22),(152,'img_7847.jpg','original',1024,683,22),(153,'img_7847-w80h80@2x.jpg','admin_thumb',80,80,22),(154,'img_7847-w180@2x.jpg','admin_preview',180,120,22),(155,'img_7848-w620.jpg','feature',620,413,23),(156,'img_7848-w300h300.jpg','square',300,300,23),(157,'img_7848-w1024.jpg','main',1024,683,23),(158,'img_7848-w140h140@2x.jpg','thumb',140,140,23),(159,'img_7848.jpg','original',1024,683,23),(160,'img_7848-w80h80@2x.jpg','admin_thumb',80,80,23),(161,'img_7848-w180@2x.jpg','admin_preview',180,120,23),(162,'img_7853-w620.jpg','feature',620,413,24),(163,'img_7853-w300h300.jpg','square',300,300,24),(164,'img_7853-w1024.jpg','main',1024,683,24),(165,'img_7853-w140h140@2x.jpg','thumb',140,140,24),(166,'img_7853.jpg','original',1024,683,24),(167,'img_7853-w80h80@2x.jpg','admin_thumb',80,80,24),(168,'img_7853-w180@2x.jpg','admin_preview',180,120,24),(169,'img_7877-w620.jpg','feature',620,413,25),(170,'img_7877-w300h300.jpg','square',300,300,25),(171,'img_7877-w1024.jpg','main',1024,683,25),(172,'img_7877-w140h140@2x.jpg','thumb',140,140,25),(173,'img_7877.jpg','original',1024,683,25),(174,'img_7877-w80h80@2x.jpg','admin_thumb',80,80,25),(175,'img_7877-w180@2x.jpg','admin_preview',180,120,25),(176,'img_7879-w620.jpg','feature',620,413,26),(177,'img_7879-w300h300.jpg','square',300,300,26),(178,'img_7879-w1024.jpg','main',1024,683,26),(179,'img_7879-w140h140@2x.jpg','thumb',140,140,26),(180,'img_7879.jpg','original',1024,683,26),(181,'img_7879-w80h80@2x.jpg','admin_thumb',80,80,26),(182,'img_7879-w180@2x.jpg','admin_preview',180,120,26);
/*!40000 ALTER TABLE `perch2_gallery_image_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_gallery_images`
--

DROP TABLE IF EXISTS `perch2_gallery_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_gallery_images`
--

LOCK TABLES `perch2_gallery_images` WRITE;
/*!40000 ALTER TABLE `perch2_gallery_images` DISABLE KEYS */;
INSERT INTO `perch2_gallery_images` VALUES (1,'img_1039','img1039',3,1,NULL,'active','gallery'),(2,'img_1069','img1069',3,2,NULL,'active','gallery'),(3,'img_1084','img1084',3,3,NULL,'active','gallery'),(4,'img_1096','img1096',3,4,NULL,'active','gallery'),(5,'img_1099','img1099',3,5,NULL,'active','gallery'),(6,'img_1102','img1102',3,6,NULL,'active','gallery'),(7,'img_1109','img1109',3,7,NULL,'active','gallery'),(8,'img_1114','img1114',3,8,NULL,'active','gallery'),(9,'img_1117','img1117',3,9,NULL,'active','gallery'),(10,'img_0043','img0043',4,1,NULL,'active','gallery'),(11,'img_0259','img0259',4,2,NULL,'active','gallery'),(12,'img_0260','img0260',4,8,NULL,'active','gallery'),(13,'img_0261','img0261',4,3,NULL,'active','gallery'),(14,'img_0267','img0267',4,4,NULL,'active','gallery'),(15,'img_0276','img0276',4,5,NULL,'active','gallery'),(16,'img_0280','img0280',4,6,NULL,'active','gallery'),(17,'img_0306','img0306',4,7,NULL,'active','gallery'),(18,'img_4309','img4309',2,1,NULL,'active','gallery'),(19,'img_4310','img4310',2,2,NULL,'active','gallery'),(20,'img_4311','img4311',2,3,NULL,'active','gallery'),(21,'img_4316','img4316',2,4,NULL,'active','gallery'),(22,'img_7847','img7847',1,1,NULL,'active','gallery'),(23,'img_7848','img7848',1,2,NULL,'active','gallery'),(24,'img_7853','img7853',1,3,NULL,'active','gallery'),(25,'img_7877','img7877',1,4,NULL,'active','gallery'),(26,'img_7879','img7879',1,5,NULL,'active','gallery');
/*!40000 ALTER TABLE `perch2_gallery_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_members`
--

DROP TABLE IF EXISTS `perch2_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_members`
--

LOCK TABLES `perch2_members` WRITE;
/*!40000 ALTER TABLE `perch2_members` DISABLE KEYS */;
INSERT INTO `perch2_members` VALUES (3,'native','3','flintstone@example.com','$P$BDaR2b5PhqBBjj57Myak4ac4aL13x8.','active','2013-06-10 17:28:09',NULL,'{\"first_name\":\"Fred\",\"last_name\":\"Flintstone\",\"membership_no\":\"123454798\"}');
/*!40000 ALTER TABLE `perch2_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_members_forms`
--

DROP TABLE IF EXISTS `perch2_members_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_members_forms` (
  `formID` int(10) NOT NULL AUTO_INCREMENT,
  `formKey` char(64) NOT NULL DEFAULT '',
  `formTitle` varchar(255) NOT NULL,
  `formSettings` text NOT NULL,
  PRIMARY KEY (`formID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_members_forms`
--

LOCK TABLES `perch2_members_forms` WRITE;
/*!40000 ALTER TABLE `perch2_members_forms` DISABLE KEYS */;
INSERT INTO `perch2_members_forms` VALUES (1,'register.default','Registration form','{\"moderate\":\"1\",\"moderator_email\":\"flintstone@example.com\",\"default_tags\":\"member\"}');
/*!40000 ALTER TABLE `perch2_members_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_members_member_tags`
--

DROP TABLE IF EXISTS `perch2_members_member_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_members_member_tags` (
  `memberID` int(10) NOT NULL,
  `tagID` int(10) NOT NULL,
  `tagExpires` datetime DEFAULT NULL,
  PRIMARY KEY (`memberID`,`tagID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_members_member_tags`
--

LOCK TABLES `perch2_members_member_tags` WRITE;
/*!40000 ALTER TABLE `perch2_members_member_tags` DISABLE KEYS */;
INSERT INTO `perch2_members_member_tags` VALUES (3,1,NULL);
/*!40000 ALTER TABLE `perch2_members_member_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_members_sessions`
--

DROP TABLE IF EXISTS `perch2_members_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_members_sessions` (
  `sessionID` char(40) NOT NULL DEFAULT '',
  `sessionExpires` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `sessionHttpFootprint` char(40) NOT NULL DEFAULT '',
  `memberID` int(10) unsigned NOT NULL DEFAULT '0',
  `sessionData` text NOT NULL,
  PRIMARY KEY (`sessionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_members_sessions`
--

LOCK TABLES `perch2_members_sessions` WRITE;
/*!40000 ALTER TABLE `perch2_members_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_members_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_members_tags`
--

DROP TABLE IF EXISTS `perch2_members_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_members_tags` (
  `tagID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` char(64) NOT NULL DEFAULT '',
  `tagDisplay` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`tagID`),
  KEY `idx_tag` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_members_tags`
--

LOCK TABLES `perch2_members_tags` WRITE;
/*!40000 ALTER TABLE `perch2_members_tags` DISABLE KEYS */;
INSERT INTO `perch2_members_tags` VALUES (1,'member','member');
/*!40000 ALTER TABLE `perch2_members_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_navigation`
--

DROP TABLE IF EXISTS `perch2_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_navigation` (
  `groupID` int(10) NOT NULL AUTO_INCREMENT,
  `groupTitle` varchar(255) NOT NULL DEFAULT '',
  `groupSlug` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`groupID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_navigation`
--

LOCK TABLES `perch2_navigation` WRITE;
/*!40000 ALTER TABLE `perch2_navigation` DISABLE KEYS */;
INSERT INTO `perch2_navigation` VALUES (1,'Members','members');
/*!40000 ALTER TABLE `perch2_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_navigation_pages`
--

DROP TABLE IF EXISTS `perch2_navigation_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_navigation_pages`
--

LOCK TABLES `perch2_navigation_pages` WRITE;
/*!40000 ALTER TABLE `perch2_navigation_pages` DISABLE KEYS */;
INSERT INTO `perch2_navigation_pages` VALUES (1,10,1,0,1,1,'000-000'),(2,11,1,0,1,1,'000-000'),(3,12,1,10,2,2,'000-000-002'),(4,13,1,0,1,2,'000-000'),(5,14,1,0,1,2,'000-000');
/*!40000 ALTER TABLE `perch2_navigation_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_page_templates`
--

DROP TABLE IF EXISTS `perch2_page_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_page_templates` (
  `templateID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `templateTitle` varchar(255) NOT NULL DEFAULT '',
  `templatePath` varchar(255) NOT NULL DEFAULT '',
  `optionsPageID` int(10) unsigned NOT NULL DEFAULT '0',
  `templateReference` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `templateNavGroups` varchar(255) DEFAULT '',
  PRIMARY KEY (`templateID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_page_templates`
--

LOCK TABLES `perch2_page_templates` WRITE;
/*!40000 ALTER TABLE `perch2_page_templates` DISABLE KEYS */;
INSERT INTO `perch2_page_templates` VALUES (1,'Default','default.php',0,1,'');
/*!40000 ALTER TABLE `perch2_page_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_pages`
--

DROP TABLE IF EXISTS `perch2_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `pageCreatorID` int(10) unsigned NOT NULL DEFAULT '0',
  `pageModified` datetime NOT NULL DEFAULT '2014-01-01 00:00:00',
  `pageAttributes` text NOT NULL,
  `pageAttributeTemplate` varchar(255) NOT NULL DEFAULT 'default.html',
  `pageTemplate` char(255) NOT NULL DEFAULT '',
  `templateID` int(10) unsigned NOT NULL DEFAULT '0',
  `pageSubpageTemplates` varchar(255) NOT NULL DEFAULT '',
  `pageCollections` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pageID`),
  KEY `idx_parent` (`pageParentID`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_pages`
--

LOCK TABLES `perch2_pages` WRITE;
/*!40000 ALTER TABLE `perch2_pages` DISABLE KEYS */;
INSERT INTO `perch2_pages` VALUES (1,0,'/index.php','Welcome','Home page',0,1,1,'','000-001','','/',1,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(2,0,'/about/index.php','About','About',0,2,1,'/about','000-002','','/about',0,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(3,0,'/events/index.php','Events','Events',0,3,1,'/events','000-003','','',0,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(4,0,'/gallery/index.php','Gallery','Gallery',0,4,1,'/gallery','000-004','','',0,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(5,0,'/blog/index.php','Blog','Blog',0,5,1,'/blog','000-005','','',0,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(6,0,'/shop/index.php','Shop','Shop',0,7,1,'/shop','000-007','','',0,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(7,0,'/contact/index.php','Contact','Contact',0,6,1,'/contact','000-006','','',0,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(10,0,'/members/index.php','Members','Member Login',0,8,1,'/members','000-009','','/members',1,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(11,0,'/logout','Log out','Log out',0,9,1,'/log-out','000-010','','/',1,0,'member',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(12,10,'/members/register/index.php','Register','Register',0,1,2,'/register','000-009-001','','/',0,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(15,5,'/blog/post.php','Post','Post',0,1,2,'/blog/post','000-005-001','','/blog',1,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(14,10,'/members/reset/index.php','Reset','Reset',0,3,2,'/members/reset','000-009-004','','/members/reset',0,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'','');
/*!40000 ALTER TABLE `perch2_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_resource_log`
--

DROP TABLE IF EXISTS `perch2_resource_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_resource_log` (
  `logID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appID` char(32) NOT NULL DEFAULT 'content',
  `itemFK` char(32) NOT NULL DEFAULT 'itemRowID',
  `itemRowID` int(10) unsigned NOT NULL,
  `resourceID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`logID`),
  UNIQUE KEY `idx_uni` (`appID`,`itemFK`,`itemRowID`,`resourceID`),
  KEY `idx_fk` (`itemFK`,`itemRowID`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_resource_log`
--

LOCK TABLES `perch2_resource_log` WRITE;
/*!40000 ALTER TABLE `perch2_resource_log` DISABLE KEYS */;
INSERT INTO `perch2_resource_log` VALUES (1,'content','itemRowID',51,15),(2,'content','itemRowID',51,16),(3,'content','itemRowID',51,17),(4,'content','itemRowID',63,29),(5,'content','itemRowID',63,30),(6,'content','itemRowID',63,31),(7,'content','itemRowID',76,33),(8,'content','itemRowID',77,34),(9,'content','itemRowID',83,1),(10,'content','itemRowID',83,2),(11,'perch_gallery','albumID',3,38),(12,'perch_gallery','albumID',3,40),(13,'perch_gallery','albumID',3,42),(14,'perch_gallery','albumID',3,44),(15,'perch_gallery','albumID',3,46),(16,'perch_gallery','albumID',3,48),(17,'perch_gallery','albumID',3,50),(18,'perch_gallery','albumID',3,52),(19,'perch_gallery','albumID',3,54),(20,'perch_gallery','albumID',4,56),(21,'perch_gallery','albumID',4,58),(22,'perch_gallery','albumID',4,60),(23,'perch_gallery','albumID',4,62),(24,'perch_gallery','albumID',4,64),(25,'perch_gallery','albumID',4,66),(26,'perch_gallery','albumID',4,68),(27,'perch_gallery','albumID',4,70),(28,'perch_gallery','albumID',2,72),(29,'perch_gallery','albumID',2,74),(30,'perch_gallery','albumID',2,76),(31,'perch_gallery','albumID',2,78),(32,'perch_gallery','albumID',1,80),(33,'perch_gallery','albumID',1,82),(34,'perch_gallery','albumID',1,84),(35,'perch_gallery','albumID',1,86),(36,'perch_gallery','albumID',1,88),(37,'perch_blog','postID',2,22),(38,'perch_blog','postID',2,23),(39,'perch_blog','postID',2,24),(40,'perch_blog','postID',2,25);
/*!40000 ALTER TABLE `perch2_resource_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_resource_tags`
--

DROP TABLE IF EXISTS `perch2_resource_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_resource_tags` (
  `tagID` int(10) NOT NULL AUTO_INCREMENT,
  `tagTitle` varchar(255) NOT NULL DEFAULT '',
  `tagSlug` varchar(255) NOT NULL DEFAULT '',
  `tagCount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tagID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_resource_tags`
--

LOCK TABLES `perch2_resource_tags` WRITE;
/*!40000 ALTER TABLE `perch2_resource_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_resource_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_resources`
--

DROP TABLE IF EXISTS `perch2_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_resources` (
  `resourceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resourceApp` char(32) NOT NULL DEFAULT 'content',
  `resourceBucket` char(16) NOT NULL DEFAULT 'default',
  `resourceFile` char(255) NOT NULL DEFAULT '',
  `resourceKey` enum('orig','thumb') DEFAULT NULL,
  `resourceParentID` int(10) NOT NULL DEFAULT '0',
  `resourceType` char(4) NOT NULL DEFAULT '',
  `resourceCreated` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `resourceUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `resourceAWOL` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `resourceTitle` char(255) DEFAULT NULL,
  `resourceFileSize` int(10) unsigned DEFAULT NULL,
  `resourceWidth` int(10) unsigned DEFAULT NULL,
  `resourceHeight` int(10) unsigned DEFAULT NULL,
  `resourceCrop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `resourceDensity` float NOT NULL DEFAULT '1',
  `resourceTargetWidth` int(10) unsigned DEFAULT NULL,
  `resourceTargetHeight` int(10) unsigned DEFAULT NULL,
  `resourceMimeType` char(64) DEFAULT NULL,
  `resourceInLibrary` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`resourceID`),
  UNIQUE KEY `idx_file` (`resourceBucket`,`resourceFile`),
  KEY `idx_app` (`resourceApp`),
  KEY `idx_key` (`resourceKey`),
  KEY `idx_type` (`resourceType`),
  KEY `idx_awol` (`resourceAWOL`),
  KEY `idx_library` (`resourceInLibrary`),
  FULLTEXT KEY `idx_search` (`resourceTitle`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_resources`
--

LOCK TABLES `perch2_resources` WRITE;
/*!40000 ALTER TABLE `perch2_resources` DISABLE KEYS */;
INSERT INTO `perch2_resources` VALUES (1,'content','default','home-banner.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Home banner',34130,1200,350,0,1,NULL,NULL,'image/jpeg',0),(2,'content','default','home-banner-thumb.jpg','thumb',1,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,1504,150,43,0,1,150,150,'image/jpeg',0),(37,'perch_shop','default','dscf0729-w600h600@2x.jpg','',35,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,199735,600,600,1,2,600,600,'image/jpeg',0),(36,'perch_shop','default','dscf0729-thumb.jpg','thumb',35,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,5484,150,112,0,1,150,150,'image/jpeg',0),(35,'perch_shop','default','dscf0729.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Dscf0729',128838,1024,768,0,1,NULL,NULL,'image/jpeg',0),(33,'content','members','annual-report.pdf','orig',0,'pdf','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Annual report',23364,NULL,NULL,0,1,NULL,NULL,'',0),(15,'content','default','img1069-2.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Img1069 2',186483,1024,683,0,1,NULL,NULL,'image/jpeg',0),(16,'content','default','img1069-2-thumb.jpg','thumb',15,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,6800,150,100,0,1,150,150,'image/jpeg',0),(17,'content','default','img1069-2-w280.jpg','',15,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,15540,280,186,0,1,280,NULL,'image/jpeg',0),(18,'perch_blog','default','img0306.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Img0306',173741,1024,683,0,1,NULL,NULL,'image/jpeg',0),(19,'perch_blog','default','img0306-thumb.jpg','thumb',18,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,6205,150,100,0,1,150,150,'image/jpeg',0),(20,'perch_blog','default','img0306-w320h240.jpg','',18,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,19312,320,240,1,1,320,240,'image/jpeg',0),(21,'perch_blog','default','img0306-w50h50.jpg','',18,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,1703,50,50,1,1,50,50,'image/jpeg',0),(22,'perch_blog','default','img0306-1.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Img0306 1',173741,1024,683,0,1,NULL,NULL,'image/jpeg',0),(23,'perch_blog','default','img0306-1-thumb.jpg','thumb',22,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,6205,150,100,0,1,150,150,'image/jpeg',0),(24,'perch_blog','default','img0306-1-w500.jpg','',22,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,35426,500,333,0,1,500,NULL,'image/jpeg',0),(25,'perch_blog','default','img0306-1-w140h140@2x.jpg','',22,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,18660,140,140,1,2,140,140,'image/jpeg',0),(26,'perch_shop','default','img0259.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Img0259',152263,1024,683,0,1,NULL,NULL,'image/jpeg',0),(27,'perch_shop','default','img0259-thumb.jpg','thumb',26,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,4770,150,100,0,1,150,150,'image/jpeg',0),(28,'perch_shop','default','img0259-w600h600@2x.jpg','',26,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,149670,600,600,1,2,600,600,'image/jpeg',0),(29,'content','default','img0043.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Img0043',304542,1024,683,0,1,NULL,NULL,'image/jpeg',0),(30,'content','default','img0043-thumb.jpg','thumb',29,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,7288,150,100,0,1,150,150,'image/jpeg',0),(31,'content','default','img0043-w280.jpg','',29,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,20868,280,186,0,1,280,NULL,'image/jpeg',0),(34,'content','members','training-plan.pdf','orig',0,'pdf','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Training plan',30553,NULL,NULL,0,1,NULL,NULL,'',0),(38,'perch_gallery','gallery','img_1039.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1039',113452,1024,682,0,1,NULL,NULL,'image/jpeg',0),(39,'perch_gallery','gallery','img_1039-w80h80@2x.jpg','thumb',38,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1039',9674,80,80,1,2,80,80,'image/jpeg',0),(40,'perch_gallery','gallery','img_1069.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1069',99165,1024,683,0,1,NULL,NULL,'image/jpeg',0),(41,'perch_gallery','gallery','img_1069-w80h80@2x.jpg','thumb',40,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1069',8381,80,80,1,2,80,80,'image/jpeg',0),(42,'perch_gallery','gallery','img_1084.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1084',141340,1024,683,0,1,NULL,NULL,'image/jpeg',0),(43,'perch_gallery','gallery','img_1084-w80h80@2x.jpg','thumb',42,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1084',11254,80,80,1,2,80,80,'image/jpeg',0),(44,'perch_gallery','gallery','img_1096.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1096',108993,1024,683,0,1,NULL,NULL,'image/jpeg',0),(45,'perch_gallery','gallery','img_1096-w80h80@2x.jpg','thumb',44,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1096',9545,80,80,1,2,80,80,'image/jpeg',0),(46,'perch_gallery','gallery','img_1099.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1099',135604,1024,683,0,1,NULL,NULL,'image/jpeg',0),(47,'perch_gallery','gallery','img_1099-w80h80@2x.jpg','thumb',46,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1099',10976,80,80,1,2,80,80,'image/jpeg',0),(48,'perch_gallery','gallery','img_1102.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1102',122486,1024,683,0,1,NULL,NULL,'image/jpeg',0),(49,'perch_gallery','gallery','img_1102-w80h80@2x.jpg','thumb',48,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1102',9802,80,80,1,2,80,80,'image/jpeg',0),(50,'perch_gallery','gallery','img_1109.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1109',166683,1024,683,0,1,NULL,NULL,'image/jpeg',0),(51,'perch_gallery','gallery','img_1109-w80h80@2x.jpg','thumb',50,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1109',12122,80,80,1,2,80,80,'image/jpeg',0),(52,'perch_gallery','gallery','img_1114.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1114',146209,1024,682,0,1,NULL,NULL,'image/jpeg',0),(53,'perch_gallery','gallery','img_1114-w80h80@2x.jpg','thumb',52,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1114',10460,80,80,1,2,80,80,'image/jpeg',0),(54,'perch_gallery','gallery','img_1117.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1117',145805,1024,683,0,1,NULL,NULL,'image/jpeg',0),(55,'perch_gallery','gallery','img_1117-w80h80@2x.jpg','thumb',54,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1117',11313,80,80,1,2,80,80,'image/jpeg',0),(56,'perch_gallery','gallery','img_0043.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0043',179085,1024,683,0,1,NULL,NULL,'image/jpeg',0),(57,'perch_gallery','gallery','img_0043-w80h80@2x.jpg','thumb',56,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0043',10643,80,80,1,2,80,80,'image/jpeg',0),(58,'perch_gallery','gallery','img_0259.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0259',69687,1024,683,0,1,NULL,NULL,'image/jpeg',0),(59,'perch_gallery','gallery','img_0259-w80h80@2x.jpg','thumb',58,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0259',6630,80,80,1,2,80,80,'image/jpeg',0),(60,'perch_gallery','gallery','img_0260.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0260',155207,1024,683,0,1,NULL,NULL,'image/jpeg',0),(61,'perch_gallery','gallery','img_0260-w80h80@2x.jpg','thumb',60,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0260',7900,80,80,1,2,80,80,'image/jpeg',0),(62,'perch_gallery','gallery','img_0261.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0261',82328,1024,683,0,1,NULL,NULL,'image/jpeg',0),(63,'perch_gallery','gallery','img_0261-w80h80@2x.jpg','thumb',62,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0261',8035,80,80,1,2,80,80,'image/jpeg',0),(64,'perch_gallery','gallery','img_0267.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0267',55609,1024,683,0,1,NULL,NULL,'image/jpeg',0),(65,'perch_gallery','gallery','img_0267-w80h80@2x.jpg','thumb',64,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0267',5523,80,80,1,2,80,80,'image/jpeg',0),(66,'perch_gallery','gallery','img_0276.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0276',66137,1024,683,0,1,NULL,NULL,'image/jpeg',0),(67,'perch_gallery','gallery','img_0276-w80h80@2x.jpg','thumb',66,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0276',6233,80,80,1,2,80,80,'image/jpeg',0),(68,'perch_gallery','gallery','img_0280.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_0280',91372,1024,683,0,1,NULL,NULL,'image/jpeg',0),(69,'perch_gallery','gallery','img_0280-w80h80@2x.jpg','thumb',68,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_0280',7717,80,80,1,2,80,80,'image/jpeg',0),(70,'perch_gallery','gallery','img_0306.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_0306',93193,1024,683,0,1,NULL,NULL,'image/jpeg',0),(71,'perch_gallery','gallery','img_0306-w80h80@2x.jpg','thumb',70,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_0306',7977,80,80,1,2,80,80,'image/jpeg',0),(72,'perch_gallery','gallery','img_4309.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4309',131459,1024,683,0,1,NULL,NULL,'image/jpeg',0),(73,'perch_gallery','gallery','img_4309-w80h80@2x.jpg','thumb',72,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4309',10036,80,80,1,2,80,80,'image/jpeg',0),(74,'perch_gallery','gallery','img_4310.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4310',120746,1024,683,0,1,NULL,NULL,'image/jpeg',0),(75,'perch_gallery','gallery','img_4310-w80h80@2x.jpg','thumb',74,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4310',10776,80,80,1,2,80,80,'image/jpeg',0),(76,'perch_gallery','gallery','img_4311.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4311',99579,1024,683,0,1,NULL,NULL,'image/jpeg',0),(77,'perch_gallery','gallery','img_4311-w80h80@2x.jpg','thumb',76,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4311',9978,80,80,1,2,80,80,'image/jpeg',0),(78,'perch_gallery','gallery','img_4316.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4316',158784,1024,683,0,1,NULL,NULL,'image/jpeg',0),(79,'perch_gallery','gallery','img_4316-w80h80@2x.jpg','thumb',78,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4316',11040,80,80,1,2,80,80,'image/jpeg',0),(80,'perch_gallery','gallery','img_7847.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7847',178906,1024,683,0,1,NULL,NULL,'image/jpeg',0),(81,'perch_gallery','gallery','img_7847-w80h80@2x.jpg','thumb',80,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7847',11001,80,80,1,2,80,80,'image/jpeg',0),(82,'perch_gallery','gallery','img_7848.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7848',114959,1024,683,0,1,NULL,NULL,'image/jpeg',0),(83,'perch_gallery','gallery','img_7848-w80h80@2x.jpg','thumb',82,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7848',10397,80,80,1,2,80,80,'image/jpeg',0),(84,'perch_gallery','gallery','img_7853.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7853',96050,1024,683,0,1,NULL,NULL,'image/jpeg',0),(85,'perch_gallery','gallery','img_7853-w80h80@2x.jpg','thumb',84,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7853',8594,80,80,1,2,80,80,'image/jpeg',0),(86,'perch_gallery','gallery','img_7877.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7877',106646,1024,683,0,1,NULL,NULL,'image/jpeg',0),(87,'perch_gallery','gallery','img_7877-w80h80@2x.jpg','thumb',86,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7877',9061,80,80,1,2,80,80,'image/jpeg',0),(88,'perch_gallery','gallery','img_7879.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7879',175047,1024,683,0,1,NULL,NULL,'image/jpeg',0),(89,'perch_gallery','gallery','img_7879-w80h80@2x.jpg','thumb',88,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7879',9661,80,80,1,2,80,80,'image/jpeg',0);
/*!40000 ALTER TABLE `perch2_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_resources_to_tags`
--

DROP TABLE IF EXISTS `perch2_resources_to_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_resources_to_tags` (
  `resourceID` int(10) NOT NULL DEFAULT '0',
  `tagID` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resourceID`,`tagID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_resources_to_tags`
--

LOCK TABLES `perch2_resources_to_tags` WRITE;
/*!40000 ALTER TABLE `perch2_resources_to_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_resources_to_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_settings`
--

DROP TABLE IF EXISTS `perch2_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_settings` (
  `settingID` varchar(60) NOT NULL DEFAULT '',
  `userID` int(10) unsigned NOT NULL DEFAULT '0',
  `settingValue` text NOT NULL,
  PRIMARY KEY (`settingID`,`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_settings`
--

LOCK TABLES `perch2_settings` WRITE;
/*!40000 ALTER TABLE `perch2_settings` DISABLE KEYS */;
INSERT INTO `perch2_settings` VALUES ('headerColour',0,'#272727'),('content_singlePageEdit',0,'1'),('helpURL',0,'http://docs.grabaperch.com/demo/nest'),('siteURL',0,'/'),('hideBranding',0,'1'),('content_collapseList',0,'1'),('lang',0,'en-gb'),('update_2.2.4',0,'done'),('latest_version',0,'2.5.3'),('perch_blog_post_url',0,'/blog/{postSlug}/'),('perch_blog_update',0,'5.0'),('update_2.2.6',0,'done'),('perch_gallery_update',0,'2.7'),('headerScheme',0,'dark'),('perch_blog_slug_format',0,'{postID}-{postTitle}'),('perch_blog_akismet_key',0,''),('perch_events_detail_url',0,'/events/event.php?event={eventSlug}'),('perch_gallery_bucket_mode',0,'single'),('perch_gallery_bucket',0,'gallery'),('dashboard',0,'1'),('content_hideNonEditableRegions',0,'0'),('perch_blog_comment_notify',0,'0'),('perch_gallery_basicUpload',0,'0'),('perch_members_login_page',0,'/members/login.php?r={returnURL}'),('perch_shop_paypal_email',0,''),('perch_shop_product_url',0,'/shop/product.php?s={productSlug}'),('perch_shop_display_oos',0,'0'),('update_2.2.9',0,'done'),('dashboard_order',1,'perch_blog,perch_gallery,content,perch_forms,perch_events'),('update_2.3.1',0,'done'),('perch_events_update',0,'1.8'),('on_sale_version',0,'2.7.10'),('update_2.4.4',0,'done'),('update_2.5.3',0,'done'),('update_2.6.4',0,'done'),('update_2.6.5',0,'done'),('update_2.7.10',0,'done');
/*!40000 ALTER TABLE `perch2_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_categories`
--

DROP TABLE IF EXISTS `perch2_shop_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryTitle` varchar(255) NOT NULL DEFAULT '',
  `categorySlug` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryID`),
  KEY `idx_slug` (`categorySlug`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_categories`
--

LOCK TABLES `perch2_shop_categories` WRITE;
/*!40000 ALTER TABLE `perch2_shop_categories` DISABLE KEYS */;
INSERT INTO `perch2_shop_categories` VALUES (1,'Clothing','clothing'),(2,'Merchandise','merchandise');
/*!40000 ALTER TABLE `perch2_shop_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_log`
--

DROP TABLE IF EXISTS `perch2_shop_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_log` (
  `logID` int(11) NOT NULL AUTO_INCREMENT,
  `logData` text,
  `logDateTime` datetime DEFAULT NULL,
  `logTransaction` varchar(255) DEFAULT '',
  `logVerify` varchar(255) DEFAULT '',
  PRIMARY KEY (`logID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_log`
--

LOCK TABLES `perch2_shop_log` WRITE;
/*!40000 ALTER TABLE `perch2_shop_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_shop_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_orders`
--

DROP TABLE IF EXISTS `perch2_shop_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_orders`
--

LOCK TABLES `perch2_shop_orders` WRITE;
/*!40000 ALTER TABLE `perch2_shop_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_shop_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_product_options`
--

DROP TABLE IF EXISTS `perch2_shop_product_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_product_options` (
  `optionID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL DEFAULT '0',
  `optionKey` varchar(255) NOT NULL DEFAULT '',
  `optionValues` text,
  PRIMARY KEY (`optionID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_product_options`
--

LOCK TABLES `perch2_shop_product_options` WRITE;
/*!40000 ALTER TABLE `perch2_shop_product_options` DISABLE KEYS */;
INSERT INTO `perch2_shop_product_options` VALUES (1,2,'Size','S,M,L,XL,XXL'),(2,3,'Race','Reading Half, Wycombe 10k, London Marathon');
/*!40000 ALTER TABLE `perch2_shop_product_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_products`
--

DROP TABLE IF EXISTS `perch2_shop_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_products`
--

LOCK TABLES `perch2_shop_products` WRITE;
/*!40000 ALTER TABLE `perch2_shop_products` DISABLE KEYS */;
INSERT INTO `perch2_shop_products` VALUES (2,'NESTVEST1','Club Vest','club-vest','All members running on behalf of the club in an organised race are asked to wear the club vest. It\'s a small outlay, but you have to wear _something_, right? (Please, wear _something_.)','<p>All members running on behalf of the club in an organised race are asked to wear the club vest. It&#8217;s a small outlay, but you have to wear <em>something</em>, right? (Please, wear <em>something</em>.)</p>','{\"productTitle\":\"Club Vest\",\"productImage\":{\"_default\":\"\\/perch\\/resources\\/img0259.jpg\",\"path\":\"img0259.jpg\",\"size\":169219,\"bucket\":\"default\",\"w\":1024,\"h\":683,\"sizes\":{\"thumb\":{\"w\":150,\"h\":100,\"path\":\"img0259-thumb.jpg\",\"size\":5155,\"mime\":\"image\\/jpeg\"},\"w600h600c1@2x\":{\"w\":600,\"h\":600,\"density\":\"2\",\"path\":\"img0259-w600h600@2x.jpg\",\"size\":159715,\"mime\":\"image\\/jpeg\"}}},\"productCode\":\"NESTVEST1\",\"productPrice\":\"24.99\"}','Live',20,24.99),(3,'MEDAL01','Fake Race Medal','fake-race-medal','Did you fail to finish a race, but need others to think you did? No problem! Pick up your fake race medal here.','<p>Did you fail to finish a race, but need others to think you did? No problem! Pick up your fake race medal here.</p>','{\"productTitle\":\"Fake Race Medal\",\"productImage\":{\"_default\":\"\\/perch\\/resources\\/dscf0729.jpg\",\"path\":\"dscf0729.jpg\",\"size\":131389,\"bucket\":\"default\",\"w\":1024,\"h\":768,\"sizes\":{\"thumb\":{\"w\":150,\"h\":112,\"path\":\"dscf0729-thumb.jpg\",\"size\":5886,\"mime\":\"image\\/jpeg\"},\"w600h600c1@2x\":{\"w\":600,\"h\":600,\"density\":\"2\",\"path\":\"dscf0729-w600h600@2x.jpg\",\"size\":210345,\"mime\":\"image\\/jpeg\"}}},\"productCode\":\"MEDAL01\",\"productPrice\":\"19.99\"}','Live',12,19.99);
/*!40000 ALTER TABLE `perch2_shop_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_products_to_categories`
--

DROP TABLE IF EXISTS `perch2_shop_products_to_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_products_to_categories` (
  `productID` int(11) NOT NULL DEFAULT '0',
  `categoryID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`productID`,`categoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_products_to_categories`
--

LOCK TABLES `perch2_shop_products_to_categories` WRITE;
/*!40000 ALTER TABLE `perch2_shop_products_to_categories` DISABLE KEYS */;
INSERT INTO `perch2_shop_products_to_categories` VALUES (2,1),(3,2);
/*!40000 ALTER TABLE `perch2_shop_products_to_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_user_privileges`
--

DROP TABLE IF EXISTS `perch2_user_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_user_privileges` (
  `privID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `privKey` varchar(255) NOT NULL DEFAULT '',
  `privTitle` varchar(255) NOT NULL DEFAULT '',
  `privOrder` int(10) unsigned NOT NULL DEFAULT '99',
  PRIMARY KEY (`privID`),
  UNIQUE KEY `idx_key` (`privKey`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_user_privileges`
--

LOCK TABLES `perch2_user_privileges` WRITE;
/*!40000 ALTER TABLE `perch2_user_privileges` DISABLE KEYS */;
INSERT INTO `perch2_user_privileges` VALUES (1,'perch.login','Log in',1),(2,'perch.settings','Change settings',2),(3,'perch.users.manage','Manage users',3),(4,'perch.updatenotices','View update notices',4),(5,'content.regions.delete','Delete regions',1),(6,'content.regions.options','Edit region options',2),(7,'content.pages.edit','Edit page details',1),(8,'content.pages.reorder','Reorder pages',2),(9,'content.pages.create','Add new pages',3),(10,'content.pages.configure','Configure page settings',5),(11,'content.pages.delete','Delete pages',4),(12,'content.templates.delete','Delete master pages',6),(13,'content.navgroups.configure','Configure navigation groups',7),(14,'content.navgroups.create','Create navigation groups',8),(15,'content.navgroups.delete','Delete navigation groups',9),(16,'perch_events','Access events',1),(17,'perch_events.categories.manage','Manage categories',1),(18,'perch_blog','Access the blog',1),(19,'perch_blog.post.create','Create posts',1),(20,'perch_blog.post.delete','Delete posts',1),(21,'perch_blog.post.publish','Publish posts',1),(22,'perch_blog.comments.moderate','Moderate comments',1),(23,'perch_blog.comments.enable','Enable comments on a post',1),(24,'perch_blog.categories.manage','Manage categories',1),(25,'perch_blog.import','Import data',1),(26,'perch_blog.authors.manage','Manage authors',1),(27,'content.pages.republish','Republish pages',12),(28,'perch_gallery','Access the gallery',1),(29,'perch_gallery.album.create','Create albums',1),(30,'perch_gallery.image.upload','Upload images',1),(31,'perch_forms','Access forms',1),(32,'perch_forms.configure','Configure forms',1),(33,'perch_forms.delete','Delete forms',1),(34,'perch_shop','Access shop',1),(35,'perch_shop.categories.manage','Manage categories',1),(36,'perch_members','Manage members',1),(37,'content.pages.create.toplevel','Add new top-level pages',3),(38,'content.pages.delete.own','Delete pages they created themselves',4),(39,'content.templates.configure','Configure master pages',6),(40,'content.pages.attributes','Edit page titles and attributes',6),(41,'assets.create','Upload assets',1),(42,'perch_blog.sections.manage','Manage sections',1),(43,'categories.create','Create new categories',1),(44,'categories.delete','Delete categories',2),(45,'categories.manage','Manage categories',3),(46,'categories.sets.create','Create category sets',4),(47,'categories.sets.delete','Delete category sets',5);
/*!40000 ALTER TABLE `perch2_user_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_user_role_privileges`
--

DROP TABLE IF EXISTS `perch2_user_role_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_user_role_privileges` (
  `roleID` int(10) unsigned NOT NULL,
  `privID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`roleID`,`privID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_user_role_privileges`
--

LOCK TABLES `perch2_user_role_privileges` WRITE;
/*!40000 ALTER TABLE `perch2_user_role_privileges` DISABLE KEYS */;
INSERT INTO `perch2_user_role_privileges` VALUES (1,1),(1,7),(1,8),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12);
/*!40000 ALTER TABLE `perch2_user_role_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_user_roles`
--

DROP TABLE IF EXISTS `perch2_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_user_roles` (
  `roleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleTitle` varchar(255) NOT NULL DEFAULT '',
  `roleSlug` varchar(255) NOT NULL DEFAULT '',
  `roleMasterAdmin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_user_roles`
--

LOCK TABLES `perch2_user_roles` WRITE;
/*!40000 ALTER TABLE `perch2_user_roles` DISABLE KEYS */;
INSERT INTO `perch2_user_roles` VALUES (1,'Editor','editor',0),(2,'Admin','admin',1);
/*!40000 ALTER TABLE `perch2_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_users`
--

DROP TABLE IF EXISTS `perch2_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_users`
--

LOCK TABLES `perch2_users` WRITE;
/*!40000 ALTER TABLE `perch2_users` DISABLE KEYS */;
INSERT INTO `perch2_users` VALUES (1,'{username}','$P$B20jI.PtwnmvUnYE19qC3iedFvrKZt.','2013-04-30 13:11:53','2015-01-30 09:17:59','2015-01-30 09:17:06','{firstname}','{lastname}','{email}',1,'61da7a44872c36e5eef0dfecac057a8b',2,1);
/*!40000 ALTER TABLE `perch2_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-30  1:23:25
