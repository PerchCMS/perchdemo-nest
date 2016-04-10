-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_demo_nest
-- ------------------------------------------------------
-- Server version	5.5.47-0+deb7u1

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
-- Table structure for table `perch2_backup_plans`
--

DROP TABLE IF EXISTS `perch2_backup_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_backup_plans` (
  `planID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `planTitle` char(255) NOT NULL DEFAULT '',
  `planRole` enum('all','db') NOT NULL DEFAULT 'all',
  `planCreated` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `planCreatedBy` char(32) NOT NULL DEFAULT '',
  `planUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `planUpdatedBy` char(32) NOT NULL DEFAULT '',
  `planActive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `planDynamicFields` text NOT NULL,
  `planFrequency` int(10) unsigned NOT NULL DEFAULT '24',
  `planBucket` char(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`planID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_backup_plans`
--

LOCK TABLES `perch2_backup_plans` WRITE;
/*!40000 ALTER TABLE `perch2_backup_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_backup_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_backup_resources`
--

DROP TABLE IF EXISTS `perch2_backup_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_backup_resources` (
  `planID` int(10) unsigned NOT NULL,
  `resourceID` int(10) unsigned NOT NULL,
  `runID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`planID`,`resourceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_backup_resources`
--

LOCK TABLES `perch2_backup_resources` WRITE;
/*!40000 ALTER TABLE `perch2_backup_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_backup_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_backup_runs`
--

DROP TABLE IF EXISTS `perch2_backup_runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_backup_runs` (
  `runID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `planID` int(10) unsigned NOT NULL,
  `runDateTime` datetime NOT NULL,
  `runType` enum('db','resources') NOT NULL DEFAULT 'resources',
  `runResult` enum('OK','FAILED','IN PROGRESS') NOT NULL DEFAULT 'OK',
  `runMessage` char(255) NOT NULL DEFAULT '',
  `runDbFile` char(255) NOT NULL,
  PRIMARY KEY (`runID`),
  KEY `idx_plan` (`planID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_backup_runs`
--

LOCK TABLES `perch2_backup_runs` WRITE;
/*!40000 ALTER TABLE `perch2_backup_runs` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_backup_runs` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `perch2_blog_authors` VALUES (1,'REPLACE_firstname','REPLACE_lastname','REPLACE_hello@grabaperch.com',4,'REPLACE_username',NULL,NULL);
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
INSERT INTO `perch2_blog_comments` VALUES (1,2,'Drew McLellan','hello@grabaperch.com','',2130706433,'2013-06-22 16:03:50','<p>Brilliant! Last year was so good, despite the calling problems. To be honest, I think that was mostly down to the caller not knowing their left from their right. But anyway, I&#8217;ll be contacting Jan for my tickets!</p>','LIVE','{\"fields\":{\"name\":\"Drew McLellan\",\"email\":\"hello@grabaperch.com\",\"body\":\"Brilliant! Last year was so good, despite the calling problems. To be honest, I think that was mostly down to the caller not knowing their left from their right. But anyway, I\'ll be contacting Jan for my tickets!\"},\"environment\":{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"perchdemo-nest.rocker.eoms\",\"HTTP_CONNECTION\":\"keep-alive\",\"CONTENT_LENGTH\":\"419\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"HTTP_ORIGIN\":\"http:\\/\\/perchdemo-nest.rocker.eoms\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/29.0.1545.0 Safari\\/537.36\",\"CONTENT_TYPE\":\"application\\/x-www-form-urlencoded\",\"HTTP_REFERER\":\"http:\\/\\/perchdemo-nest.rocker.eoms\\/blog\\/2-tickets-on-sale-for-july-social\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate,sdch\",\"HTTP_ACCEPT_LANGUAGE\":\"en-US,en;q=0.8\",\"HTTP_COOKIE\":\"mp_aca1134b1691f97fca23dd82df07fa8f_mixpanel=%7B%22distinct_id%22%3A%20%2213db1092e6c1-0a8cfd912-67570c2a-384000-13db1092e6e8e8%22%2C%22%24initial_referrer%22%3A%20%22%24direct%22%2C%22%24initial_referring_domain%22%3A%20%22%24direct%22%7D; p_m=e307daeb6227c520ad0dcd47447632bde214bbc9; PHPSESSID=0d85c260dc2acb5995b3eac6e8ed0d4b; cmssb=0\",\"PATH\":\"\\/usr\\/bin:\\/bin:\\/usr\\/sbin:\\/sbin\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"perchdemo-nest.rocker.eoms\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\",\"SERVER_ADMIN\":\"you@example.com\",\"SCRIPT_FILENAME\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\\/blog\\/post.php\",\"REMOTE_PORT\":\"58975\",\"REDIRECT_QUERY_STRING\":\"s=2-tickets-on-sale-for-july-social\",\"REDIRECT_URL\":\"\\/blog\\/2-tickets-on-sale-for-july-social\\/\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"POST\",\"QUERY_STRING\":\"s=2-tickets-on-sale-for-july-social\",\"REQUEST_URI\":\"\\/blog\\/2-tickets-on-sale-for-july-social\\/\",\"SCRIPT_NAME\":\"\\/blog\\/post.php\",\"PHP_SELF\":\"\\/blog\\/post.php\",\"REQUEST_TIME_FLOAT\":1371913430.75,\"REQUEST_TIME\":1371913430,\"argv\":[\"s=2-tickets-on-sale-for-july-social\"],\"argc\":1}}','{\"submitComment\":\"Submit\"}'),(2,4,'Drew McLellan','hello@grabaperch.com','',2130706433,'2013-06-22 16:04:20','<p>Well done, REPLACE_firstname! You&#8217;re very brave.</p>','LIVE','{\"fields\":{\"name\":\"Drew McLellan\",\"email\":\"hello@grabaperch.com\",\"body\":\"Well done, REPLACE_firstname! You\'re very brave.\"},\"environment\":{\"REDIRECT_STATUS\":\"200\",\"HTTP_HOST\":\"perchdemo-nest.rocker.eoms\",\"HTTP_CONNECTION\":\"keep-alive\",\"CONTENT_LENGTH\":\"247\",\"HTTP_CACHE_CONTROL\":\"no-cache\",\"HTTP_PRAGMA\":\"no-cache\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"HTTP_ORIGIN\":\"http:\\/\\/perchdemo-nest.rocker.eoms\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/29.0.1545.0 Safari\\/537.36\",\"CONTENT_TYPE\":\"application\\/x-www-form-urlencoded\",\"HTTP_REFERER\":\"http:\\/\\/perchdemo-nest.rocker.eoms\\/blog\\/4-meet-our-new-chairman\\/\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate,sdch\",\"HTTP_ACCEPT_LANGUAGE\":\"en-US,en;q=0.8\",\"HTTP_COOKIE\":\"mp_aca1134b1691f97fca23dd82df07fa8f_mixpanel=%7B%22distinct_id%22%3A%20%2213db1092e6c1-0a8cfd912-67570c2a-384000-13db1092e6e8e8%22%2C%22%24initial_referrer%22%3A%20%22%24direct%22%2C%22%24initial_referring_domain%22%3A%20%22%24direct%22%7D; p_m=e307daeb6227c520ad0dcd47447632bde214bbc9; PHPSESSID=0d85c260dc2acb5995b3eac6e8ed0d4b; cmssb=0\",\"PATH\":\"\\/usr\\/bin:\\/bin:\\/usr\\/sbin:\\/sbin\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"perchdemo-nest.rocker.eoms\",\"SERVER_ADDR\":\"127.0.0.1\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"127.0.0.1\",\"DOCUMENT_ROOT\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\",\"SERVER_ADMIN\":\"you@example.com\",\"SCRIPT_FILENAME\":\"\\/Users\\/drew\\/Sites\\/eoms\\/perchdemo-nest\\/public_html\\/blog\\/post.php\",\"REMOTE_PORT\":\"58991\",\"REDIRECT_QUERY_STRING\":\"s=4-meet-our-new-chairman\",\"REDIRECT_URL\":\"\\/blog\\/4-meet-our-new-chairman\\/\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"POST\",\"QUERY_STRING\":\"s=4-meet-our-new-chairman\",\"REQUEST_URI\":\"\\/blog\\/4-meet-our-new-chairman\\/\",\"SCRIPT_NAME\":\"\\/blog\\/post.php\",\"PHP_SELF\":\"\\/blog\\/post.php\",\"REQUEST_TIME_FLOAT\":1371913460.37,\"REQUEST_TIME\":1371913460,\"argv\":[\"s=4-meet-our-new-chairman\"],\"argc\":1}}','{\"submitComment\":\"Submit\"}');
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
) ENGINE=MyISAM AUTO_INCREMENT=474 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_blog_index`
--

LOCK TABLES `perch2_blog_index` WRITE;
/*!40000 ALTER TABLE `perch2_blog_index` DISABLE KEYS */;
INSERT INTO `perch2_blog_index` VALUES (473,'postID',2,'_id','2'),(472,'postID',2,'postURL','/blog/2-tickets-on-sale-for-july-social/'),(471,'postID',2,'itemRowID',''),(470,'postID',2,'itemID',''),(469,'postID',2,'postMetaTemplate','post_meta.html'),(468,'postID',2,'postTemplate','post.html'),(467,'postID',2,'postAllowComments','1'),(466,'postID',2,'postLegacyURL',''),(465,'postID',2,'postImportID',''),(464,'postID',2,'postCommentCount','1'),(463,'postID',2,'sectionID','1'),(462,'postID',2,'authorID','1'),(461,'postID',2,'postStatus','Published'),(460,'postID',2,'postTags',''),(459,'postID',2,'postDescHTML','<p>Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Appleseed once again. There will be a barn dance with live band and an expert caller. We’ve learned our lesson f'),(458,'postID',2,'postDescRaw','Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Appleseed once again. There will be a barn dance with live band and an expert caller. We\'ve learned our lesson from l'),(457,'postID',2,'postDateTime','2013-05-28'),(456,'postID',2,'postSlug','2-tickets-on-sale-for-july-social'),(455,'postID',2,'postTitle','Tickets on sale for July Social'),(454,'postID',2,'blogID','1'),(453,'postID',2,'postID','2'),(452,'postID',2,'image','/perch/resources/img0306-1.jpg'),(398,'postID',4,'itemID',''),(397,'postID',4,'postMetaTemplate','post_meta.html'),(396,'postID',4,'postTemplate','post.html'),(395,'postID',4,'postAllowComments','1'),(394,'postID',4,'postLegacyURL',''),(393,'postID',4,'postImportID',''),(392,'postID',4,'postCommentCount','1'),(391,'postID',4,'sectionID','1'),(390,'postID',4,'authorID','1'),(389,'postID',4,'postStatus','Published'),(388,'postID',4,'postTags',''),(387,'postID',4,'postDescHTML','<p>The committee is pleased to announce that <strong>REPLACE_firstname REPLACE_lastname</strong> has been voted as our new chairman. The result was almost unanimous, and the only abstention was due to Gavin still maintaining that it was REPLACE_firstname'),(386,'postID',4,'postDescRaw','The committee is pleased to announce that **REPLACE_firstname REPLACE_lastname** has been voted as our new chairman. The result was almost unanimous, and the only abstention was due to Gavin still maintaining that it was REPLACE_firstname who scratched hi'),(385,'postID',4,'postDateTime','2013-05-22'),(384,'postID',4,'postSlug','4-meet-our-new-chairman'),(383,'postID',4,'postTitle','Meet our new chairman!'),(382,'postID',4,'blogID','1'),(381,'postID',4,'postID','4'),(380,'postID',4,'image',''),(379,'postID',4,'_category','blog/news/'),(378,'postID',4,'excerpt','The committee is pleased to announce that REPLACE_firstname REPLACE_lastname has been voted as our new chairman, almost unanimously.'),(374,'postID',1,'itemID',''),(373,'postID',1,'postMetaTemplate','post_meta.html'),(372,'postID',1,'postTemplate','post.html'),(371,'postID',1,'postAllowComments','1'),(370,'postID',1,'postLegacyURL',''),(369,'postID',1,'postImportID',''),(368,'postID',1,'postCommentCount','0'),(367,'postID',1,'sectionID','1'),(366,'postID',1,'authorID','1'),(365,'postID',1,'postStatus','Published'),(364,'postID',1,'postTags',''),(363,'postID',1,'postDescHTML','<p>Our next club race is 23rd July; it’s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It’s going to be a lot of fun.</p>\n<p>Parking on the day will be restricted, as a new parking surface is'),(362,'postID',1,'postDescRaw','Our next club race is 23rd July; it\'s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It\'s going to be a lot of fun.\r\n\r\nParking on the day will be restricted, as a new parking surface is being laid'),(361,'postID',1,'postDateTime','2013-05-03'),(360,'postID',1,'postSlug','1-next-race-is-23rd-july'),(359,'postID',1,'postTitle','Next race is 23rd July'),(358,'postID',1,'blogID','1'),(357,'postID',1,'postID','1'),(356,'postID',1,'image',''),(355,'postID',1,'_category','blog/events/'),(354,'postID',1,'excerpt','Our next club race is 23rd July; it’s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It’s going to be a lot of fun.'),(350,'postID',3,'itemID',''),(349,'postID',3,'postMetaTemplate','post_meta.html'),(348,'postID',3,'postTemplate','post.html'),(347,'postID',3,'postAllowComments','1'),(346,'postID',3,'postLegacyURL',''),(345,'postID',3,'postImportID',''),(344,'postID',3,'postCommentCount','0'),(343,'postID',3,'sectionID','1'),(342,'postID',3,'authorID','1'),(341,'postID',3,'postStatus','Published'),(340,'postID',3,'postTags','clubhouse, rules'),(339,'postID',3,'postDescHTML','<p>Or should that be Clubhouse House Rules? I’m not sure, but it’s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.</p>\n<h2>These are The Rules</h2>\n<ol>\n<li><stro'),(338,'postID',3,'postDescRaw','Or should that be Clubhouse House Rules? I\'m not sure, but it\'s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.\r\n\r\n## These are The Rules\r\n\r\n1. **No ball games.** Ha'),(337,'postID',3,'postDateTime','2012-06-22'),(336,'postID',3,'postSlug','3-clubhouse-rules'),(335,'postID',3,'postTitle','Clubhouse Rules'),(334,'postID',3,'blogID','1'),(333,'postID',3,'postID','3'),(332,'postID',3,'image',''),(331,'postID',3,'_category','blog/information/'),(330,'postID',3,'excerpt','It’s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.'),(351,'postID',3,'itemRowID',''),(352,'postID',3,'postURL','/blog/3-clubhouse-rules/'),(353,'postID',3,'_id','3'),(375,'postID',1,'itemRowID',''),(376,'postID',1,'postURL','/blog/1-next-race-is-23rd-july/'),(377,'postID',1,'_id','1'),(399,'postID',4,'itemRowID',''),(400,'postID',4,'postURL','/blog/4-meet-our-new-chairman/'),(401,'postID',4,'_id','4'),(451,'postID',2,'_category','blog/events/'),(450,'postID',2,'excerpt','Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Appleseed once again. There will be a barn dance with live band and an expert caller. We’ve learned our lesson from');
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
  `blogID` int(10) unsigned DEFAULT '1',
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
  `postMetaTemplate` varchar(255) NOT NULL DEFAULT 'post_meta.html',
  PRIMARY KEY (`postID`),
  KEY `idx_date` (`postDateTime`),
  KEY `idx_status` (`postStatus`) USING BTREE,
  KEY `idx_blog` (`blogID`) USING BTREE,
  FULLTEXT KEY `idx_search` (`postTitle`,`postDescRaw`,`postTags`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_blog_posts`
--

LOCK TABLES `perch2_blog_posts` WRITE;
/*!40000 ALTER TABLE `perch2_blog_posts` DISABLE KEYS */;
INSERT INTO `perch2_blog_posts` VALUES (1,1,'Next race is 23rd July','1-next-race-is-23rd-july','2013-05-03 00:00:00','Our next club race is 23rd July; it\'s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It\'s going to be a lot of fun.\r\n\r\nParking on the day will be restricted, as a new parking surface is being laid that weekend. Just bad timing, I\'m afraid. Fortunately, local company Data Networks has said we can use their car park. To apply for a pass, email event organiser Sandra at [sandra@nestrunning.com](mailto:sandra@nestrunning.com) with your car registration plate. Passes are free, but we need to keep track of which cars are allowed into the car park for insurance reasons.\r\n\r\nThere are no on-site changing facilities, but Ann says she\'s got a changing tent you can borrow if you need it.','<p>Our next club race is 23rd July; it’s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It’s going to be a lot of fun.</p>\n<p>Parking on the day will be restricted, as a new parking surface is being laid that weekend. Just bad timing, I’m afraid. Fortunately, local company Data Networks has said we can use their car park. To apply for a pass, email event organiser Sandra at <a href=\"mailto:sandra@nestrunning.com\">sandra@nestrunning.com</a> with your car registration plate. Passes are free, but we need to keep track of which cars are allowed into the car park for insurance reasons.</p>\n<p>There are no on-site changing facilities, but Ann says she’s got a changing tent you can borrow if you need it.</p>','{\"excerpt\":{\"_flang\":\"markdown\",\"raw\":\"Our next club race is 23rd July; it\'s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It\'s going to be a lot of fun.\",\"processed\":\"<p>Our next club race is 23rd July; it\\u2019s the Nest 10k. Remember to invite your friends from other running clubs to sign up for this annual event. It\\u2019s going to be a lot of fun.<\\/p>\"},\"categories\":[\"1\"],\"image\":null}','','Published',1,1,0,NULL,NULL,1,'post.html','post_meta.html'),(2,1,'Tickets on sale for July Social','2-tickets-on-sale-for-july-social','2013-05-28 00:00:00','Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Appleseed once again. There will be a barn dance with live band and an expert caller. We\'ve learned our lesson from last year, and we won\'t be trying to do the calling ourselves.\r\n\r\nContact Jan for tickets - she\'s got, like, loads. It\'s a barn.\r\n\r\nA ploughman\'s dinner will be served with cheese for vegetarians and pâté _and_ cheese for everyone else. Us non-vegetarians need to keep our strength up. Local ale will be on tap to help with the dancing. Children are recommended to wear cycle helmets for their own safety.','<p>Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Appleseed once again. There will be a barn dance with live band and an expert caller. We’ve learned our lesson from last year, and we won’t be trying to do the calling ourselves.</p>\n<p>Contact Jan for tickets - she’s got, like, loads. It’s a barn.</p>\n<p>A ploughman’s dinner will be served with cheese for vegetarians and pâté <em>and</em> cheese for everyone else. Us non-vegetarians need to keep our strength up. Local ale will be on tap to help with the dancing. Children are recommended to wear cycle helmets for their own safety.</p>','{\"excerpt\":{\"_flang\":\"markdown\",\"raw\":\"Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Appleseed once again. There will be a barn dance with live band and an expert caller. We\'ve learned our lesson from last year, and we won\'t be trying to do the calling ourselves.\",\"processed\":\"<p>Tickets are now on sale for the July social event, which will be held, as always, in the barn at Applehaven Farm. Our thanks go to Farmer Appleseed once again. There will be a barn dance with live band and an expert caller. We\\u2019ve learned our lesson from last year, and we won\\u2019t be trying to do the calling ourselves.<\\/p>\"},\"categories\":[\"1\"],\"image\":{\"_default\":\"\\/perch\\/resources\\/img0306-1.jpg\",\"path\":\"img0306-1.jpg\",\"size\":192464,\"bucket\":\"default\",\"w\":1024,\"h\":683,\"sizes\":{\"thumb\":{\"w\":150,\"h\":100,\"path\":\"img0306-1-thumb.jpg\",\"size\":6767,\"mime\":\"image\\/jpeg\"},\"w500hc0\":{\"w\":500,\"h\":333,\"density\":\"1\",\"path\":\"img0306-1-w500.jpg\",\"size\":37127,\"mime\":\"image\\/jpeg\"},\"w140h140c1@2x\":{\"w\":140,\"h\":140,\"density\":\"2\",\"path\":\"img0306-1-w140h140@2x.jpg\",\"size\":19671,\"mime\":\"image\\/jpeg\"}}}}','','Published',1,1,1,NULL,NULL,1,'post.html','post_meta.html'),(3,1,'Clubhouse Rules','3-clubhouse-rules','2012-06-22 00:00:00','Or should that be Clubhouse House Rules? I\'m not sure, but it\'s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.\r\n\r\n## These are The Rules\r\n\r\n1. **No ball games.** Ha ha! No, seriously. No ball games. The walls are really thin and will dent if hit by a ball or a knee.\r\n2. **Wipe your feet.** We understand that you may be tired having just run a half-marathon through the woods, but _please_ remember to wipe your feet as you enter the clubhouse. On that note...\r\n3. **Clean up after yourself.** The club does not employ a cleaner. A volunteer team come in one day a month to give everything a good once-over, but otherwise it\'s up to _you_ to clean up _your mess_. It would really help to remind each other, and if you see a mess with no culprit in sight, please be neighbourly and help by cleaning it up.\r\n4. **The keyholder is boss!** Whoever unlocks the clubhouse is responsible for the clubhouse and those within it for that session. Therefore, they\'re in charge and what they says goes. Please respect their authority and do as you\'re jolly well told.\r\n5. **No smoking.** And that means smoking _of any kind_. You know who you are. There\'s a covered area outside the porch for _legal_ smoking if you really think that\'s a good idea before your run.\r\n6. **No advertising on the club notice board.** The notice board is for club notices only. Please do not post business cards plying your trades or, err, _services_ here. This is not the place. There is a phone booth across the road outside the rugby club.','<p>Or should that be Clubhouse House Rules? I’m not sure, but it’s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.</p>\n<h2>These are The Rules</h2>\n<ol>\n<li><strong>No ball games.</strong> Ha ha! No, seriously. No ball games. The walls are really thin and will dent if hit by a ball or a knee.</li>\n<li><strong>Wipe your feet.</strong> We understand that you may be tired having just run a half-marathon through the woods, but <em>please</em> remember to wipe your feet as you enter the clubhouse. On that note&#8230;</li>\n<li><strong>Clean up after yourself.</strong> The club does not employ a cleaner. A volunteer team come in one day a month to give everything a good once-over, but otherwise it’s up to <em>you</em> to clean up <em>your mess</em>. It would really help to remind each other, and if you see a mess with no culprit in sight, please be neighbourly and help by cleaning it up.</li>\n<li><strong>The keyholder is boss!</strong> Whoever unlocks the clubhouse is responsible for the clubhouse and those within it for that session. Therefore, they’re in charge and what they says goes. Please respect their authority and do as you’re jolly well told.</li>\n<li><strong>No smoking.</strong> And that means smoking <em>of any kind</em>. You know who you are. There’s a covered area outside the porch for <em>legal</em> smoking if you really think that’s a good idea before your run.</li>\n<li><strong>No advertising on the club notice board.</strong> The notice board is for club notices only. Please do not post business cards plying your trades or, err, <em>services</em> here. This is not the place. There is a phone booth across the road outside the rugby club.</li>\n</ol>','{\"excerpt\":{\"_flang\":\"markdown\",\"raw\":\"It\'s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.\",\"processed\":\"<p>It\\u2019s been suggested that we publish the clubhouse rules (or house rules or whatever) on the website as well as on the clubhouse notice board.<\\/p>\"},\"categories\":[\"3\"],\"image\":null}','clubhouse, rules','Published',1,1,0,NULL,NULL,1,'post.html','post_meta.html'),(4,1,'Meet our new chairman!','4-meet-our-new-chairman','2013-05-22 00:00:00','The committee is pleased to announce that **REPLACE_firstname REPLACE_lastname** has been voted as our new chairman. The result was almost unanimous, and the only abstention was due to Gavin still maintaining that it was REPLACE_firstname who scratched his car outside the clubhouse last year, despite the complete lack of evidence. \r\n\r\nWe all know REPLACE_firstname was out marathon training at the time and couldn\'t possibly have been involved. Anyway, that\'s by the by.\r\n\r\nREPLACE_firstname will serve a two-year term as club chairman (or should we say _chairperson_ these days? I\'m never sure) until the next elections following our centenary year!\r\n\r\nWe thank REPLACE_firstname for standing and being willing to take on such an unruly club.','<p>The committee is pleased to announce that <strong>REPLACE_firstname REPLACE_lastname</strong> has been voted as our new chairman. The result was almost unanimous, and the only abstention was due to Gavin still maintaining that it was REPLACE_firstname who scratched his car outside the clubhouse last year, despite the complete lack of evidence. </p>\n<p>We all know REPLACE_firstname was out marathon training at the time and couldn’t possibly have been involved. Anyway, that’s by the by.</p>\n<p>REPLACE_firstname will serve a two-year term as club chairman (or should we say <em>chairperson</em> these days? I’m never sure) until the next elections following our centenary year!</p>\n<p>We thank REPLACE_firstname for standing and being willing to take on such an unruly club.</p>','{\"excerpt\":{\"_flang\":\"markdown\",\"raw\":\"The committee is pleased to announce that REPLACE_firstname REPLACE_lastname has been voted as our new chairman, almost unanimously.\",\"processed\":\"<p>The committee is pleased to announce that REPLACE_firstname REPLACE_lastname has been voted as our new chairman, almost unanimously.<\\/p>\"},\"categories\":[\"2\"],\"image\":null}','','Published',1,1,1,NULL,NULL,1,'post.html','post_meta.html');
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
  `blogID` int(10) unsigned NOT NULL DEFAULT '1',
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
INSERT INTO `perch2_blog_sections` VALUES (1,1,'Posts','posts',4,'');
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
-- Table structure for table `perch2_blogs`
--

DROP TABLE IF EXISTS `perch2_blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_blogs` (
  `blogID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blogTitle` char(255) NOT NULL DEFAULT 'Blog',
  `blogSlug` char(255) DEFAULT 'blog',
  `setSlug` char(255) DEFAULT 'blog',
  `postTemplate` char(255) DEFAULT 'post.html',
  `blogDynamicFields` mediumtext,
  PRIMARY KEY (`blogID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_blogs`
--

LOCK TABLES `perch2_blogs` WRITE;
/*!40000 ALTER TABLE `perch2_blogs` DISABLE KEYS */;
INSERT INTO `perch2_blogs` VALUES (1,'Blog','blog','blog','post.html','[]');
/*!40000 ALTER TABLE `perch2_blogs` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_categories`
--

LOCK TABLES `perch2_categories` WRITE;
/*!40000 ALTER TABLE `perch2_categories` DISABLE KEYS */;
INSERT INTO `perch2_categories` VALUES (1,1,0,'Events','events','blog/events/','Events',1,'001-001','[]'),(2,1,0,'News','news','blog/news/','News',2,'001-002','[]'),(3,1,0,'Information for members','information','blog/information/','Information for members',3,'001-003','{\"categoryTitle\":\"Information for members\",\"categorySlug\":\"information-for-members\"}'),(4,2,0,'Memberships','memberships','products/memberships/','Memberships',4,'002-004','{\"desc\":{\"_flang\":\"markdown\",\"raw\":\"\",\"processed\":\"\"}}'),(5,2,0,'Club kit','club-kit','products/club-kit/','Club kit',5,'002-005','{\"desc\":{\"_flang\":\"markdown\",\"raw\":\"\",\"processed\":\"\"}}'),(6,2,0,'Misc','misc','products/misc/','Misc',6,'002-006','{\"desc\":{\"_flang\":\"markdown\",\"raw\":\"\",\"processed\":\"\"}}');
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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_category_counts`
--

LOCK TABLES `perch2_category_counts` WRITE;
/*!40000 ALTER TABLE `perch2_category_counts` DISABLE KEYS */;
INSERT INTO `perch2_category_counts` VALUES (29,2,'blog.post',1),(28,3,'blog.post',1),(27,1,'blog.post',2);
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_category_sets`
--

LOCK TABLES `perch2_category_sets` WRITE;
/*!40000 ALTER TABLE `perch2_category_sets` DISABLE KEYS */;
INSERT INTO `perch2_category_sets` VALUES (1,'Blog','blog','set.html','category.html','[]'),(2,'Products','products','set.html','category.html','[]');
/*!40000 ALTER TABLE `perch2_category_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_collection_index`
--

DROP TABLE IF EXISTS `perch2_collection_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_collection_index` (
  `indexID` int(10) NOT NULL AUTO_INCREMENT,
  `itemID` int(10) NOT NULL DEFAULT '0',
  `collectionID` int(10) NOT NULL DEFAULT '0',
  `itemRev` int(10) NOT NULL DEFAULT '0',
  `indexKey` char(64) NOT NULL DEFAULT '-',
  `indexValue` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`indexID`),
  KEY `idx_key` (`indexKey`),
  KEY `idx_val` (`indexValue`),
  KEY `idx_rev` (`itemRev`),
  KEY `idx_item` (`itemID`),
  KEY `idx_keyval` (`indexKey`,`indexValue`),
  KEY `idx_colrev` (`collectionID`,`itemRev`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_collection_index`
--

LOCK TABLES `perch2_collection_index` WRITE;
/*!40000 ALTER TABLE `perch2_collection_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_collection_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_collection_items`
--

DROP TABLE IF EXISTS `perch2_collection_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_collection_items` (
  `itemRowID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemID` int(10) unsigned NOT NULL,
  `itemRev` int(10) unsigned NOT NULL DEFAULT '0',
  `collectionID` int(10) unsigned NOT NULL,
  `itemJSON` mediumtext NOT NULL,
  `itemSearch` mediumtext NOT NULL,
  `itemUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `itemUpdatedBy` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemRowID`),
  KEY `idx_item` (`itemID`),
  KEY `idx_rev` (`itemRev`),
  KEY `idx_collection` (`collectionID`),
  KEY `idx_regrev` (`itemID`,`collectionID`,`itemRev`),
  FULLTEXT KEY `idx_search` (`itemSearch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_collection_items`
--

LOCK TABLES `perch2_collection_items` WRITE;
/*!40000 ALTER TABLE `perch2_collection_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_collection_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_collection_revisions`
--

DROP TABLE IF EXISTS `perch2_collection_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_collection_revisions` (
  `itemID` int(10) unsigned NOT NULL,
  `collectionID` int(10) unsigned NOT NULL,
  `itemOrder` int(10) unsigned DEFAULT '1000',
  `itemRev` int(10) unsigned NOT NULL,
  `itemLatestRev` int(10) unsigned NOT NULL,
  `itemCreated` datetime NOT NULL DEFAULT '2014-02-21 06:53:00',
  `itemCreatedBy` char(32) NOT NULL DEFAULT '',
  `itemSearchable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`itemID`),
  KEY `idx_order` (`itemOrder`),
  KEY `idx_searchable` (`itemSearchable`),
  KEY `idx_collection` (`collectionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_collection_revisions`
--

LOCK TABLES `perch2_collection_revisions` WRITE;
/*!40000 ALTER TABLE `perch2_collection_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_collection_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_collections`
--

DROP TABLE IF EXISTS `perch2_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_collections` (
  `collectionID` int(10) NOT NULL AUTO_INCREMENT,
  `collectionKey` char(64) NOT NULL DEFAULT '',
  `collectionOrder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `collectionTemplate` char(255) NOT NULL DEFAULT '',
  `collectionOptions` text NOT NULL,
  `collectionSearchable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `collectionEditRoles` char(255) NOT NULL DEFAULT '*',
  `collectionUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `collectionInAppMenu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`collectionID`),
  KEY `idx_key` (`collectionKey`),
  KEY `idx_appmenu` (`collectionInAppMenu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_collections`
--

LOCK TABLES `perch2_collections` WRITE;
/*!40000 ALTER TABLE `perch2_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_collections` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=586 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_content_index`
--

LOCK TABLES `perch2_content_index` WRITE;
/*!40000 ALTER TABLE `perch2_content_index` DISABLE KEYS */;
INSERT INTO `perch2_content_index` VALUES (295,1,1,1,5,'_order','1000'),(294,1,1,1,5,'_id','1'),(293,1,1,1,5,'cta','Request an invitation'),(292,1,1,1,5,'desc_processed','<p>Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!</p>'),(291,1,1,1,5,'desc_raw','Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!'),(290,1,1,1,5,'desc','<p>Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!</p>'),(289,1,1,1,5,'title','Become a member'),(423,3,3,1,11,'_order','1000'),(422,3,3,1,11,'_id','3'),(421,3,3,1,11,'strapline','Run for your life'),(420,3,3,1,11,'image','/perch/resources/home-banner.jpg'),(308,16,6,1,1,'_order','1000'),(307,16,6,1,1,'_id','16'),(306,16,6,1,1,'strapline','Run for your life'),(305,16,6,1,1,'site_name','Nest Running Club'),(312,2,2,1,4,'_order','1000'),(311,2,2,1,4,'_id','2'),(310,2,2,1,4,'facebook','grabaperch'),(309,2,2,1,4,'twitter','grabaperch'),(317,7,9,12,2,'_order','1000'),(316,7,9,12,2,'_id','7'),(315,7,9,12,2,'text_processed','<h1>Register today</h1>\n\n<p>Nest running club members should already have their membership details, but if you&#8217;re new to the club you can sign up here.</p>\n\n<p>Members get access to information such as personal contact information that we&#8217;d ra'),(314,7,9,12,2,'text_raw','h1. Register today\r\n\r\nNest running club members should already have their membership details, but if you\'re new to the club you can sign up here.\r\n\r\nMembers get access to information such as personal contact information that we\'d rather not have freely av'),(313,7,9,12,2,'text','<h1>Register today</h1>\n\n<p>Nest running club members should already have their membership details, but if you&#8217;re new to the club you can sign up here.</p>\n\n<p>Members get access to information such as personal contact information that we&#8217;d ra'),(330,5,7,2,16,'_order','1000'),(329,5,7,2,16,'_id','5'),(328,5,7,2,16,'body_processed','<p>Hello, we&#8217;re <strong>Nest</strong> &#8212; a local running club for local people who like to run, locally. We&#8217;re really friendly and always welcome new members, as long as you&#8217;re local. So if you&#8217;re a local person who likes to r'),(327,5,7,2,16,'body_raw','Hello, we\'re *Nest* -- a local running club for local people who like to run, locally. We\'re really friendly and always welcome new members, as long as you\'re local. So if you\'re a local person who likes to run locally, pop along for a taster session. The'),(326,5,7,2,16,'body','<p>Hello, we&#8217;re <strong>Nest</strong> &#8212; a local running club for local people who like to run, locally. We&#8217;re really friendly and always welcome new members, as long as you&#8217;re local. So if you&#8217;re a local person who likes to r'),(325,5,7,2,16,'image_h','683'),(324,5,7,2,16,'image_w','1024'),(323,5,7,2,16,'image_bucket','default'),(322,5,7,2,16,'image_size','207516'),(321,5,7,2,16,'image_path','img1069-2.jpg'),(320,5,7,2,16,'image__default','/perch/resources/img1069-2.jpg'),(319,5,7,2,16,'image','/perch/resources/img1069-2.jpg'),(318,5,7,2,16,'heading','Who are we?'),(339,6,8,7,6,'_order','1000'),(338,6,8,7,6,'_id','6'),(337,6,8,7,6,'success_processed','<h1>Thank you!</h1>\n\n<p>Thanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running!</p>'),(336,6,8,7,6,'success_raw','h1. Thank you!\r\n\r\nThanks for dropping us a line. We\'ll be in touch with a response shortly. Happy running!'),(335,6,8,7,6,'success','<h1>Thank you!</h1>\n\n<p>Thanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running!</p>'),(334,6,8,7,6,'intro_processed',''),(333,6,8,7,6,'intro_raw',''),(332,6,8,7,6,'intro',''),(331,6,8,7,6,'heading','Send us a message'),(344,8,10,14,3,'_order','1000'),(343,8,10,14,3,'_id','8'),(342,8,10,14,3,'text_processed','<h2>Get a new password</h2>\n\n<p>Have you forgotten your password? You idiot! We can&#8217;t remind you of your old password (it&#8217;s stored in a secure way that means we can&#8217;t retrieve it) but we can send you a new one.</p>\n\n<p>If you&#8217;re al'),(341,8,10,14,3,'text_raw','h2. Get a new password\r\n\r\nHave you forgotten your password? You idiot! We can\'t remind you of your old password (it\'s stored in a secure way that means we can\'t retrieve it) but we can send you a new one.\r\n\r\nIf you\'re already registered, enter your email'),(340,8,10,14,3,'text','<h2>Get a new password</h2>\n\n<p>Have you forgotten your password? You idiot! We can&#8217;t remind you of your old password (it&#8217;s stored in a secure way that means we can&#8217;t retrieve it) but we can send you a new one.</p>\n\n<p>If you&#8217;re al'),(349,9,11,10,4,'_order','1000'),(348,9,11,10,4,'_id','9'),(347,9,11,10,4,'text_processed','<h1>Member login</h1>\n\n<p>The restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.</p>\n\n<p>If you&#8217;re a member but don&#8217;t yet have a website account, the you need'),(346,9,11,10,4,'text_raw','h1. Member login\r\n\r\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\r\n\r\nIf you\'re a member but don\'t yet have a website account, the you need to \"register\":/members'),(345,9,11,10,4,'text','<h1>Member login</h1>\n\n<p>The restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.</p>\n\n<p>If you&#8217;re a member but don&#8217;t yet have a website account, the you need'),(362,10,12,10,4,'_order','1000'),(361,10,12,10,4,'_id','10'),(360,10,12,10,4,'body_processed','<p>Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! </p>\n\n<p>Would we do that? Of course we wouldn&#8217;t. Instead we&#8217;ve got some boring old documents with members'),(359,10,12,10,4,'body_raw','Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! \r\n\r\nWould we do that? Of course we wouldn\'t. Instead we\'ve got some boring old documents with members addresses and phone'),(358,10,12,10,4,'body','<p>Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! </p>\n\n<p>Would we do that? Of course we wouldn&#8217;t. Instead we&#8217;ve got some boring old documents with members'),(357,10,12,10,4,'image_h','683'),(356,10,12,10,4,'image_w','1024'),(355,10,12,10,4,'image_bucket','default'),(354,10,12,10,4,'image_size','342150'),(353,10,12,10,4,'image_path','img0043.jpg'),(352,10,12,10,4,'image__default','/perch/resources/img0043.jpg'),(351,10,12,10,4,'image','/perch/resources/img0043.jpg'),(350,10,12,10,4,'heading','Members Area'),(384,15,13,10,14,'_order','1001'),(383,15,13,10,14,'_id','15'),(382,15,13,10,14,'file_bucket','members'),(381,15,13,10,14,'file_size','30553'),(380,15,13,10,14,'file_path','training-plan.pdf'),(379,15,13,10,14,'file__default','/members/file/training-plan.pdf'),(378,15,13,10,14,'file','/members/file/training-plan.pdf'),(377,15,13,10,14,'desc_processed','<p>Our exclusive club training plan <span class=\"caps\">PDF</span>. This is like <em>training gold</em>! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.</p>'),(376,15,13,10,14,'desc_raw','Our exclusive club training plan PDF. This is like _training gold_! Fill out all the boxes and you\'re bound to beat your PB by miles.'),(375,15,13,10,14,'desc','<p>Our exclusive club training plan <span class=\"caps\">PDF</span>. This is like <em>training gold</em>! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.</p>'),(374,15,13,10,14,'title','Training Plan'),(373,14,13,10,14,'_order','1000'),(372,14,13,10,14,'_id','14'),(371,14,13,10,14,'file_bucket','members'),(370,14,13,10,14,'file_size','23364'),(369,14,13,10,14,'file_path','annual-report.pdf'),(368,14,13,10,14,'file__default','/members/file/annual-report.pdf'),(367,14,13,10,14,'file','/members/file/annual-report.pdf'),(366,14,13,10,14,'desc_processed','<p>This is our annual club report, as presented and signed off at this year&#8217;s Annual General Meeting by the committee and the club chairman.</p>'),(365,14,13,10,14,'desc_raw','This is our annual club report, as presented and signed off at this year\'s Annual General Meeting by the committee and the club chairman.'),(364,14,13,10,14,'desc','<p>This is our annual club report, as presented and signed off at this year&#8217;s Annual General Meeting by the committee and the club chairman.</p>'),(363,14,13,10,14,'title','Annual Report'),(385,3,3,1,4,'image','/perch/resources/home-banner.jpg'),(386,3,3,1,4,'strapline','Run for your life'),(387,3,3,1,4,'_id','3'),(388,3,3,1,4,'_order','1000'),(389,3,3,1,5,'image','/perch/resources/home-banner.jpg'),(390,3,3,1,5,'strapline','Run for your life'),(391,3,3,1,5,'_id','3'),(392,3,3,1,5,'_order','1000'),(393,3,3,1,6,'image','/perch/resources/home-banner.jpg'),(394,3,3,1,6,'strapline','Not the club you need, but the club you deserve'),(395,3,3,1,6,'_id','3'),(396,3,3,1,6,'_order','1000'),(407,3,3,1,7,'_order','1000'),(406,3,3,1,7,'_id','3'),(405,3,3,1,7,'strapline','Run for your life'),(404,3,3,1,7,'image','/perch/resources/home-banner.jpg'),(410,3,3,1,8,'_id','3'),(409,3,3,1,8,'strapline','Run for your life'),(408,3,3,1,8,'image','/perch/resources/home-banner.jpg'),(411,3,3,1,8,'_order','1000'),(412,3,3,1,9,'image','/perch/resources/home-banner.jpg'),(413,3,3,1,9,'strapline','Run for your life'),(414,3,3,1,9,'_id','3'),(415,3,3,1,9,'_order','1000'),(416,3,3,1,10,'image','/perch/resources/home-banner.jpg'),(417,3,3,1,10,'strapline','Run for your life'),(418,3,3,1,10,'_id','3'),(419,3,3,1,10,'_order','1000'),(424,17,17,21,1,'text','Your cart is currently empty. Find some exciting products'),(425,17,17,21,1,'_id','17'),(426,17,17,21,1,'_order','1000'),(427,18,18,21,1,'title','Coupon code'),(428,18,18,21,1,'title__flang','smartypants'),(429,18,18,21,1,'title_raw','Coupon code'),(430,18,18,21,1,'title_processed','Coupon code'),(431,18,18,21,1,'desc','Do you have a coupon code for a discount? If so, enter it here!'),(432,18,18,21,1,'label','Code'),(433,18,18,21,1,'cta','Apply code'),(434,18,18,21,1,'cta__flang','smartypants'),(435,18,18,21,1,'cta_raw','Apply code'),(436,18,18,21,1,'cta_processed','Apply code'),(437,18,18,21,1,'_id','18'),(438,18,18,21,1,'_order','1000'),(439,18,18,21,2,'title','Coupon code'),(440,18,18,21,2,'title__flang','smartypants'),(441,18,18,21,2,'title_raw','Coupon code'),(442,18,18,21,2,'title_processed','Coupon code'),(443,18,18,21,2,'desc','Do you have a coupon code for a discount? If so, enter it here!'),(444,18,18,21,2,'label','Code'),(445,18,18,21,2,'cta','Apply code'),(446,18,18,21,2,'cta__flang','smartypants'),(447,18,18,21,2,'cta_raw','Apply code'),(448,18,18,21,2,'cta_processed','Apply code'),(449,18,18,21,2,'_id','18'),(450,18,18,21,2,'_order','1000'),(451,18,18,21,3,'title','Coupon code'),(452,18,18,21,3,'title__flang','smartypants'),(453,18,18,21,3,'title_raw','Coupon code'),(454,18,18,21,3,'title_processed','Coupon code'),(455,18,18,21,3,'desc','Do you have a coupon code for a discount? If so, enter it here!'),(456,18,18,21,3,'label','Code'),(457,18,18,21,3,'cta','Apply code'),(458,18,18,21,3,'cta__flang','smartypants'),(459,18,18,21,3,'cta_raw','Apply code'),(460,18,18,21,3,'cta_processed','Apply code'),(461,18,18,21,3,'_id','18'),(462,18,18,21,3,'_order','1000'),(463,18,18,21,4,'title','Coupon code'),(464,18,18,21,4,'title__flang','smartypants'),(465,18,18,21,4,'title_raw','Coupon code'),(466,18,18,21,4,'title_processed','Coupon code'),(467,18,18,21,4,'desc','Do you have a coupon code for a discount? Luck old you. You can enter it here and any qualifying discount will be applied.'),(468,18,18,21,4,'label','Code'),(469,18,18,21,4,'cta','Apply code'),(470,18,18,21,4,'cta__flang','smartypants'),(471,18,18,21,4,'cta_raw','Apply code'),(472,18,18,21,4,'cta_processed','Apply code'),(473,18,18,21,4,'_id','18'),(474,18,18,21,4,'_order','1000'),(475,18,18,21,5,'title','Coupon code'),(476,18,18,21,5,'title__flang','smartypants'),(477,18,18,21,5,'title_raw','Coupon code'),(478,18,18,21,5,'title_processed','Coupon code'),(479,18,18,21,5,'desc','Do you have a coupon code for a discount? Luck old you. You can enter it here for untold secrets to be revealed unto you.'),(480,18,18,21,5,'label','Code'),(481,18,18,21,5,'cta','Apply code'),(482,18,18,21,5,'cta__flang','smartypants'),(483,18,18,21,5,'cta_raw','Apply code'),(484,18,18,21,5,'cta_processed','Apply code'),(485,18,18,21,5,'_id','18'),(486,18,18,21,5,'_order','1000'),(487,18,18,21,6,'title','Coupon code'),(488,18,18,21,6,'title__flang','smartypants'),(489,18,18,21,6,'title_raw','Coupon code'),(490,18,18,21,6,'title_processed','Coupon code'),(491,18,18,21,6,'desc','Do you have a coupon code for a discount? Luck old you. You can enter it here for untold secrets to be revealed.'),(492,18,18,21,6,'label','Code'),(493,18,18,21,6,'cta','Apply code'),(494,18,18,21,6,'cta__flang','smartypants'),(495,18,18,21,6,'cta_raw','Apply code'),(496,18,18,21,6,'cta_processed','Apply code'),(497,18,18,21,6,'_id','18'),(498,18,18,21,6,'_order','1000'),(499,19,20,24,1,'text','Thank you\n\nThank you for your order!'),(500,19,20,24,1,'_id','19'),(501,19,20,24,1,'_order','1000'),(502,19,20,24,2,'text','Thank you\n\nThank you for your order! You can see the details below.'),(503,19,20,24,2,'_id','19'),(504,19,20,24,2,'_order','1000'),(505,18,18,21,7,'title','Coupon code'),(506,18,18,21,7,'title__flang','smartypants'),(507,18,18,21,7,'title_raw','Coupon code'),(508,18,18,21,7,'title_processed','Coupon code'),(509,18,18,21,7,'desc','Do you have a coupon code for a discount? Lucky old you. You can enter it here for untold secrets to be revealed.'),(510,18,18,21,7,'label','Code'),(511,18,18,21,7,'cta','Apply code'),(512,18,18,21,7,'cta__flang','smartypants'),(513,18,18,21,7,'cta_raw','Apply code'),(514,18,18,21,7,'cta_processed','Apply code'),(515,18,18,21,7,'_id','18'),(516,18,18,21,7,'_order','1000'),(517,20,24,10,1,'heading','Welcome back!'),(518,20,24,10,1,'image',''),(519,20,24,10,1,'body','It looks like you&#8217;re all logged in with your account, which is great. You don&#8217;t appear to have a current Nest Running Club membership, however.\n\nThat might be because you&#8217;re new around here, or perhaps yours has just expired. Memberships'),(520,20,24,10,1,'_id','20'),(521,20,24,10,1,'_order','1000'),(522,9,11,10,5,'text','Member login\n\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\n\nIf you&#8217;re already a paid-up a member but don&#8217;t yet have a website account, then you need'),(523,9,11,10,5,'_id','9'),(524,9,11,10,5,'_order','1000'),(525,9,11,10,6,'text','Member login\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\nIf you’re already a paid-up a member but don’t yet have a website account, then you need to regist'),(526,9,11,10,6,'_id','9'),(527,9,11,10,6,'_order','1000'),(528,7,9,12,3,'text','Register today\nNest running club members should already have their membership details, but if you’re new to the club you can sign up here.\nMembers get access to information such as personal contact information that we’d rather not have freely availabl'),(529,7,9,12,3,'_id','7'),(530,7,9,12,3,'_order','1000'),(531,7,9,12,4,'text','Register today\nNest running club members should already have their membership details, but if you’re already a member part way through your yearly subscription, you can sign up here. Lynda will check your membership and enable your access. If you’ve n'),(532,7,9,12,4,'_id','7'),(533,7,9,12,4,'_order','1000'),(534,17,17,21,2,'text','Your cart is currently empty. Find some exciting products'),(535,17,17,21,2,'_id','17'),(536,17,17,21,2,'_order','1000'),(537,19,20,24,3,'text','Thank you\nThank you for your order! You can see the details below.'),(538,19,20,24,3,'_id','19'),(539,19,20,24,3,'_order','1000'),(540,8,10,14,4,'text','Get a new password\nHave you forgotten your password? You idiot! We can’t remind you of your old password (it’s stored in a secure way that means we can’t retrieve it) but we can send you a new one.\nIf you’re already registered, enter your email ad'),(541,8,10,14,4,'_id','8'),(542,8,10,14,4,'_order','1000'),(543,5,7,2,17,'heading','Who are we?'),(544,5,7,2,17,'image','/perch/resources/img1069-2.jpg'),(545,5,7,2,17,'body','Hello, we’re Nest – a local running club for local people who like to run, locally. We’re really friendly and always welcome new members, as long as you’re local. So if you’re a local person who likes to run locally, pop along for a taster sessi'),(546,5,7,2,17,'_id','5'),(547,5,7,2,17,'_order','1000'),(548,5,7,2,18,'heading','Who are we?'),(549,5,7,2,18,'image','/perch/resources/img1069-2.jpg'),(550,5,7,2,18,'body','Hello, we’re Nest – a local running club for local people who like to run, locally. We’re really friendly and always welcome new members, as long as you’re local. So if you’re a local person who likes to run locally, pop along for a taster sessi'),(551,5,7,2,18,'_id','5'),(552,5,7,2,18,'_order','1000'),(553,10,12,10,5,'heading','Members Area'),(554,10,12,10,5,'image','/perch/resources/img0043.jpg'),(555,10,12,10,5,'body','Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! \nWould we do that? Of course we wouldn’t. Instead we’ve got some boring old documents with members addresses and phone'),(556,10,12,10,5,'_id','10'),(557,10,12,10,5,'_order','1000'),(558,20,24,10,2,'heading','Welcome back!'),(559,20,24,10,2,'image',''),(560,20,24,10,2,'body','It looks like you’re all logged in with your account, which is great. You don’t appear to have a current Nest Running Club membership, however.\nThat might be because you’re new around here, or perhaps yours has just expired. Memberships expire every'),(561,20,24,10,2,'_id','20'),(562,20,24,10,2,'_order','1000'),(563,14,13,10,15,'title','Annual Report'),(564,14,13,10,15,'desc','This is our annual club report, as presented and signed off at this year’s Annual General Meeting by the committee and the club chairman.'),(565,14,13,10,15,'file','/members/file/annual-report.pdf'),(566,14,13,10,15,'_id','14'),(567,14,13,10,15,'_order','1000'),(568,15,13,10,15,'title','Training Plan'),(569,15,13,10,15,'desc','Our exclusive club training plan PDF. This is like training gold! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.'),(570,15,13,10,15,'file','/members/file/training-plan.pdf'),(571,15,13,10,15,'_id','15'),(572,15,13,10,15,'_order','1001'),(573,14,13,10,16,'title','Annual Report'),(574,14,13,10,16,'desc','This is our annual club report, as presented and signed off at this year’s Annual General Meeting by the committee and the club chairman.'),(575,14,13,10,16,'file','/members/file/annual-report.pdf'),(576,14,13,10,16,'_id','14'),(577,14,13,10,16,'_order','1000'),(578,15,13,10,16,'title','Training Plan'),(579,15,13,10,16,'desc','Our exclusive club training plan PDF. This is like training gold! Fill out all the boxes and you’re bound to beat your PB by miles.'),(580,15,13,10,16,'file','/members/file/training-plan.pdf'),(581,15,13,10,16,'_id','15'),(582,15,13,10,16,'_order','1001'),(583,19,20,24,4,'text','Thank you\nThank you for your order! You can see the details below. If your order includes any digital downloads, those are listed to the right (or lower down the page on a phone or tablet).'),(584,19,20,24,4,'_id','19'),(585,19,20,24,4,'_order','1000');
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
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_content_items`
--

LOCK TABLES `perch2_content_items` WRITE;
/*!40000 ALTER TABLE `perch2_content_items` DISABLE KEYS */;
INSERT INTO `perch2_content_items` VALUES (84,6,8,7,6,1000,'{\"_id\":\"6\",\"heading\":\"Send us a message\",\"intro\":{\"raw\":\"\",\"processed\":\"\"},\"success\":{\"raw\":\"h1. Thank you!\\r\\n\\r\\nThanks for dropping us a line. We\'ll be in touch with a response shortly. Happy running!\",\"processed\":\"<h1>Thank you!<\\/h1>\\n\\n<p>Thanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running!<\\/p>\"}}',' Send us a message  Thank you!\n\nThanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running! ','0000-00-00 00:00:00',''),(51,5,7,2,16,1000,'{\"_id\":\"5\",\"heading\":\"Who are we?\",\"image\":{\"_default\":\"\\/perch\\/resources\\/img1069-2.jpg\",\"path\":\"img1069-2.jpg\",\"size\":207516,\"bucket\":\"default\",\"w\":1024,\"h\":683,\"sizes\":{\"thumb\":{\"w\":150,\"h\":100,\"path\":\"img1069-2-thumb.jpg\",\"size\":7503,\"mime\":\"image\\/jpeg\"},\"w280hc0\":{\"w\":280,\"h\":186,\"density\":\"1\",\"path\":\"img1069-2-w280.jpg\",\"size\":16739,\"mime\":\"image\\/jpeg\"}}},\"body\":{\"raw\":\"Hello, we\'re *Nest* -- a local running club for local people who like to run, locally. We\'re really friendly and always welcome new members, as long as you\'re local. So if you\'re a local person who likes to run locally, pop along for a taster session. There\'s no need to worry about joining, just come along and get a feel for the place. You can join if you\'d like to attend regularly. We\'re your local running club, locals.\\r\\n\\r\\nWe meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. _On the run!_ Ah haha!\\r\\n\\r\\nh2. Bring your own shoes\\r\\n\\r\\nSharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn\'t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let\'s face it, the risk isn\'t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)\\r\\n\\r\\nCome and join us!\",\"processed\":\"<p>Hello, we&#8217;re <strong>Nest<\\/strong> &#8212; a local running club for local people who like to run, locally. We&#8217;re really friendly and always welcome new members, as long as you&#8217;re local. So if you&#8217;re a local person who likes to run locally, pop along for a taster session. There&#8217;s no need to worry about joining, just come along and get a feel for the place. You can join if you&#8217;d like to attend regularly. We&#8217;re your local running club, locals.<\\/p>\\n\\n<p>We meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. <em>On the run!<\\/em> Ah haha!<\\/p>\\n\\n<h2>Bring your own shoes<\\/h2>\\n\\n<p>Sharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn&#8217;t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let&#8217;s face it, the risk isn&#8217;t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)<\\/p>\\n\\n<p>Come and join us!<\\/p>\"}}',' Who are we?  Hello, we&#8217;re Nest &#8212; a local running club for local people who like to run, locally. We&#8217;re really friendly and always welcome new members, as long as you&#8217;re local. So if you&#8217;re a local person who likes to run locally, pop along for a taster session. There&#8217;s no need to worry about joining, just come along and get a feel for the place. You can join if you&#8217;d like to attend regularly. We&#8217;re your local running club, locals.\n\nWe meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. On the run! Ah haha!\n\nBring your own shoes\n\nSharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn&#8217;t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let&#8217;s face it, the risk isn&#8217;t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)\n\nCome and join us! ','0000-00-00 00:00:00',''),(63,10,12,10,4,1000,'{\"_id\":\"10\",\"heading\":\"Members Area\",\"image\":{\"_default\":\"\\/perch\\/resources\\/img0043.jpg\",\"path\":\"img0043.jpg\",\"size\":342150,\"bucket\":\"default\",\"w\":1024,\"h\":683,\"sizes\":{\"thumb\":{\"w\":150,\"h\":100,\"path\":\"img0043-thumb.jpg\",\"size\":8001,\"mime\":\"image\\/jpeg\"},\"w280hc0\":{\"w\":280,\"h\":186,\"density\":\"1\",\"path\":\"img0043-w280.jpg\",\"size\":22693,\"mime\":\"image\\/jpeg\"}}},\"body\":{\"raw\":\"Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! \\r\\n\\r\\nWould we do that? Of course we wouldn\'t. Instead we\'ve got some boring old documents with members addresses and phone numbers and stuff.\\r\\n\\r\\nh2. Training Plans\\r\\n\\r\\nOne thing we wouldn\'t want other clubs to get their filthy mitts on is our exciting Training Plan PDF! Exclusive to club members, this PDF helps you plan out your complete training programme. It\'s such a competitive advantage that by the time you\'ve filled it out you hardly need to train at all. Check it out!\",\"processed\":\"<p>Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! <\\/p>\\n\\n<p>Would we do that? Of course we wouldn&#8217;t. Instead we&#8217;ve got some boring old documents with members addresses and phone numbers and stuff.<\\/p>\\n\\n<h2>Training Plans<\\/h2>\\n\\n<p>One thing we wouldn&#8217;t want other clubs to get their filthy mitts on is our exciting Training Plan <span class=\\\"caps\\\">PDF<\\/span>! Exclusive to club members, this <span class=\\\"caps\\\">PDF<\\/span> helps you plan out your complete training programme. It&#8217;s such a competitive advantage that by the time you&#8217;ve filled it out you hardly need to train at all. Check it out!<\\/p>\"}}',' Members Area  Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! \n\nWould we do that? Of course we wouldn&#8217;t. Instead we&#8217;ve got some boring old documents with members addresses and phone numbers and stuff.\n\nTraining Plans\n\nOne thing we wouldn&#8217;t want other clubs to get their filthy mitts on is our exciting Training Plan PDF! Exclusive to club members, this PDF helps you plan out your complete training programme. It&#8217;s such a competitive advantage that by the time you&#8217;ve filled it out you hardly need to train at all. Check it out! ','0000-00-00 00:00:00',''),(76,14,13,10,14,1000,'{\"_id\":\"14\",\"title\":\"Annual Report\",\"_title\":\"Annual Report\",\"desc\":{\"raw\":\"This is our annual club report, as presented and signed off at this year\'s Annual General Meeting by the committee and the club chairman.\",\"processed\":\"<p>This is our annual club report, as presented and signed off at this year&#8217;s Annual General Meeting by the committee and the club chairman.<\\/p>\"},\"file\":{\"_default\":\"\\/members\\/file\\/annual-report.pdf\",\"path\":\"annual-report.pdf\",\"size\":23364,\"bucket\":\"members\"}}',' Annual Report This is our annual club report, as presented and signed off at this year&#8217;s Annual General Meeting by the committee and the club chairman.  members file annual report pdf ','0000-00-00 00:00:00',''),(77,15,13,10,14,1001,'{\"_id\":\"15\",\"title\":\"Training Plan\",\"_title\":\"Training Plan\",\"desc\":{\"raw\":\"Our exclusive club training plan PDF. This is like _training gold_! Fill out all the boxes and you\'re bound to beat your PB by miles.\",\"processed\":\"<p>Our exclusive club training plan <span class=\\\"caps\\\">PDF<\\/span>. This is like <em>training gold<\\/em>! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.<\\/p>\"},\"file\":{\"_default\":\"\\/members\\/file\\/training-plan.pdf\",\"path\":\"training-plan.pdf\",\"size\":30553,\"bucket\":\"members\"}}',' Training Plan Our exclusive club training plan PDF. This is like training gold! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.  members file training plan pdf ','0000-00-00 00:00:00',''),(82,16,6,1,1,1000,'{\"_id\":\"16\",\"site_name\":\"Nest Running Club\",\"strapline\":\"Run for your life\"}',' Nest Running Club Run for your life ','0000-00-00 00:00:00',''),(94,17,17,21,0,1000,'','','2016-04-07 12:37:54',''),(95,17,17,21,1,1000,'{\"_id\":\"17\",\"text\":{\"_flang\":\"textile\",\"raw\":\"Your cart is currently empty. \\\"Find some exciting products\\\":\\/shop\",\"processed\":\"<p>Your cart is currently empty. <a href=\\\"\\/shop\\\">Find some exciting products<\\/a><\\/p>\"}}',' Your cart is currently empty. Find some exciting products ','2016-04-07 12:38:19','1'),(80,2,2,1,4,1000,'{\"_id\":\"2\",\"twitter\":\"grabaperch\",\"facebook\":\"grabaperch\"}',' grabaperch grabaperch ','0000-00-00 00:00:00',''),(56,7,9,12,2,1000,'{\"_id\":\"7\",\"text\":{\"raw\":\"h1. Register today\\r\\n\\r\\nNest running club members should already have their membership details, but if you\'re new to the club you can sign up here.\\r\\n\\r\\nMembers get access to information such as personal contact information that we\'d rather not have freely available to all. It\'s not that we\'re paranoid, but you just never know who\'s watching.\",\"processed\":\"<h1>Register today<\\/h1>\\n\\n<p>Nest running club members should already have their membership details, but if you&#8217;re new to the club you can sign up here.<\\/p>\\n\\n<p>Members get access to information such as personal contact information that we&#8217;d rather not have freely available to all. It&#8217;s not that we&#8217;re paranoid, but you just never know who&#8217;s watching.<\\/p>\"}}',' Register today\n\nNest running club members should already have their membership details, but if you&#8217;re new to the club you can sign up here.\n\nMembers get access to information such as personal contact information that we&#8217;d rather not have freely available to all. It&#8217;s not that we&#8217;re paranoid, but you just never know who&#8217;s watching. ','0000-00-00 00:00:00',''),(79,1,1,1,5,1000,'{\"_id\":\"1\",\"title\":\"Become a member\",\"_title\":\"Become a member\",\"desc\":{\"raw\":\"Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!\",\"processed\":\"<p>Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!<\\/p>\"},\"cta\":\"Request an invitation\"}',' Become a member Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today! Request an invitation ','0000-00-00 00:00:00',''),(78,8,10,14,3,1000,'{\"_id\":\"8\",\"text\":{\"raw\":\"h2. Get a new password\\r\\n\\r\\nHave you forgotten your password? You idiot! We can\'t remind you of your old password (it\'s stored in a secure way that means we can\'t retrieve it) but we can send you a new one.\\r\\n\\r\\nIf you\'re already registered, enter your email address below, submit the form and we\'ll send a new password to that email address.\",\"processed\":\"<h2>Get a new password<\\/h2>\\n\\n<p>Have you forgotten your password? You idiot! We can&#8217;t remind you of your old password (it&#8217;s stored in a secure way that means we can&#8217;t retrieve it) but we can send you a new one.<\\/p>\\n\\n<p>If you&#8217;re already registered, enter your email address below, submit the form and we&#8217;ll send a new password to that email address.<\\/p>\"}}',' Get a new password\n\nHave you forgotten your password? You idiot! We can&#8217;t remind you of your old password (it&#8217;s stored in a secure way that means we can&#8217;t retrieve it) but we can send you a new one.\n\nIf you&#8217;re already registered, enter your email address below, submit the form and we&#8217;ll send a new password to that email address. ','0000-00-00 00:00:00',''),(59,13,14,16,1,1000,'{\"_id\":\"13\",\"text\":{\"raw\":\"This is my content!\",\"processed\":\"<p>This is my content!<\\/p>\"}}',' This is my content! ','0000-00-00 00:00:00',''),(60,9,11,10,4,1000,'{\"_id\":\"9\",\"text\":{\"raw\":\"h1. Member login\\r\\n\\r\\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\\r\\n\\r\\nIf you\'re a member but don\'t yet have a website account, the you need to \\\"register\\\":\\/members\\/register\\/ first. If you\'re not a member and have no intention of becoming one, there\'s really nothing here for you. Nothing. Not a sausage.\",\"processed\":\"<h1>Member login<\\/h1>\\n\\n<p>The restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.<\\/p>\\n\\n<p>If you&#8217;re a member but don&#8217;t yet have a website account, the you need to <a href=\\\"\\/members\\/register\\/\\\">register<\\/a> first. If you&#8217;re not a member and have no intention of becoming one, there&#8217;s really nothing here for you. Nothing. Not a sausage.<\\/p>\"}}',' Member login\n\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\n\nIf you&#8217;re a member but don&#8217;t yet have a website account, the you need to register first. If you&#8217;re not a member and have no intention of becoming one, there&#8217;s really nothing here for you. Nothing. Not a sausage. ','0000-00-00 00:00:00',''),(85,3,3,1,4,1000,'{\"_id\":\"3\",\"image\":{\"_default\":\"\\/perch\\/resources\\/home-banner.jpg\",\"path\":\"home-banner.jpg\",\"size\":34130,\"bucket\":\"default\",\"w\":1200,\"h\":350,\"sizes\":{\"thumb\":{\"w\":150,\"h\":43,\"path\":\"home-banner-thumb.jpg\",\"size\":1897,\"mime\":\"image\\/jpeg\"}}},\"strapline\":\"Run for your life\"}','   Run for your life ','2016-03-28 16:35:04','1'),(86,3,3,1,5,1000,'{\"_id\":\"3\",\"image\":{\"_default\":\"\\/perch\\/resources\\/home-banner.jpg\",\"path\":\"home-banner.jpg\",\"size\":34130,\"bucket\":\"default\",\"w\":1200,\"h\":350,\"sizes\":{\"thumb\":{\"w\":150,\"h\":43,\"path\":\"home-banner-thumb.jpg\",\"size\":1897,\"mime\":\"image\\/jpeg\"}}},\"strapline\":\"Run for your life\"}','   Run for your life ','2016-03-28 16:35:21','1'),(87,3,3,1,6,1000,'{\"_id\":\"3\",\"image\":{\"_default\":\"\\/perch\\/resources\\/home-banner.jpg\",\"path\":\"home-banner.jpg\",\"size\":34130,\"bucket\":\"default\",\"w\":1200,\"h\":350,\"sizes\":{\"thumb\":{\"w\":150,\"h\":43,\"path\":\"home-banner-thumb.jpg\",\"size\":1897,\"mime\":\"image\\/jpeg\"}}},\"strapline\":\"Not the club you need, but the club you deserve\"}','   Not the club you need, but the club you deserve ','2016-03-28 16:39:52','1'),(88,3,3,1,7,1000,'{\"_id\":\"3\",\"image\":{\"_default\":\"\\/perch\\/resources\\/home-banner.jpg\",\"path\":\"home-banner.jpg\",\"size\":34130,\"bucket\":\"default\",\"w\":1200,\"h\":350,\"sizes\":{\"thumb\":{\"w\":150,\"h\":43,\"path\":\"home-banner-thumb.jpg\",\"size\":1897,\"mime\":\"image\\/jpeg\"}}},\"strapline\":\"Run for your life\"}','   Run for your life ','2016-03-28 16:40:43','1'),(90,3,3,1,8,1000,'{\"_id\":\"3\",\"image\":{\"_default\":\"\\/perch\\/resources\\/home-banner.jpg\",\"path\":\"home-banner.jpg\",\"size\":34130,\"bucket\":\"default\",\"w\":1200,\"h\":350,\"sizes\":{\"thumb\":{\"w\":150,\"h\":43,\"path\":\"home-banner-thumb.jpg\",\"size\":1897,\"mime\":\"image\\/jpeg\"}}},\"strapline\":\"Run for your life\"}','   Run for your life ','2016-03-28 16:47:16','1'),(91,3,3,1,9,1000,'{\"_id\":\"3\",\"image\":{\"_default\":\"\\/perch\\/resources\\/home-banner.jpg\",\"path\":\"home-banner.jpg\",\"size\":34130,\"bucket\":\"default\",\"w\":1200,\"h\":350,\"sizes\":{\"thumb\":{\"w\":150,\"h\":43,\"path\":\"home-banner-thumb.jpg\",\"size\":1897,\"mime\":\"image\\/jpeg\"}}},\"strapline\":\"Run for your life\"}','  Run for your life ','2016-03-28 16:51:06','1'),(92,3,3,1,10,1000,'{\"_id\":\"3\",\"image\":{\"_default\":\"\\/perch\\/resources\\/home-banner.jpg\",\"path\":\"home-banner.jpg\",\"size\":34130,\"bucket\":\"default\",\"w\":1200,\"h\":350,\"sizes\":{\"thumb\":{\"w\":150,\"h\":43,\"path\":\"home-banner-thumb.jpg\",\"size\":1897,\"mime\":\"image\\/jpeg\"}}},\"strapline\":\"Run for your life\"}','  Run for your life ','2016-03-28 16:57:17','1'),(93,3,3,1,11,1000,'{\"_id\":\"3\",\"image\":{\"_default\":\"\\/perch\\/resources\\/home-banner.jpg\",\"path\":\"home-banner.jpg\",\"size\":34130,\"bucket\":\"default\",\"w\":1200,\"h\":350,\"sizes\":{\"thumb\":{\"w\":150,\"h\":43,\"path\":\"home-banner-thumb.jpg\",\"size\":1897,\"mime\":\"image\\/jpeg\"}}},\"strapline\":\"Run for your life\"}','  Run for your life ','2016-03-28 16:59:04','1'),(96,18,18,21,0,1000,'','','2016-04-07 13:18:49',''),(97,18,18,21,1,1000,'{\"_id\":\"18\",\"title\":{\"_flang\":\"smartypants\",\"raw\":\"Coupon code\",\"processed\":\"Coupon code\"},\"desc\":{\"_flang\":\"markdown\",\"raw\":\"Do you have a coupon code for a discount? If so, enter it here!\",\"processed\":\"<p>Do you have a coupon code for a discount? If so, enter it here!<\\/p>\"},\"label\":\"Code\",\"cta\":{\"_flang\":\"smartypants\",\"raw\":\"Apply code\",\"processed\":\"Apply code\"}}',' Coupon code Do you have a coupon code for a discount? If so, enter it here! Code Apply code ','2016-04-07 13:19:17','1'),(98,18,18,21,2,1000,'{\"_id\":\"18\",\"title\":{\"_flang\":\"smartypants\",\"raw\":\"Coupon code\",\"processed\":\"Coupon code\"},\"_title\":\"Coupon code\",\"desc\":{\"_flang\":\"markdown\",\"raw\":\"Do you have a coupon code for a discount? If so, enter it here!\",\"processed\":\"<p>Do you have a coupon code for a discount? If so, enter it here!<\\/p>\"},\"label\":\"Code\",\"cta\":{\"_flang\":\"smartypants\",\"raw\":\"Apply code\",\"processed\":\"Apply code\"}}',' Coupon code Do you have a coupon code for a discount? If so, enter it here! Code Apply code ','2016-04-07 13:19:39','1'),(99,18,18,21,3,1000,'{\"_id\":\"18\",\"title\":{\"_flang\":\"smartypants\",\"raw\":\"Coupon code\",\"processed\":\"Coupon code\"},\"_title\":\"Coupon code\",\"desc\":{\"_flang\":\"markdown\",\"raw\":\"Do you have a coupon code for a discount? If so, enter it here!\",\"processed\":\"<p>Do you have a coupon code for a discount? If so, enter it here!<\\/p>\"},\"label\":\"Code\",\"cta\":{\"_flang\":\"smartypants\",\"raw\":\"Apply code\",\"processed\":\"Apply code\"}}',' Coupon code Do you have a coupon code for a discount? If so, enter it here! Code Apply code ','2016-04-07 13:19:41','1'),(100,18,18,21,4,1000,'{\"_id\":\"18\",\"title\":{\"_flang\":\"smartypants\",\"raw\":\"Coupon code\",\"processed\":\"Coupon code\"},\"_title\":\"Coupon code\",\"desc\":{\"_flang\":\"markdown\",\"raw\":\"Do you have a coupon code for a discount? Luck old you. You can enter it here and any qualifying discount will be applied.\",\"processed\":\"<p>Do you have a coupon code for a discount? Luck old you. You can enter it here and any qualifying discount will be applied.<\\/p>\"},\"label\":\"Code\",\"cta\":{\"_flang\":\"smartypants\",\"raw\":\"Apply code\",\"processed\":\"Apply code\"}}',' Coupon code Do you have a coupon code for a discount? Luck old you. You can enter it here and any qualifying discount will be applied. Code Apply code ','2016-04-07 13:20:35','1'),(101,18,18,21,5,1000,'{\"_id\":\"18\",\"title\":{\"_flang\":\"smartypants\",\"raw\":\"Coupon code\",\"processed\":\"Coupon code\"},\"_title\":\"Coupon code\",\"desc\":{\"_flang\":\"markdown\",\"raw\":\"Do you have a coupon code for a discount? Luck old you. You can enter it here for untold secrets to be revealed unto you.\",\"processed\":\"<p>Do you have a coupon code for a discount? Luck old you. You can enter it here for untold secrets to be revealed unto you.<\\/p>\"},\"label\":\"Code\",\"cta\":{\"_flang\":\"smartypants\",\"raw\":\"Apply code\",\"processed\":\"Apply code\"}}',' Coupon code Do you have a coupon code for a discount? Luck old you. You can enter it here for untold secrets to be revealed unto you. Code Apply code ','2016-04-07 13:21:04','1'),(102,18,18,21,6,1000,'{\"_id\":\"18\",\"title\":{\"_flang\":\"smartypants\",\"raw\":\"Coupon code\",\"processed\":\"Coupon code\"},\"_title\":\"Coupon code\",\"desc\":{\"_flang\":\"markdown\",\"raw\":\"Do you have a coupon code for a discount? Luck old you. You can enter it here for untold secrets to be revealed.\",\"processed\":\"<p>Do you have a coupon code for a discount? Luck old you. You can enter it here for untold secrets to be revealed.<\\/p>\"},\"label\":\"Code\",\"cta\":{\"_flang\":\"smartypants\",\"raw\":\"Apply code\",\"processed\":\"Apply code\"}}',' Coupon code Do you have a coupon code for a discount? Luck old you. You can enter it here for untold secrets to be revealed. Code Apply code ','2016-04-07 13:21:16','1'),(103,19,20,24,0,1000,'','','2016-04-07 17:13:49',''),(104,19,20,24,1,1000,'{\"_id\":\"19\",\"text\":{\"_flang\":\"textile\",\"raw\":\"h1. Thank you\\r\\n\\r\\nThank you for your order!\",\"processed\":\"<h1>Thank you<\\/h1>\\n\\n<p>Thank you for your order!<\\/p>\"}}',' Thank you\n\nThank you for your order! ','2016-04-07 17:14:00','1'),(105,19,20,24,2,1000,'{\"_id\":\"19\",\"text\":{\"_flang\":\"textile\",\"raw\":\"h1. Thank you\\r\\n\\r\\nThank you for your order! You can see the details below.\",\"processed\":\"<h1>Thank you<\\/h1>\\n\\n<p>Thank you for your order! You can see the details below.<\\/p>\"}}',' Thank you\n\nThank you for your order! You can see the details below. ','2016-04-07 17:14:16','1'),(106,18,18,21,7,1000,'{\"_id\":\"18\",\"title\":{\"_flang\":\"smartypants\",\"raw\":\"Coupon code\",\"processed\":\"Coupon code\"},\"_title\":\"Coupon code\",\"desc\":{\"_flang\":\"markdown\",\"raw\":\"Do you have a coupon code for a discount? Lucky old you. You can enter it here for untold secrets to be revealed.\",\"processed\":\"<p>Do you have a coupon code for a discount? Lucky old you. You can enter it here for untold secrets to be revealed.<\\/p>\"},\"label\":\"Code\",\"cta\":{\"_flang\":\"smartypants\",\"raw\":\"Apply code\",\"processed\":\"Apply code\"}}',' Coupon code Do you have a coupon code for a discount? Lucky old you. You can enter it here for untold secrets to be revealed. Code Apply code ','2016-04-08 10:32:34','1'),(107,20,24,10,0,1000,'','','2016-04-08 12:40:22',''),(108,20,24,10,1,1000,'{\"_id\":\"20\",\"heading\":\"Welcome back!\",\"image\":null,\"body\":{\"_flang\":\"textile\",\"raw\":\"It looks like you\'re all logged in with your account, which is great. You don\'t appear to have a current Nest Running Club membership, however.\\r\\n\\r\\nThat might be because you\'re new around here, or perhaps yours has just expired. Memberships expire every 12 months. If you need to renew or join up for the first time, add a membership to your cart below!\",\"processed\":\"<p>It looks like you&#8217;re all logged in with your account, which is great. You don&#8217;t appear to have a current Nest Running Club membership, however.<\\/p>\\n\\n<p>That might be because you&#8217;re new around here, or perhaps yours has just expired. Memberships expire every 12 months. If you need to renew or join up for the first time, add a membership to your cart below!<\\/p>\"}}',' Welcome back!  It looks like you&#8217;re all logged in with your account, which is great. You don&#8217;t appear to have a current Nest Running Club membership, however.\n\nThat might be because you&#8217;re new around here, or perhaps yours has just expired. Memberships expire every 12 months. If you need to renew or join up for the first time, add a membership to your cart below! ','2016-04-08 12:42:17','1'),(109,9,11,10,5,1000,'{\"_id\":\"9\",\"text\":{\"_flang\":\"textile\",\"raw\":\"h1. Member login\\r\\n\\r\\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\\r\\n\\r\\nIf you\'re already a paid-up a member but don\'t yet have a website account, then you need to \\\"register\\\":\\/members\\/register\\/ first. If you\'ve not paid your subscription, you can do that from the \\\"Shop\\\":\\/shop section and get instant access. If you\'re not a member and have no intention of becoming one, there\'s really nothing here for you. Nothing. Not a sausage.\",\"processed\":\"<h1>Member login<\\/h1>\\n\\n<p>The restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.<\\/p>\\n\\n<p>If you&#8217;re already a paid-up a member but don&#8217;t yet have a website account, then you need to <a href=\\\"\\/members\\/register\\/\\\">register<\\/a> first. If you&#8217;ve not paid your subscription, you can do that from the <a href=\\\"\\/shop\\\">Shop<\\/a> section and get instant access. If you&#8217;re not a member and have no intention of becoming one, there&#8217;s really nothing here for you. Nothing. Not a sausage.<\\/p>\"}}',' Member login\n\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\n\nIf you&#8217;re already a paid-up a member but don&#8217;t yet have a website account, then you need to register first. If you&#8217;ve not paid your subscription, you can do that from the Shop section and get instant access. If you&#8217;re not a member and have no intention of becoming one, there&#8217;s really nothing here for you. Nothing. Not a sausage. ','2016-04-08 16:31:17','1'),(110,9,11,10,6,1000,'{\"_id\":\"9\",\"text\":{\"_flang\":\"markdown\",\"raw\":\"# Member login\\r\\n\\r\\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\\r\\n\\r\\nIf you\'re already a paid-up a member but don\'t yet have a website account, then you need to [register](\\/members\\/register\\/) first. If you\'ve not paid your subscription, you can do that from the [Shop](\\/shop) section and get instant access. If you\'re not a member and have no intention of becoming one, there\'s really nothing here for you. Nothing. Not a sausage.\",\"processed\":\"<h1>Member login<\\/h1>\\n<p>The restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.<\\/p>\\n<p>If you\\u2019re already a paid-up a member but don\\u2019t yet have a website account, then you need to <a href=\\\"\\/members\\/register\\/\\\">register<\\/a> first. If you\\u2019ve not paid your subscription, you can do that from the <a href=\\\"\\/shop\\\">Shop<\\/a> section and get instant access. If you\\u2019re not a member and have no intention of becoming one, there\\u2019s really nothing here for you. Nothing. Not a sausage.<\\/p>\"}}',' Member login\nThe restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.\nIf you’re already a paid-up a member but don’t yet have a website account, then you need to register first. If you’ve not paid your subscription, you can do that from the Shop section and get instant access. If you’re not a member and have no intention of becoming one, there’s really nothing here for you. Nothing. Not a sausage. ','2016-04-08 16:32:06','1'),(111,7,9,12,3,1000,'{\"_id\":\"7\",\"text\":{\"_flang\":\"markdown\",\"raw\":\"# Register today\\r\\n\\r\\nNest running club members should already have their membership details, but if you\'re new to the club you can sign up here.\\r\\n\\r\\nMembers get access to information such as personal contact information that we\'d rather not have freely available to all. It\'s not that we\'re paranoid, but you just never know who\'s watching.\",\"processed\":\"<h1>Register today<\\/h1>\\n<p>Nest running club members should already have their membership details, but if you\\u2019re new to the club you can sign up here.<\\/p>\\n<p>Members get access to information such as personal contact information that we\\u2019d rather not have freely available to all. It\\u2019s not that we\\u2019re paranoid, but you just never know who\\u2019s watching.<\\/p>\"}}',' Register today\nNest running club members should already have their membership details, but if you’re new to the club you can sign up here.\nMembers get access to information such as personal contact information that we’d rather not have freely available to all. It’s not that we’re paranoid, but you just never know who’s watching. ','2016-04-08 16:33:37','1'),(112,7,9,12,4,1000,'{\"_id\":\"7\",\"text\":{\"_flang\":\"markdown\",\"raw\":\"# Register today\\r\\n\\r\\nNest running club members should already have their membership details, but if you\'re already a member part way through your yearly subscription, you can sign up here. Lynda will check your membership and enable your access. If you\'ve not paid this year\'s subscription yet, you can do that through the [Shop](\\/shop).\\r\\n\\r\\nMembers get access to information such as personal contact information that we\'d rather not have freely available to all. It\'s not that we\'re paranoid, but you just never know who\'s watching.\",\"processed\":\"<h1>Register today<\\/h1>\\n<p>Nest running club members should already have their membership details, but if you\\u2019re already a member part way through your yearly subscription, you can sign up here. Lynda will check your membership and enable your access. If you\\u2019ve not paid this year\\u2019s subscription yet, you can do that through the <a href=\\\"\\/shop\\\">Shop<\\/a>.<\\/p>\\n<p>Members get access to information such as personal contact information that we\\u2019d rather not have freely available to all. It\\u2019s not that we\\u2019re paranoid, but you just never know who\\u2019s watching.<\\/p>\"}}',' Register today\nNest running club members should already have their membership details, but if you’re already a member part way through your yearly subscription, you can sign up here. Lynda will check your membership and enable your access. If you’ve not paid this year’s subscription yet, you can do that through the Shop.\nMembers get access to information such as personal contact information that we’d rather not have freely available to all. It’s not that we’re paranoid, but you just never know who’s watching. ','2016-04-08 16:35:03','1'),(113,17,17,21,2,1000,'{\"_id\":\"17\",\"text\":{\"_flang\":\"markdown\",\"raw\":\"Your cart is currently empty. [Find some exciting products](\\/shop)\",\"processed\":\"<p>Your cart is currently empty. <a href=\\\"\\/shop\\\">Find some exciting products<\\/a><\\/p>\"}}',' Your cart is currently empty. Find some exciting products ','2016-04-08 16:35:30','1'),(114,19,20,24,3,1000,'{\"_id\":\"19\",\"text\":{\"_flang\":\"markdown\",\"raw\":\"# Thank you\\r\\n\\r\\nThank you for your order! You can see the details below.\",\"processed\":\"<h1>Thank you<\\/h1>\\n<p>Thank you for your order! You can see the details below.<\\/p>\"}}',' Thank you\nThank you for your order! You can see the details below. ','2016-04-08 16:35:41','1'),(115,8,10,14,4,1000,'{\"_id\":\"8\",\"text\":{\"_flang\":\"markdown\",\"raw\":\"## Get a new password\\r\\n\\r\\nHave you forgotten your password? You idiot! We can\'t remind you of your old password (it\'s stored in a secure way that means we can\'t retrieve it) but we can send you a new one.\\r\\n\\r\\nIf you\'re already registered, enter your email address below, submit the form and we\'ll send a new password to that email address.\",\"processed\":\"<h2>Get a new password<\\/h2>\\n<p>Have you forgotten your password? You idiot! We can\\u2019t remind you of your old password (it\\u2019s stored in a secure way that means we can\\u2019t retrieve it) but we can send you a new one.<\\/p>\\n<p>If you\\u2019re already registered, enter your email address below, submit the form and we\\u2019ll send a new password to that email address.<\\/p>\"}}',' Get a new password\nHave you forgotten your password? You idiot! We can’t remind you of your old password (it’s stored in a secure way that means we can’t retrieve it) but we can send you a new one.\nIf you’re already registered, enter your email address below, submit the form and we’ll send a new password to that email address. ','2016-04-08 16:36:16','1'),(116,5,7,2,17,1000,'{\"_id\":\"5\",\"heading\":\"Who are we?\",\"image\":{\"_default\":\"\\/perch\\/resources\\/img1069-2.jpg\",\"path\":\"img1069-2.jpg\",\"size\":207516,\"bucket\":\"default\",\"w\":1024,\"h\":683,\"sizes\":{\"thumb\":{\"w\":150,\"h\":100,\"path\":\"img1069-2-thumb.jpg\",\"size\":7503,\"mime\":\"image\\/jpeg\"},\"w280hc0\":{\"w\":280,\"h\":186,\"density\":\"1\",\"path\":\"img1069-2-w280.jpg\",\"size\":16739,\"mime\":\"image\\/jpeg\"}}},\"body\":{\"_flang\":\"markdown\",\"raw\":\"Hello, we\'re *Nest* -- a local running club for local people who like to run, locally. We\'re really friendly and always welcome new members, as long as you\'re local. So if you\'re a local person who likes to run locally, pop along for a taster session. There\'s no need to worry about joining, just come along and get a feel for the place. You can join if you\'d like to attend regularly. We\'re your local running club, locals.\\r\\n\\r\\nWe meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. _On the run!_ Ah haha!\\r\\n\\r\\n## Bring your own shoes\\r\\n\\r\\nSharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn\'t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let\'s face it, the risk isn\'t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)\\r\\n\\r\\nCome and join us!\",\"processed\":\"<p>Hello, we\\u2019re <em>Nest<\\/em> \\u2013 a local running club for local people who like to run, locally. We\\u2019re really friendly and always welcome new members, as long as you\\u2019re local. So if you\\u2019re a local person who likes to run locally, pop along for a taster session. There\\u2019s no need to worry about joining, just come along and get a feel for the place. You can join if you\\u2019d like to attend regularly. We\\u2019re your local running club, locals.<\\/p>\\n<p>We meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. <em>On the run!<\\/em> Ah haha!<\\/p>\\n<h2>Bring your own shoes<\\/h2>\\n<p>Sharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn\\u2019t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let\\u2019s face it, the risk isn\\u2019t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)<\\/p>\\n<p>Come and join us!<\\/p>\"}}',' Who are we?  Hello, we’re Nest – a local running club for local people who like to run, locally. We’re really friendly and always welcome new members, as long as you’re local. So if you’re a local person who likes to run locally, pop along for a taster session. There’s no need to worry about joining, just come along and get a feel for the place. You can join if you’d like to attend regularly. We’re your local running club, locals.\nWe meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. On the run! Ah haha!\nBring your own shoes\nSharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn’t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let’s face it, the risk isn’t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)\nCome and join us! ','2016-04-08 16:37:35','1'),(117,5,7,2,18,1000,'{\"_id\":\"5\",\"heading\":\"Who are we?\",\"image\":{\"_default\":\"\\/perch\\/resources\\/img1069-2.jpg\",\"path\":\"img1069-2.jpg\",\"size\":207516,\"bucket\":\"default\",\"w\":1024,\"h\":683,\"sizes\":{\"thumb\":{\"w\":150,\"h\":100,\"path\":\"img1069-2-thumb.jpg\",\"size\":7503,\"mime\":\"image\\/jpeg\"},\"w280hc0\":{\"w\":280,\"h\":186,\"density\":\"1\",\"path\":\"img1069-2-w280.jpg\",\"size\":16739,\"mime\":\"image\\/jpeg\"}}},\"body\":{\"_flang\":\"markdown\",\"raw\":\"Hello, we\'re **Nest** -- a local running club for local people who like to run, locally. We\'re really friendly and always welcome new members, as long as you\'re local. So if you\'re a local person who likes to run locally, pop along for a taster session. There\'s no need to worry about joining, just come along and get a feel for the place. You can join if you\'d like to attend regularly. We\'re your local running club, locals.\\r\\n\\r\\nWe meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. _On the run!_ Ah haha!\\r\\n\\r\\n## Bring your own shoes\\r\\n\\r\\nSharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn\'t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let\'s face it, the risk isn\'t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)\\r\\n\\r\\nCome and join us!\",\"processed\":\"<p>Hello, we\\u2019re <strong>Nest<\\/strong> \\u2013 a local running club for local people who like to run, locally. We\\u2019re really friendly and always welcome new members, as long as you\\u2019re local. So if you\\u2019re a local person who likes to run locally, pop along for a taster session. There\\u2019s no need to worry about joining, just come along and get a feel for the place. You can join if you\\u2019d like to attend regularly. We\\u2019re your local running club, locals.<\\/p>\\n<p>We meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. <em>On the run!<\\/em> Ah haha!<\\/p>\\n<h2>Bring your own shoes<\\/h2>\\n<p>Sharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn\\u2019t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let\\u2019s face it, the risk isn\\u2019t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)<\\/p>\\n<p>Come and join us!<\\/p>\"}}',' Who are we?  Hello, we’re Nest – a local running club for local people who like to run, locally. We’re really friendly and always welcome new members, as long as you’re local. So if you’re a local person who likes to run locally, pop along for a taster session. There’s no need to worry about joining, just come along and get a feel for the place. You can join if you’d like to attend regularly. We’re your local running club, locals.\nWe meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. On the run! Ah haha!\nBring your own shoes\nSharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn’t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let’s face it, the risk isn’t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)\nCome and join us! ','2016-04-08 16:37:46','1'),(118,10,12,10,5,1000,'{\"_id\":\"10\",\"heading\":\"Members Area\",\"image\":{\"_default\":\"\\/perch\\/resources\\/img0043.jpg\",\"path\":\"img0043.jpg\",\"size\":342150,\"bucket\":\"default\",\"w\":1024,\"h\":683,\"sizes\":{\"thumb\":{\"w\":150,\"h\":100,\"path\":\"img0043-thumb.jpg\",\"size\":8001,\"mime\":\"image\\/jpeg\"},\"w280hc0\":{\"w\":280,\"h\":186,\"density\":\"1\",\"path\":\"img0043-w280.jpg\",\"size\":22693,\"mime\":\"image\\/jpeg\"}}},\"body\":{\"_flang\":\"markdown\",\"raw\":\"Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! \\r\\n\\r\\nWould we do that? Of course we wouldn\'t. Instead we\'ve got some boring old documents with members addresses and phone numbers and stuff.\\r\\n\\r\\n## Training Plans\\r\\n\\r\\nOne thing we wouldn\'t want other clubs to get their filthy mitts on is our exciting Training Plan PDF! Exclusive to club members, this PDF helps you plan out your complete training programme. It\'s such a competitive advantage that by the time you\'ve filled it out you hardly need to train at all. Check it out!\",\"processed\":\"<p>Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! <\\/p>\\n<p>Would we do that? Of course we wouldn\\u2019t. Instead we\\u2019ve got some boring old documents with members addresses and phone numbers and stuff.<\\/p>\\n<h2>Training Plans<\\/h2>\\n<p>One thing we wouldn\\u2019t want other clubs to get their filthy mitts on is our exciting Training Plan PDF! Exclusive to club members, this PDF helps you plan out your complete training programme. It\\u2019s such a competitive advantage that by the time you\\u2019ve filled it out you hardly need to train at all. Check it out!<\\/p>\"}}',' Members Area  Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! \nWould we do that? Of course we wouldn’t. Instead we’ve got some boring old documents with members addresses and phone numbers and stuff.\nTraining Plans\nOne thing we wouldn’t want other clubs to get their filthy mitts on is our exciting Training Plan PDF! Exclusive to club members, this PDF helps you plan out your complete training programme. It’s such a competitive advantage that by the time you’ve filled it out you hardly need to train at all. Check it out! ','2016-04-08 16:38:33','1'),(119,20,24,10,2,1000,'{\"_id\":\"20\",\"heading\":\"Welcome back!\",\"image\":null,\"body\":{\"_flang\":\"markdown\",\"raw\":\"It looks like you\'re all logged in with your account, which is great. You don\'t appear to have a current Nest Running Club membership, however.\\r\\n\\r\\nThat might be because you\'re new around here, or perhaps yours has just expired. Memberships expire every 12 months. If you need to renew or join up for the first time, add a membership to your cart below!\",\"processed\":\"<p>It looks like you\\u2019re all logged in with your account, which is great. You don\\u2019t appear to have a current Nest Running Club membership, however.<\\/p>\\n<p>That might be because you\\u2019re new around here, or perhaps yours has just expired. Memberships expire every 12 months. If you need to renew or join up for the first time, add a membership to your cart below!<\\/p>\"}}',' Welcome back!  It looks like you’re all logged in with your account, which is great. You don’t appear to have a current Nest Running Club membership, however.\nThat might be because you’re new around here, or perhaps yours has just expired. Memberships expire every 12 months. If you need to renew or join up for the first time, add a membership to your cart below! ','2016-04-08 16:38:40','1'),(120,14,13,10,15,1000,'{\"_id\":\"14\",\"title\":\"Annual Report\",\"_title\":\"Annual Report\",\"desc\":{\"_flang\":\"markdown\",\"raw\":\"This is our annual club report, as presented and signed off at this year\'s Annual General Meeting by the committee and the club chairman.\",\"processed\":\"<p>This is our annual club report, as presented and signed off at this year\\u2019s Annual General Meeting by the committee and the club chairman.<\\/p>\"},\"file\":{\"_default\":\"\\/members\\/file\\/annual-report.pdf\",\"path\":\"annual-report.pdf\",\"size\":23364,\"bucket\":\"members\"}}',' Annual Report This is our annual club report, as presented and signed off at this year’s Annual General Meeting by the committee and the club chairman.  members file annual report pdf ','2016-04-08 16:39:15','1'),(121,15,13,10,15,1001,'{\"_id\":\"15\",\"title\":\"Training Plan\",\"_title\":\"Training Plan\",\"desc\":{\"raw\":\"Our exclusive club training plan PDF. This is like _training gold_! Fill out all the boxes and you\'re bound to beat your PB by miles.\",\"processed\":\"<p>Our exclusive club training plan <span class=\\\"caps\\\">PDF<\\/span>. This is like <em>training gold<\\/em>! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.<\\/p>\"},\"file\":{\"_default\":\"\\/members\\/file\\/training-plan.pdf\",\"path\":\"training-plan.pdf\",\"size\":30553,\"bucket\":\"members\"}}',' Training Plan Our exclusive club training plan PDF. This is like training gold! Fill out all the boxes and you&#8217;re bound to beat your PB by miles.  members file training plan pdf ','2016-04-08 16:39:15','1'),(122,14,13,10,16,1000,'{\"_id\":\"14\",\"title\":\"Annual Report\",\"_title\":\"Annual Report\",\"desc\":{\"_flang\":\"markdown\",\"raw\":\"This is our annual club report, as presented and signed off at this year\'s Annual General Meeting by the committee and the club chairman.\",\"processed\":\"<p>This is our annual club report, as presented and signed off at this year\\u2019s Annual General Meeting by the committee and the club chairman.<\\/p>\"},\"file\":{\"_default\":\"\\/members\\/file\\/annual-report.pdf\",\"path\":\"annual-report.pdf\",\"size\":23364,\"bucket\":\"members\"}}',' Annual Report This is our annual club report, as presented and signed off at this year’s Annual General Meeting by the committee and the club chairman.  members file annual report pdf ','2016-04-08 16:39:19','1'),(123,15,13,10,16,1001,'{\"_id\":\"15\",\"title\":\"Training Plan\",\"_title\":\"Training Plan\",\"desc\":{\"_flang\":\"markdown\",\"raw\":\"Our exclusive club training plan PDF. This is like _training gold_! Fill out all the boxes and you\'re bound to beat your PB by miles.\",\"processed\":\"<p>Our exclusive club training plan PDF. This is like <em>training gold<\\/em>! Fill out all the boxes and you\\u2019re bound to beat your PB by miles.<\\/p>\"},\"file\":{\"_default\":\"\\/members\\/file\\/training-plan.pdf\",\"path\":\"training-plan.pdf\",\"size\":30553,\"bucket\":\"members\"}}',' Training Plan Our exclusive club training plan PDF. This is like training gold! Fill out all the boxes and you’re bound to beat your PB by miles.  members file training plan pdf ','2016-04-08 16:39:19','1'),(124,19,20,24,4,1000,'{\"_id\":\"19\",\"text\":{\"_flang\":\"markdown\",\"raw\":\"# Thank you\\r\\n\\r\\nThank you for your order! You can see the details below. If your order includes any digital downloads, those are listed to the right (or lower down the page on a phone or tablet).\",\"processed\":\"<h1>Thank you<\\/h1>\\n<p>Thank you for your order! You can see the details below. If your order includes any digital downloads, those are listed to the right (or lower down the page on a phone or tablet).<\\/p>\"}}',' Thank you\nThank you for your order! You can see the details below. If your order includes any digital downloads, those are listed to the right (or lower down the page on a phone or tablet). ','2016-04-09 12:19:02','1');
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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_content_regions`
--

LOCK TABLES `perch2_content_regions` WRITE;
/*!40000 ALTER TABLE `perch2_content_regions` DISABLE KEYS */;
INSERT INTO `perch2_content_regions` VALUES (1,1,'Sidebar: become a member','*','<div class=\"box members minor\">\n	<h2>Become a member</h2>\n	<p>Club members can get access to all sorts of useful information in the members area of our website. Sign up and log in today!</p>\n	<a class=\"button\" href=\"/members/register/\">Request an invitation</a>\n</div>',0,0,'sidebars/members.html',0,'{\"edit_mode\":\"listdetail\",\"searchURL\":\"\",\"title_delimit\":\"\",\"adminOnly\":0,\"addToTop\":0,\"limit\":false}',0,5,5,'*','0000-00-00 00:00:00'),(2,1,'Sidebar: social links','*','	<div class=\"social\">\n		<ul>\n			\n			<li><a class=\"twitter icon\" href=\"https://twitter.com/grabaperch\">Follow us on Twitter</a></li>\n			\n			<li><a class=\"facebook icon\" href=\"https://facebook.com/grabaperch\">Befriend us on Facebook</a></li>\n		</ul>\n	</div>',0,1,'sidebars/social.html',0,'{\"edit_mode\":\"listdetail\",\"searchURL\":\"\",\"title_delimit\":\"\",\"adminOnly\":0,\"addToTop\":0,\"limit\":false}',0,4,4,'*','0000-00-00 00:00:00'),(3,1,'Banner','/','<div class=\"banner\">\n	<img src=\"/perch/resources/home-banner.jpg\" alt=\"\" class=\"bg\" />\n	\n	<h1 class=\"club\">\n		<svg class=\"nest-logo\">\n			<use xlink:href=\"#nest-logo\"></use>\n		<svg>\n		<div>\n			<span class=\"offscreen\">Nest </span>Running Club\n		</div>\n	</h1>\n	<h2 class=\"strap\">Run for your life</h2>\n</div>',0,0,'home/banner.html',0,'{\"edit_mode\":\"singlepage\"}',1,11,11,'*','2016-03-28 16:59:04'),(6,1,'Site name','*','\n\nNest Running Club\nRun for your life',0,0,'home/site_name.html',0,'{\"edit_mode\":\"singlepage\"}',0,1,1,'*','0000-00-00 00:00:00'),(9,12,'Invitation to register','/members/register','<div class=\"box\">\n	<h1>Register today</h1>\n<p>Nest running club members should already have their membership details, but if you’re already a member part way through your yearly subscription, you can sign up here. Lynda will check your membership and enable your access. If you’ve not paid this year’s subscription yet, you can do that through the <a href=\"/shop\">Shop</a>.</p>\n<p>Members get access to information such as personal contact information that we’d rather not have freely available to all. It’s not that we’re paranoid, but you just never know who’s watching.</p>\n</div>',0,1,'text_block.html',0,'{\"edit_mode\":\"singlepage\"}',1,4,4,'*','2016-04-08 16:35:03'),(7,2,'About us','/about','<div class=\"box about\">\n	<h1>Who are we?</h1>\n\n	\n		<img src=\"/perch/resources/img1069-2-w280.jpg\" width=\"280\" height=\"186\" class=\"embedded\" alt=\"\" />\n	\n\n	<p>Hello, we’re <strong>Nest</strong> – a local running club for local people who like to run, locally. We’re really friendly and always welcome new members, as long as you’re local. So if you’re a local person who likes to run locally, pop along for a taster session. There’s no need to worry about joining, just come along and get a feel for the place. You can join if you’d like to attend regularly. We’re your local running club, locals.</p>\n<p>We meet locally every Monday, Wednesday, Thursday, Friday and Sunday. Also sometimes Tuesday and Saturday. You can join us just once a week, or a few days on the run. <em>On the run!</em> Ah haha!</p>\n<h2>Bring your own shoes</h2>\n<p>Sharing shoes is frowned upon, as fitting more than one foot per shoe is dangerous and isn’t covered by our insurance. Speaking of insurance, all signed up members are fully insured while carrying out club activities provided that both the member and the activity are local. Visitors run at their own risk, but let’s face it, the risk isn’t all that high. Alison slipped on the tow path last year and fell in the river, but apart from that, running is a fairly safe activity. (She was fine, by the way.)</p>\n<p>Come and join us!</p>\n</div>\n\n',0,1,'about/about_us.html',0,'{\"edit_mode\":\"singlepage\"}',1,18,18,'*','2016-04-08 16:37:46'),(8,7,'Contact form','/contact','<perch:form template=\"/templates/content/contact/form.html\" id=\"contact\" method=\"post\" app=\"perch_forms\" class=\"box contact\">\n	\n	<h2>Send us a message</h2>\n\n	\n\n	<div>\n		<perch:label for=\"name\">Your name:</perch:label>\n		<perch:input type=\"text\" id=\"name\" required=\"true\" label=\"Name\" />\n		<perch:error for=\"name\" type=\"required\">Please enter your name</perch:error>\n	</div>\n\n	<div>\n		<perch:label for=\"email\">Email address:</perch:label>\n		<perch:input type=\"email\" id=\"email\" required=\"true\" label=\"Email\" placeholder=\"you@example.com\" />\n		<perch:error for=\"email\" type=\"required\">Please add your email address</perch:error>\n		<perch:error for=\"email\" type=\"format\">Please check your email address</perch:error>\n	</div>\n\n	<div>\n		<perch:label for=\"message\">Comment:</perch:label>\n		<perch:input type=\"textarea\" id=\"message\" required=\"true\" label=\"Message\" />\n		<perch:error for=\"message\" type=\"required\">Please add a message</perch:error>\n	</div>\n\n	<div>\n		<perch:input type=\"submit\" value=\"Send message\" class=\"button\" />\n	</div>\n\n	<perch:success>\n		<div class=\"box contact\">\n			<h1>Thank you!</h1>\n\n<p>Thanks for dropping us a line. We&#8217;ll be in touch with a response shortly. Happy running!</p>\n		</div>\n	</perch:success>\n</perch:form>',0,1,'contact/form.html',0,'{\"edit_mode\":\"singlepage\"}',1,6,6,'*','2016-03-28 15:40:54'),(10,14,'Password reset information','/members/reset','<div class=\"box\">\n	<h2>Get a new password</h2>\n<p>Have you forgotten your password? You idiot! We can’t remind you of your old password (it’s stored in a secure way that means we can’t retrieve it) but we can send you a new one.</p>\n<p>If you’re already registered, enter your email address below, submit the form and we’ll send a new password to that email address.</p>\n</div>',0,1,'text_block.html',0,'{\"edit_mode\":\"singlepage\"}',1,4,4,'*','2016-04-08 16:36:16'),(11,10,'Login instructions','/members','<div class=\"box\">\n	<h1>Member login</h1>\n<p>The restricted access area of our site includes private information for club members. If you are a member of the club you can log in below.</p>\n<p>If you’re already a paid-up a member but don’t yet have a website account, then you need to <a href=\"/members/register/\">register</a> first. If you’ve not paid your subscription, you can do that from the <a href=\"/shop\">Shop</a> section and get instant access. If you’re not a member and have no intention of becoming one, there’s really nothing here for you. Nothing. Not a sausage.</p>\n</div>',0,1,'text_block.html',0,'{\"edit_mode\":\"singlepage\"}',1,6,6,'*','2016-04-08 16:32:06'),(12,10,'Private members intro','/members','<div class=\"box members\">\n	<h1>Members Area</h1>\n\n	\n		<img src=\"/perch/resources/img0043-w280.jpg\" width=\"280\" height=\"186\" class=\"embedded\" />\n	\n\n	<p>Welcome to our members-only area where we can discuss all the juicy gossip about the other local running clubs without them knowing! </p>\n<p>Would we do that? Of course we wouldn’t. Instead we’ve got some boring old documents with members addresses and phone numbers and stuff.</p>\n<h2>Training Plans</h2>\n<p>One thing we wouldn’t want other clubs to get their filthy mitts on is our exciting Training Plan PDF! Exclusive to club members, this PDF helps you plan out your complete training programme. It’s such a competitive advantage that by the time you’ve filled it out you hardly need to train at all. Check it out!</p>\n</div>\n\n',0,1,'members/intro.html',0,'{\"edit_mode\":\"singlepage\"}',1,5,5,'*','2016-04-08 16:38:33'),(13,10,'Files for members','/members','\n<div class=\"box members minor\">\n	<h2>Members only info</h2>\n\n\n<div class=\"file\">\n	<a href=\"/members/file/annual-report.pdf\" class=\"button\">Annual Report</a>\n	<p>This is our annual club report, as presented and signed off at this year’s Annual General Meeting by the committee and the club chairman.</p>\n	\n</div>\n\n\n\n<div class=\"file\">\n	<a href=\"/members/file/training-plan.pdf\" class=\"button\">Training Plan</a>\n	<p>Our exclusive club training plan PDF. This is like <em>training gold</em>! Fill out all the boxes and you’re bound to beat your PB by miles.</p>\n	\n</div>\n\n\n</div>\n',0,2,'members/secure_file.html',1,'{\"edit_mode\":\"listdetail\",\"sortOrder\":\"ASC\",\"sortField\":\"\",\"limit\":\"\",\"searchURL\":\"\",\"addToTop\":\"\",\"column_ids\":\"title, file[size]\",\"title_delimit\":\"\",\"adminOnly\":0}',1,16,16,'*','2016-04-08 16:39:19'),(16,18,'Error description','/errors/404','<!-- Undefined content: Error description -->',1,0,'',0,'',1,0,0,'*','2016-03-28 15:24:03'),(17,21,'Your cart is empty','/shop/cart','<div class=\"box\">\n	<p>Your cart is currently empty. <a href=\"/shop\">Find some exciting products</a></p>\n</div>',0,1,'text_block.html',0,'{\"edit_mode\":\"singlepage\"}',1,2,2,'*','2016-04-08 16:35:30'),(18,21,'Sidebar: promo code','/shop/cart','<div class=\"box members minor\">\n	<perch:form template=\"/templates/content/shop/promo_code.html\" id=\"discount_code\" app=\"perch_shop\">\n		<h2>Coupon code</h2>\n		<p>Do you have a coupon code for a discount? Lucky old you. You can enter it here for untold secrets to be revealed.</p>\n		<div>\n			<perch:label for=\"name\">Code</perch:label>\n			<perch:input type=\"text\" id=\"discount_code\" required=\"true\" />\n		</div>\n		<div>\n			<button type=\"submit\" class=\"button\">Apply code</button>\n			<perch:input type=\"cms\" />\n		</div>\n	</perch:form>\n</div>',0,2,'shop/promo_code.html',0,'{\"edit_mode\":\"singlepage\"}',1,7,7,'*','2016-04-08 10:32:34'),(19,22,'Sidebar: promo code','/shop/checkout','<!-- Undefined content: Sidebar: promo code -->',1,1,'',0,'',1,0,0,'*','2016-04-07 14:14:10'),(20,24,'Order successful','/shop/result','<div class=\"box\">\n	<h1>Thank you</h1>\n<p>Thank you for your order! You can see the details below. If your order includes any digital downloads, those are listed to the right (or lower down the page on a phone or tablet).</p>\n</div>',0,1,'text_block.html',0,'{\"edit_mode\":\"singlepage\"}',1,4,4,'*','2016-04-09 12:19:02'),(21,24,'Sidebar: promo code','/shop/result','<!-- Undefined content: Sidebar: promo code -->',1,2,'',0,'',1,0,0,'*','2016-04-07 17:19:46'),(24,10,'Membership renewal information','/members','<div class=\"box members\">\n	<h1>Welcome back!</h1>\n\n	\n\n	<p>It looks like you’re all logged in with your account, which is great. You don’t appear to have a current Nest Running Club membership, however.</p>\n<p>That might be because you’re new around here, or perhaps yours has just expired. Memberships expire every 12 months. If you need to renew or join up for the first time, add a membership to your cart below!</p>\n</div>\n\n',0,1,'members/intro.html',0,'{\"edit_mode\":\"singlepage\"}',1,2,2,'*','2016-04-08 16:38:40');
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
INSERT INTO `perch2_events` VALUES (1,'Award Ceremony','2020-07-14-award-ceremony','2020-07-14 19:30:00','Our annual awards show. Join us for a lavish formal dinner and awards ceremony. Just like last year, this is being held at the Birds Golf Club, just up road from the running club.\r\n\r\n**Dress code is black tie.** That means strictly _no lycra_ and absolutely _no running shoes_. The golf club have been quite clear on this point. Quite clear.\r\n\r\nTo encourage a high standard of dress, there will be a special prize for the best dressed couple on the evening, as judged by the committee. So gents get your dinner jackets dry cleaned, and ladies perhaps it\'s time for a new frock. We know you don\'t need an excuse! (_Our lady chairman informs me this may be a bit sexist. So ladies, any old frock will do._)','<p>Our annual awards show. Join us for a lavish formal dinner and awards ceremony. Just like last year, this is being held at the Birds Golf Club, just up road from the running club.</p>\n\n<p><b>Dress code is black tie.</b> That means strictly <em>no lycra</em> and absolutely <em>no running shoes</em>. The golf club have been quite clear on this point. Quite clear.</p>\n\n<p>To encourage a high standard of dress, there will be a special prize for the best dressed couple on the evening, as judged by the committee. So gents get your dinner jackets dry cleaned, and ladies perhaps it&#8217;s time for a new frock. We know you don&#8217;t need an excuse! (<em>Our lady chairman informs me this may be a bit sexist. So ladies, any old frock will do.</em>)</p>','{\"summary\":{\"_flang\":\"markdown\",\"raw\":\"Our annual awards show. Join us for a lavish formal dinner and awards ceremony.\",\"processed\":\"<p>Our annual awards show. Join us for a lavish formal dinner and awards ceremony.<\\/p>\"}}'),(2,'The Nest 10k','2020-07-23-the-nest-10k','2020-07-23 09:15:00','We host our very own 10k race for other local clubs to compete in. \r\n\r\nWe run about 10,000 metres in more or less a circle. I know that sounds like a pointless activity, but it\'s really quite fun. Ok, maybe not exactly fun, but it\'s really healthy. Fresh air, a bracing wind, sunshine (sometimes) and birdsong. What more could you want?\r\n\r\nThe race starts at 9.15am sharp from the start line. Or the finish line -- they\'re both the same thing. It doesn\'t matter if you think of it as the start of the finish, but strictly speaking it\'s the start. It becomes the finish at the end. But 9.15 sharp!\r\n\r\nThere will be a water stop halfway around near St Abbott\'s primary school playground. Following last year\'s incident at the water station (which I\'m sure I need not mention) all runners are required to keep all their running kit on at the water stop.\r\n\r\nPlease invite your friends from other clubs to join us!','<p>We host our very own 10k race for other local clubs to compete in. </p>\n\n<p>We run about 10,000 metres in more or less a circle. I know that sounds like a pointless activity, but it&#8217;s really quite fun. Ok, maybe not exactly fun, but it&#8217;s really healthy. Fresh air, a bracing wind, sunshine (sometimes) and birdsong. What more could you want?</p>\n\n<p>The race starts at 9.15am sharp from the start line. Or the finish line &#8212; they&#8217;re both the same thing. It doesn&#8217;t matter if you think of it as the start of the finish, but strictly speaking it&#8217;s the start. It becomes the finish at the end. But 9.15 sharp!</p>\n\n<p>There will be a water stop halfway around near St Abbott&#8217;s primary school playground. Following last year&#8217;s incident at the water station (which I&#8217;m sure I need not mention) all runners are required to keep all their running kit on at the water stop.</p>\n\n<p>Please invite your friends from other clubs to join us!</p>','{\"summary\":{\"_flang\":\"markdown\",\"raw\":\"We host our very own 10k race for other local clubs to compete in.\",\"processed\":\"<p>We host our very own 10k race for other local clubs to compete in.<\\/p>\"}}'),(3,'Summer BBQ Social','2020-08-23-summer-bbq-social','2020-08-23 18:00:00','Following the success of last year\'s BBQ, despite the weather, we\'re holding another one! This is a real family event, so bring the kids and the dog! _(No dogs allowed.)_\r\n\r\nWe\'re taking over the field in the centre of the running track. There will be games, fun competitions and plenty of hot dogs and burgers-in-a-bun. Vegetarians are advised to bring some lettuce. Vegans should bring whatever it is you people eat. Or try a burger!\r\n\r\nLast year the weather was a little on the damp side. Although no one was actually struck by the lightening, it did get a bit hairy. This year we\'ll make sure that someone brings the keys to the clubhouse so that we can get in and shelter should the weather turn.\r\n\r\nI\'ll remind all members that Tony is still missing a green tartan picnic rug from last year, so keep your eyes peeled. \r\n\r\nTickets are £8 each, or £20 for a family of four.','<p>Following the success of last year&#8217;s <span class=\"caps\">BBQ</span>, despite the weather, we&#8217;re holding another one! This is a real family event, so bring the kids and the dog! <em>(No dogs allowed.)</em></p>\n\n<p>We&#8217;re taking over the field in the centre of the running track. There will be games, fun competitions and plenty of hot dogs and burgers-in-a-bun. Vegetarians are advised to bring some lettuce. Vegans should bring whatever it is you people eat. Or try a burger!</p>\n\n<p>Last year the weather was a little on the damp side. Although no one was actually struck by the lightening, it did get a bit hairy. This year we&#8217;ll make sure that someone brings the keys to the clubhouse so that we can get in and shelter should the weather turn.</p>\n\n<p>I&#8217;ll remind all members that Tony is still missing a green tartan picnic rug from last year, so keep your eyes peeled. </p>\n\n<p>Tickets are £8 each, or £20 for a family of four.</p>','{\"summary\":{\"_flang\":\"markdown\",\"raw\":\"Our summer BBQ special returns! This is a real family event, so bring the kids and the dog! (No dogs allowed.)\",\"processed\":\"<p>Our summer BBQ special returns! This is a real family event, so bring the kids and the dog! (No dogs allowed.)<\\/p>\"}}');
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
INSERT INTO `perch2_forms` VALUES (1,'contact','Contact','/templates/content/contact/form.html','{\"store\":\"1\",\"fileLocation\":\"\",\"email\":\"1\",\"emailAddress\":\"REPLACE_hello@grabaperch.com\",\"adminEmailMessage\":\"Here\'s a message someone has sent from the website contact form.\",\"adminEmailSubject\":\"Nest running club contact form\",\"adminEmailFromName\":\"REPLACE_firstname REPLACE_lastname\",\"adminEmailFromAddress\":\"REPLACE_hello@grabaperch.com\",\"akismetAPIKey\":\"\"}');
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
INSERT INTO `perch2_gallery_albums` VALUES (1,'Race Highlights','race-highlights',1,'{\"description\":{\"_flang\":\"markdown\",\"raw\":\"Some highlights from recent races run by our members or organised by the club. Can you see yourself?\",\"processed\":\"<p>Some highlights from recent races run by our members or organised by the club. Can you see yourself?<\\/p>\"},\"date\":\"2013-05-20\",\"featured\":\"1\"}',5),(2,'Reading Half 2012','reading-half-2012',2,'{\"description\":{\"_flang\":\"markdown\",\"raw\":\"The Reading Half Marathon, April 2012, in Reading.\",\"processed\":\"<p>The Reading Half Marathon, April 2012, in Reading.<\\/p>\"},\"date\":\"2012-04-01\",\"featured\":null}',4),(3,'Reading Half 2011','reading-half-2011',3,'{\"description\":{\"_flang\":\"markdown\",\"raw\":\"The Reading Half Marathon 2011.\",\"processed\":\"<p>The Reading Half Marathon 2011.<\\/p>\"},\"date\":\"2011-03-20\",\"featured\":null}',9),(4,'Wycombe 10k 2011','wycombe-10k-2011',4,'{\"description\":{\"_flang\":\"markdown\",\"raw\":\"The Wycombe 10k race held in High Wycombe\",\"processed\":\"<p>The Wycombe 10k race held in High Wycombe<\\/p>\"},\"date\":\"2011-07-17\",\"featured\":null}',8);
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
  `memberPassword` char(255) DEFAULT NULL,
  `memberStatus` enum('pending','active','inactive') NOT NULL DEFAULT 'pending',
  `memberCreated` datetime NOT NULL DEFAULT '2013-01-01 00:00:00',
  `memberExpires` datetime DEFAULT NULL,
  `memberProperties` text NOT NULL,
  PRIMARY KEY (`memberID`),
  KEY `idx_email` (`memberEmail`),
  KEY `idx_type` (`memberAuthType`),
  KEY `idx_active` (`memberStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_members_forms`
--

LOCK TABLES `perch2_members_forms` WRITE;
/*!40000 ALTER TABLE `perch2_members_forms` DISABLE KEYS */;
INSERT INTO `perch2_members_forms` VALUES (1,'register.default','Registration form','{\"moderate\":\"1\",\"moderator_email\":\"flintstone@example.com\",\"default_tags\":\"member\"}'),(2,'register','Registration form','');
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_navigation_pages`
--

LOCK TABLES `perch2_navigation_pages` WRITE;
/*!40000 ALTER TABLE `perch2_navigation_pages` DISABLE KEYS */;
INSERT INTO `perch2_navigation_pages` VALUES (1,10,1,0,2,1,'000-002'),(2,11,1,0,3,1,'000-003'),(3,12,1,10,2,2,'000-002-002'),(4,13,1,0,1,2,'000-000'),(6,21,1,0,1,1,'000-001');
/*!40000 ALTER TABLE `perch2_navigation_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_page_routes`
--

DROP TABLE IF EXISTS `perch2_page_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_page_routes` (
  `routeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageID` int(10) unsigned NOT NULL DEFAULT '0',
  `routePattern` char(255) NOT NULL DEFAULT '',
  `routeRegExp` char(255) NOT NULL DEFAULT '',
  `routeOrder` int(10) unsigned NOT NULL,
  PRIMARY KEY (`routeID`),
  KEY `idx_page` (`pageID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_page_routes`
--

LOCK TABLES `perch2_page_routes` WRITE;
/*!40000 ALTER TABLE `perch2_page_routes` DISABLE KEYS */;
INSERT INTO `perch2_page_routes` VALUES (1,3,'events/[slug:event]','^/events/(?<event>[a-z0-9\\-%\\+]+)/?$',1),(2,4,'gallery/[slug:album]','^/gallery/(?<album>[a-z0-9\\-%\\+]+)/?$',1),(3,15,'blog/[slug:s]','^/blog/(?<s>[a-z0-9\\-%\\+]+)/?$',1),(4,26,'members/file/[*:file]','^/members/file/(?<file>.*?)/?$',1),(6,28,'shop/download/[i:file]','^/shop/download/(?<file>[0-9]+)/?$',1);
/*!40000 ALTER TABLE `perch2_page_routes` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_page_templates`
--

LOCK TABLES `perch2_page_templates` WRITE;
/*!40000 ALTER TABLE `perch2_page_templates` DISABLE KEYS */;
INSERT INTO `perch2_page_templates` VALUES (1,'Default','default.php',0,1,''),(2,'About','about.php',0,1,''),(3,'404','errors/404.php',0,1,''),(4,'Listing','events/listing.php',0,1,''),(5,'Rss','events/rss.php',0,1,''),(6,'Gallery','gallery/gallery.php',0,1,''),(7,'Listing','blog/listing.php',0,1,''),(8,'Post','blog/post.php',0,1,''),(9,'Rss','blog/rss.php',0,1,''),(10,'Contact','contact.php',0,1,''),(11,'Home','home.php',0,1,''),(12,'Logout','logout.php',0,1,''),(13,'Cart','shop/cart.php',0,1,''),(14,'Checkout','shop/checkout.php',0,1,''),(15,'Product','shop/product.php',0,1,''),(16,'Products','shop/products.php',0,1,''),(17,'Register','shop/register.php',0,1,''),(18,'Result','shop/result.php',0,1,''),(19,'Download File','members/download_file.php',0,1,''),(20,'Members Area','members/members_area.php',0,1,''),(21,'Password Reset','members/password_reset.php',0,1,''),(22,'Register','members/register.php',0,1,''),(23,'Download File','shop/download_file.php',0,1,'');
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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_pages`
--

LOCK TABLES `perch2_pages` WRITE;
/*!40000 ALTER TABLE `perch2_pages` DISABLE KEYS */;
INSERT INTO `perch2_pages` VALUES (1,0,'/','Welcome','Home page',0,1,1,'/','000-001','','/',1,0,'',0,'2016-03-28 17:59:04','','default.html','home.php',11,'',''),(2,0,'/about','About','About',0,2,1,'/about','000-002','','/about',0,0,'',0,'2016-04-08 17:37:46','','default.html','about.php',2,'',''),(3,0,'/events','Events','Events',0,3,1,'/events','000-003','','',0,0,'',0,'2016-03-28 16:30:38','','default.html','events/listing.php',4,'',''),(4,0,'/gallery','Gallery','Gallery',0,4,1,'/gallery','000-004','','',0,0,'',0,'2016-03-28 16:34:44','','default.html','gallery/gallery.php',6,'',''),(5,0,'/blog','Blog','Blog',0,5,1,'/blog','000-005','','',0,0,'',0,'2016-03-28 16:37:12','','default.html','blog/listing.php',7,'',''),(6,0,'/shop','Shop','Shop',0,7,1,'/shop','000-007','','',0,0,'',0,'2016-03-29 09:15:04','','default.html','shop/products.php',16,'',''),(7,0,'/contact','Contact','Contact',0,6,1,'/contact','000-006','','',0,0,'',0,'2016-03-28 16:41:09','','default.html','contact.php',10,'',''),(10,0,'/members','Members','Member Login',0,8,1,'/members','000-009','','/members',1,0,'',0,'2016-04-08 17:39:19','','default.html','members/members_area.php',20,'',''),(11,0,'/logout','Log out','Log out',0,9,1,'/logout','000-010','','/',1,0,'member',0,'2016-03-29 09:13:06','','default.html','logout.php',12,'',''),(12,10,'/members/register','Register','Register',0,1,2,'/members/register','000-009-001','','/',0,0,'',0,'2016-04-08 17:35:03','','default.html','members/register.php',22,'',''),(15,5,'/blog/post','Post','Post',0,1,2,'/blog/post','000-005-001','','/blog',1,0,'',0,'2016-03-28 16:37:47','','default.html','blog/post.php',8,'',''),(14,10,'/members/reset','Reset','Reset',0,3,2,'/members/reset','000-009-004','','/members/reset',0,0,'',0,'2016-04-08 17:36:16','','default.html','members/password_reset.php',21,'',''),(18,0,'/errors/404','404','404',0,10,1,'/errors/404','000-011','','',1,0,'',0,'2016-03-28 16:40:37','','default.html','',0,'',''),(19,3,'/events/rss','RSS','RSS',0,1,2,'/events/rss','000-003-001','','',0,0,'',1,'2016-03-28 16:31:00','','default.html','events/rss.php',5,'',''),(20,5,'/blog/rss','RSS','RSS',0,2,2,'/blog/rss','000-005-003','','',0,0,'',1,'2016-03-28 16:38:00','','default.html','blog/rss.php',9,'',''),(21,6,'/shop/cart','Cart','Cart',0,1,2,'/shop/cart','000-007-001','','',0,0,'',1,'2016-04-08 17:35:30','','default.html','shop/cart.php',13,'',''),(22,6,'/shop/checkout','Checkout','Checkout',0,2,2,'/shop/checkout','000-007-003','','',0,0,'',1,'2016-04-07 15:14:09','','default.html','shop/checkout.php',14,'',''),(23,6,'/shop/register','Register','Register',0,3,2,'/shop/register','000-007-004','','',0,0,'',1,'2016-04-07 15:33:03','','default.html','shop/register.php',17,'',''),(24,6,'/shop/result','Payment result','Payment result',0,4,2,'/shop/result','000-007-005','','',1,0,'',1,'2016-04-09 13:19:02','','default.html','shop/result.php',18,'',''),(26,10,'/members/file','Download file','Download file',0,3,2,'/members/file','000-009-003','','',0,0,'',1,'2016-04-08 14:15:23','','default.html','members/download_file.php',19,'',''),(28,6,'/shop/download','Download purchased file','Download purchased file',0,5,2,'/shop/download','000-007-006','','',0,0,'',1,'2016-04-09 13:22:07','','default.html','shop/download_file.php',23,'','');
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
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_resource_log`
--

LOCK TABLES `perch2_resource_log` WRITE;
/*!40000 ALTER TABLE `perch2_resource_log` DISABLE KEYS */;
INSERT INTO `perch2_resource_log` VALUES (1,'content','itemRowID',51,15),(2,'content','itemRowID',51,16),(3,'content','itemRowID',51,17),(4,'content','itemRowID',63,29),(5,'content','itemRowID',63,30),(6,'content','itemRowID',63,31),(7,'content','itemRowID',76,33),(8,'content','itemRowID',77,34),(187,'perch_shop','productID',1,90),(188,'perch_shop','productID',1,91),(11,'perch_gallery','albumID',3,38),(12,'perch_gallery','albumID',3,40),(13,'perch_gallery','albumID',3,42),(14,'perch_gallery','albumID',3,44),(15,'perch_gallery','albumID',3,46),(16,'perch_gallery','albumID',3,48),(17,'perch_gallery','albumID',3,50),(18,'perch_gallery','albumID',3,52),(19,'perch_gallery','albumID',3,54),(20,'perch_gallery','albumID',4,56),(21,'perch_gallery','albumID',4,58),(22,'perch_gallery','albumID',4,60),(23,'perch_gallery','albumID',4,62),(24,'perch_gallery','albumID',4,64),(25,'perch_gallery','albumID',4,66),(26,'perch_gallery','albumID',4,68),(27,'perch_gallery','albumID',4,70),(28,'perch_gallery','albumID',2,72),(29,'perch_gallery','albumID',2,74),(30,'perch_gallery','albumID',2,76),(31,'perch_gallery','albumID',2,78),(32,'perch_gallery','albumID',1,80),(33,'perch_gallery','albumID',1,82),(34,'perch_gallery','albumID',1,84),(35,'perch_gallery','albumID',1,86),(36,'perch_gallery','albumID',1,88),(178,'perch_blog','postID',2,25),(177,'perch_blog','postID',2,24),(176,'perch_blog','postID',2,23),(175,'perch_blog','postID',2,22),(41,'perch_shop_paypal','productID',2,26),(42,'perch_shop_paypal','productID',2,27),(43,'perch_shop_paypal','productID',2,28),(47,'content','itemRowID',85,2),(46,'content','itemRowID',85,1),(51,'content','itemRowID',86,2),(50,'content','itemRowID',86,1),(55,'content','itemRowID',87,2),(54,'content','itemRowID',87,1),(59,'content','itemRowID',88,2),(58,'content','itemRowID',88,1),(64,'content','itemRowID',90,1),(65,'content','itemRowID',90,2),(69,'content','itemRowID',91,2),(68,'content','itemRowID',91,1),(73,'content','itemRowID',92,2),(72,'content','itemRowID',92,1),(77,'content','itemRowID',93,2),(76,'content','itemRowID',93,1),(186,'perch_shop','productID',1,27),(185,'perch_shop','productID',1,26),(189,'perch_shop','productID',1,92),(106,'perch_shop','productID',42,95),(105,'perch_shop','productID',42,94),(104,'perch_shop','productID',42,93),(103,'perch_shop','productID',42,30),(102,'perch_shop','productID',42,29),(112,'content','itemRowID',116,17),(111,'content','itemRowID',116,16),(110,'content','itemRowID',116,15),(118,'content','itemRowID',117,17),(117,'content','itemRowID',117,16),(116,'content','itemRowID',117,15),(124,'content','itemRowID',118,31),(123,'content','itemRowID',118,30),(122,'content','itemRowID',118,29),(127,'content','itemRowID',120,33),(126,'content','itemRowID',121,34),(128,'content','itemRowID',122,33),(130,'content','itemRowID',123,34),(179,'perch_shop','fileID',1,96),(170,'perch_shop','productID',43,110),(166,'perch_shop','productID',43,106),(167,'perch_shop','productID',43,107),(168,'perch_shop','productID',43,108),(169,'perch_shop','productID',43,109);
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
  KEY `idx_list` (`resourceParentID`,`resourceKey`,`resourceAWOL`),
  FULLTEXT KEY `idx_search` (`resourceTitle`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_resources`
--

LOCK TABLES `perch2_resources` WRITE;
/*!40000 ALTER TABLE `perch2_resources` DISABLE KEYS */;
INSERT INTO `perch2_resources` VALUES (1,'content','default','home-banner.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Home banner',34130,1200,350,0,1,NULL,NULL,'image/jpeg',0),(2,'content','default','home-banner-thumb.jpg','thumb',1,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,1504,150,43,0,1,150,150,'image/jpeg',0),(37,'perch_shop','default','dscf0729-w600h600@2x.jpg','',35,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,199735,600,600,1,2,600,600,'image/jpeg',0),(36,'perch_shop','default','dscf0729-thumb.jpg','thumb',35,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,5484,150,112,0,1,150,150,'image/jpeg',0),(35,'perch_shop','default','dscf0729.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Dscf0729',128838,1024,768,0,1,NULL,NULL,'image/jpeg',0),(33,'content','members','annual-report.pdf','orig',0,'pdf','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Annual report',23364,NULL,NULL,0,1,NULL,NULL,'',0),(15,'content','default','img1069-2.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Img1069 2',186483,1024,683,0,1,NULL,NULL,'image/jpeg',0),(16,'content','default','img1069-2-thumb.jpg','thumb',15,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,6800,150,100,0,1,150,150,'image/jpeg',0),(17,'content','default','img1069-2-w280.jpg','',15,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,15540,280,186,0,1,280,NULL,'image/jpeg',0),(18,'perch_blog','default','img0306.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Img0306',173741,1024,683,0,1,NULL,NULL,'image/jpeg',0),(19,'perch_blog','default','img0306-thumb.jpg','thumb',18,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,6205,150,100,0,1,150,150,'image/jpeg',0),(20,'perch_blog','default','img0306-w320h240.jpg','',18,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,19312,320,240,1,1,320,240,'image/jpeg',0),(21,'perch_blog','default','img0306-w50h50.jpg','',18,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,1703,50,50,1,1,50,50,'image/jpeg',0),(22,'perch_blog','default','img0306-1.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Img0306 1',173741,1024,683,0,1,NULL,NULL,'image/jpeg',0),(23,'perch_blog','default','img0306-1-thumb.jpg','thumb',22,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,6205,150,100,0,1,150,150,'image/jpeg',0),(24,'perch_blog','default','img0306-1-w500.jpg','',22,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,35426,500,333,0,1,500,NULL,'image/jpeg',0),(25,'perch_blog','default','img0306-1-w140h140@2x.jpg','',22,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,18660,140,140,1,2,140,140,'image/jpeg',0),(26,'perch_shop','default','img0259.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Img0259',152263,1024,683,0,1,NULL,NULL,'image/jpeg',0),(27,'perch_shop','default','img0259-thumb.jpg','thumb',26,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,4770,150,100,0,1,150,150,'image/jpeg',0),(28,'perch_shop','default','img0259-w600h600@2x.jpg','',26,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,149670,600,600,1,2,600,600,'image/jpeg',0),(29,'content','default','img0043.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Img0043',304542,1024,683,0,1,NULL,NULL,'image/jpeg',0),(30,'content','default','img0043-thumb.jpg','thumb',29,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,7288,150,100,0,1,150,150,'image/jpeg',0),(31,'content','default','img0043-w280.jpg','',29,'jpg','2000-01-01 00:00:00','2014-07-11 06:41:40',0,NULL,20868,280,186,0,1,280,NULL,'image/jpeg',0),(34,'content','members','training-plan.pdf','orig',0,'pdf','2000-01-01 00:00:00','2014-07-11 06:41:40',0,'Training plan',30553,NULL,NULL,0,1,NULL,NULL,'',0),(38,'perch_gallery','gallery','img_1039.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1039',113452,1024,682,0,1,NULL,NULL,'image/jpeg',0),(39,'perch_gallery','gallery','img_1039-w80h80@2x.jpg','thumb',38,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1039',9674,80,80,1,2,80,80,'image/jpeg',0),(40,'perch_gallery','gallery','img_1069.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1069',99165,1024,683,0,1,NULL,NULL,'image/jpeg',0),(41,'perch_gallery','gallery','img_1069-w80h80@2x.jpg','thumb',40,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1069',8381,80,80,1,2,80,80,'image/jpeg',0),(42,'perch_gallery','gallery','img_1084.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1084',141340,1024,683,0,1,NULL,NULL,'image/jpeg',0),(43,'perch_gallery','gallery','img_1084-w80h80@2x.jpg','thumb',42,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1084',11254,80,80,1,2,80,80,'image/jpeg',0),(44,'perch_gallery','gallery','img_1096.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1096',108993,1024,683,0,1,NULL,NULL,'image/jpeg',0),(45,'perch_gallery','gallery','img_1096-w80h80@2x.jpg','thumb',44,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1096',9545,80,80,1,2,80,80,'image/jpeg',0),(46,'perch_gallery','gallery','img_1099.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1099',135604,1024,683,0,1,NULL,NULL,'image/jpeg',0),(47,'perch_gallery','gallery','img_1099-w80h80@2x.jpg','thumb',46,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1099',10976,80,80,1,2,80,80,'image/jpeg',0),(48,'perch_gallery','gallery','img_1102.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1102',122486,1024,683,0,1,NULL,NULL,'image/jpeg',0),(49,'perch_gallery','gallery','img_1102-w80h80@2x.jpg','thumb',48,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1102',9802,80,80,1,2,80,80,'image/jpeg',0),(50,'perch_gallery','gallery','img_1109.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1109',166683,1024,683,0,1,NULL,NULL,'image/jpeg',0),(51,'perch_gallery','gallery','img_1109-w80h80@2x.jpg','thumb',50,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1109',12122,80,80,1,2,80,80,'image/jpeg',0),(52,'perch_gallery','gallery','img_1114.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1114',146209,1024,682,0,1,NULL,NULL,'image/jpeg',0),(53,'perch_gallery','gallery','img_1114-w80h80@2x.jpg','thumb',52,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1114',10460,80,80,1,2,80,80,'image/jpeg',0),(54,'perch_gallery','gallery','img_1117.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1117',145805,1024,683,0,1,NULL,NULL,'image/jpeg',0),(55,'perch_gallery','gallery','img_1117-w80h80@2x.jpg','thumb',54,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_1117',11313,80,80,1,2,80,80,'image/jpeg',0),(56,'perch_gallery','gallery','img_0043.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0043',179085,1024,683,0,1,NULL,NULL,'image/jpeg',0),(57,'perch_gallery','gallery','img_0043-w80h80@2x.jpg','thumb',56,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0043',10643,80,80,1,2,80,80,'image/jpeg',0),(58,'perch_gallery','gallery','img_0259.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0259',69687,1024,683,0,1,NULL,NULL,'image/jpeg',0),(59,'perch_gallery','gallery','img_0259-w80h80@2x.jpg','thumb',58,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0259',6630,80,80,1,2,80,80,'image/jpeg',0),(60,'perch_gallery','gallery','img_0260.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0260',155207,1024,683,0,1,NULL,NULL,'image/jpeg',0),(61,'perch_gallery','gallery','img_0260-w80h80@2x.jpg','thumb',60,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0260',7900,80,80,1,2,80,80,'image/jpeg',0),(62,'perch_gallery','gallery','img_0261.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0261',82328,1024,683,0,1,NULL,NULL,'image/jpeg',0),(63,'perch_gallery','gallery','img_0261-w80h80@2x.jpg','thumb',62,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0261',8035,80,80,1,2,80,80,'image/jpeg',0),(64,'perch_gallery','gallery','img_0267.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0267',55609,1024,683,0,1,NULL,NULL,'image/jpeg',0),(65,'perch_gallery','gallery','img_0267-w80h80@2x.jpg','thumb',64,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0267',5523,80,80,1,2,80,80,'image/jpeg',0),(66,'perch_gallery','gallery','img_0276.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0276',66137,1024,683,0,1,NULL,NULL,'image/jpeg',0),(67,'perch_gallery','gallery','img_0276-w80h80@2x.jpg','thumb',66,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:40',0,'img_0276',6233,80,80,1,2,80,80,'image/jpeg',0),(68,'perch_gallery','gallery','img_0280.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_0280',91372,1024,683,0,1,NULL,NULL,'image/jpeg',0),(69,'perch_gallery','gallery','img_0280-w80h80@2x.jpg','thumb',68,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_0280',7717,80,80,1,2,80,80,'image/jpeg',0),(70,'perch_gallery','gallery','img_0306.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_0306',93193,1024,683,0,1,NULL,NULL,'image/jpeg',0),(71,'perch_gallery','gallery','img_0306-w80h80@2x.jpg','thumb',70,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_0306',7977,80,80,1,2,80,80,'image/jpeg',0),(72,'perch_gallery','gallery','img_4309.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4309',131459,1024,683,0,1,NULL,NULL,'image/jpeg',0),(73,'perch_gallery','gallery','img_4309-w80h80@2x.jpg','thumb',72,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4309',10036,80,80,1,2,80,80,'image/jpeg',0),(74,'perch_gallery','gallery','img_4310.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4310',120746,1024,683,0,1,NULL,NULL,'image/jpeg',0),(75,'perch_gallery','gallery','img_4310-w80h80@2x.jpg','thumb',74,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4310',10776,80,80,1,2,80,80,'image/jpeg',0),(76,'perch_gallery','gallery','img_4311.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4311',99579,1024,683,0,1,NULL,NULL,'image/jpeg',0),(77,'perch_gallery','gallery','img_4311-w80h80@2x.jpg','thumb',76,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4311',9978,80,80,1,2,80,80,'image/jpeg',0),(78,'perch_gallery','gallery','img_4316.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4316',158784,1024,683,0,1,NULL,NULL,'image/jpeg',0),(79,'perch_gallery','gallery','img_4316-w80h80@2x.jpg','thumb',78,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_4316',11040,80,80,1,2,80,80,'image/jpeg',0),(80,'perch_gallery','gallery','img_7847.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7847',178906,1024,683,0,1,NULL,NULL,'image/jpeg',0),(81,'perch_gallery','gallery','img_7847-w80h80@2x.jpg','thumb',80,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7847',11001,80,80,1,2,80,80,'image/jpeg',0),(82,'perch_gallery','gallery','img_7848.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7848',114959,1024,683,0,1,NULL,NULL,'image/jpeg',0),(83,'perch_gallery','gallery','img_7848-w80h80@2x.jpg','thumb',82,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7848',10397,80,80,1,2,80,80,'image/jpeg',0),(84,'perch_gallery','gallery','img_7853.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7853',96050,1024,683,0,1,NULL,NULL,'image/jpeg',0),(85,'perch_gallery','gallery','img_7853-w80h80@2x.jpg','thumb',84,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7853',8594,80,80,1,2,80,80,'image/jpeg',0),(86,'perch_gallery','gallery','img_7877.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7877',106646,1024,683,0,1,NULL,NULL,'image/jpeg',0),(87,'perch_gallery','gallery','img_7877-w80h80@2x.jpg','thumb',86,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7877',9061,80,80,1,2,80,80,'image/jpeg',0),(88,'perch_gallery','gallery','img_7879.jpg','orig',0,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7879',175047,1024,683,0,1,NULL,NULL,'image/jpeg',0),(89,'perch_gallery','gallery','img_7879-w80h80@2x.jpg','thumb',88,'jpg','2014-07-11 07:41:40','2014-07-11 06:41:41',0,'img_7879',9661,80,80,1,2,80,80,'image/jpeg',0),(90,'perch_shop','default','img0259-w800.jpg','',26,'jpg','2016-04-01 16:02:11','2016-04-01 15:02:11',0,'Img0259 w800',52719,800,533,0,1,800,0,'image/jpeg',0),(91,'perch_shop','default','img0259-w80h80@1.6x.jpg','',26,'jpg','2016-04-01 16:02:11','2016-04-01 15:02:11',0,'Img0259 w80h80@1.6x',5241,80,80,1,1.6,80,80,'image/jpeg',0),(92,'perch_shop','default','img0259-w600h600@1.6x.jpg','',26,'jpg','2016-04-01 16:05:14','2016-04-01 15:05:14',0,'Img0259 w600h600@1.6x',111228,600,600,1,1.6,600,600,'image/jpeg',0),(93,'perch_shop','default','img0043-w800.jpg','',29,'jpg','2016-04-08 13:26:57','2016-04-08 12:26:57',0,'Img0043 w800',117982,800,533,0,1,800,0,'image/jpeg',0),(94,'perch_shop','default','img0043-w80h80@1.6x.jpg','',29,'jpg','2016-04-08 13:26:57','2016-04-08 12:26:57',0,'Img0043 w80h80@1.6x',8008,80,80,1,1.6,80,80,'image/jpeg',0),(95,'perch_shop','default','img0043-w600h600@1.6x.jpg','',29,'jpg','2016-04-08 13:26:57','2016-04-08 12:26:57',0,'Img0043 w600h600@1.6x',207287,600,600,1,1.6,600,600,'image/jpeg',0),(96,'assets','shop','clubanthem.mp3','orig',0,'mp3','2016-04-09 12:09:03','2016-04-09 11:09:03',0,'Club anthem',68766,NULL,NULL,0,1,NULL,NULL,'audio/mpeg',0),(97,'perch_shop','default','home-banner-w800.jpg','',1,'jpg','2016-04-09 12:09:42','2016-04-09 11:09:42',0,'Home banner w800',12082,800,233,0,1,800,0,'image/jpeg',0),(98,'perch_shop','default','home-banner-w80h80@1.6x.jpg','',1,'jpg','2016-04-09 12:09:42','2016-04-09 11:09:42',0,'Home banner w80h80@1.6x',2211,80,80,1,1.6,80,80,'image/jpeg',0),(99,'perch_shop','default','home-banner-w600h600@1.6x.jpg','',1,'jpg','2016-04-09 12:09:42','2016-04-09 11:09:42',0,'Home banner w600h600@1.6x',14803,600,175,1,1.6,600,600,'image/jpeg',0),(110,'perch_shop','default','nestanthem-w600h600@1.6x.jpg','',106,'jpg','2016-04-09 12:26:28','2016-04-09 11:26:28',0,'Nestanthem w600h600@1.6x',134406,600,600,1,1.6,600,600,'',0),(109,'perch_shop','default','nestanthem-w80h80@1.6x.jpg','',106,'jpg','2016-04-09 12:26:28','2016-04-09 11:26:28',0,'Nestanthem w80h80@1.6x',5875,80,80,1,1.6,80,80,'image/jpeg',0),(108,'perch_shop','default','nestanthem-w800.jpg','',106,'jpg','2016-04-09 12:26:28','2016-04-09 11:26:28',0,'Nestanthem w800',134406,600,600,0,1,800,0,'',0),(107,'assets','default','nestanthem-thumb@2x.jpg','thumb',106,'jpg','2016-04-09 12:26:23','2016-04-09 11:26:23',0,'Nestanthem',17350,150,150,0,2,150,150,'image/jpeg',0),(106,'assets','default','nestanthem.jpg','orig',0,'jpg','2016-04-09 12:26:23','2016-04-09 11:26:23',0,'Nestanthem',134406,600,600,0,1,NULL,NULL,'image/jpeg',0);
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
-- Table structure for table `perch2_scheduled_tasks`
--

DROP TABLE IF EXISTS `perch2_scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_scheduled_tasks` (
  `taskID` int(10) NOT NULL AUTO_INCREMENT,
  `taskStartTime` datetime NOT NULL,
  `taskEndTime` datetime DEFAULT NULL,
  `taskApp` varchar(64) NOT NULL DEFAULT '',
  `taskKey` varchar(64) DEFAULT NULL,
  `taskResult` enum('OK','WARNING','FAILED') NOT NULL DEFAULT 'FAILED',
  `taskMessage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`taskID`),
  KEY `idx_app` (`taskApp`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_scheduled_tasks`
--

LOCK TABLES `perch2_scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `perch2_scheduled_tasks` DISABLE KEYS */;
INSERT INTO `perch2_scheduled_tasks` VALUES (1,'2016-03-28 15:49:26','2016-03-28 15:49:26','perch_blog','delete_spam_comments','OK','Spam message deletion not configured.'),(2,'2016-03-28 15:49:26','2016-03-28 15:49:26','perch_events','update_category_counts','OK','Event category counts updated.');
/*!40000 ALTER TABLE `perch2_scheduled_tasks` ENABLE KEYS */;
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
INSERT INTO `perch2_settings` VALUES ('headerColour',0,'#53355b'),('content_singlePageEdit',0,'1'),('helpURL',0,''),('siteURL',0,'/'),('hideBranding',0,'0'),('content_collapseList',0,'1'),('lang',0,'en-gb'),('update_2.2.4',0,'done'),('latest_version',0,'2.8.15'),('perch_blog_post_url',0,'/blog/{postSlug}/'),('perch_blog_update',0,'5.0.1'),('update_2.2.6',0,'done'),('perch_gallery_update',0,'2.8.5'),('headerScheme',0,'dark'),('perch_blog_slug_format',0,'{postID}-{postTitle}'),('perch_blog_akismet_key',0,''),('perch_events_detail_url',0,'/events/event.php?event={eventSlug}'),('perch_gallery_bucket_mode',0,'single'),('perch_gallery_bucket',0,'gallery'),('dashboard',0,'1'),('content_hideNonEditableRegions',0,'0'),('perch_blog_comment_notify',0,'0'),('perch_gallery_basicUpload',0,'0'),('perch_members_login_page',0,'/members/?r={returnURL}'),('perch_shop_paypal_email',0,''),('perch_shop_product_url',0,'/shop/{productSlug}'),('perch_shop_display_oos',0,'0'),('update_2.2.9',0,'done'),('dashboard_order',1,'perch_blog,perch_gallery,content,perch_forms,perch_events'),('update_2.3.1',0,'done'),('perch_events_update',0,'1.8'),('on_sale_version',0,'2.8.29'),('update_2.4.4',0,'done'),('update_2.5.3',0,'done'),('update_2.6.4',0,'done'),('update_2.6.5',0,'done'),('update_2.7.10',0,'done'),('update_2.8',0,'done'),('update_2.8.2',0,'done'),('update_2.8.8',0,'done'),('update_2.8.15',0,'done'),('update_runway_2.8.27',0,'done'),('perch_shop_update',0,'g33'),('perch_members_update',0,'1.4'),('perch_blog_site_name',0,''),('perch_blog_max_spam_days',0,'0'),('perch_shop_price_tax_mode',0,'exc'),('perch_shop_trade_price_tax_mode',0,'exc'),('perch_shop_site_url',0,'https://'),('perch_shop_default_currency',0,'47'),('perch_shop_reporting_currency',0,'47'),('perch_shop_invoice_number_format',0,'Nest%d'),('hide_pwd_reset',0,'0'),('content_frontend_edit',0,'0'),('update_runway_2.8.28',0,'done'),('update_runway_2.8.29',0,'done');
/*!40000 ALTER TABLE `perch2_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_addresses`
--

DROP TABLE IF EXISTS `perch2_shop_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_addresses` (
  `addressID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addressTitle` char(128) DEFAULT 'Default',
  `addressSlug` char(128) DEFAULT 'default',
  `addressFirstName` char(128) NOT NULL DEFAULT '',
  `addressLastName` char(128) NOT NULL DEFAULT '',
  `addressCompany` char(128) NOT NULL DEFAULT '',
  `addressLine1` char(255) NOT NULL DEFAULT '',
  `addressDynamicFields` mediumtext,
  `addressCreated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `addressUpdated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `addressDeleted` datetime DEFAULT NULL,
  `customerID` int(10) unsigned NOT NULL DEFAULT '0',
  `countryID` int(10) NOT NULL,
  `regionID` int(10) DEFAULT NULL,
  `orderID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`addressID`),
  KEY `idx_customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_addresses`
--

LOCK TABLES `perch2_shop_addresses` WRITE;
/*!40000 ALTER TABLE `perch2_shop_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_shop_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_admin_index`
--

DROP TABLE IF EXISTS `perch2_shop_admin_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_admin_index` (
  `indexID` int(10) NOT NULL AUTO_INCREMENT,
  `itemKey` char(64) NOT NULL DEFAULT '-',
  `itemID` char(32) NOT NULL DEFAULT '0',
  `indexKey` char(64) NOT NULL DEFAULT '-',
  `indexValue` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`indexID`),
  KEY `idx_fk` (`itemKey`,`itemID`),
  KEY `idx_key` (`indexKey`),
  KEY `idx_key_val` (`indexKey`,`indexValue`),
  KEY `idx_keys` (`itemKey`,`indexKey`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_admin_index`
--

LOCK TABLES `perch2_shop_admin_index` WRITE;
/*!40000 ALTER TABLE `perch2_shop_admin_index` DISABLE KEYS */;
INSERT INTO `perch2_shop_admin_index` VALUES (149,'shippingID','1','title','Local collection'),(150,'shippingID','1','slug','local-collection'),(151,'shippingID','1','company','Quartermaster Dave'),(152,'shippingID','1','description','Pick your orders up from Quartermaster Dave on a club night.'),(153,'shippingID','1','tax_group','1'),(154,'shippingID','1','price_max',''),(155,'shippingID','1','price_max.gbp',''),(156,'shippingID','1','price_max.usd',''),(157,'shippingID','1','price_min','0.00'),(158,'shippingID','1','price_min.gbp','0.00'),(159,'shippingID','1','price_min.usd','0.00'),(160,'shippingID','1','weight_min',''),(161,'shippingID','1','weight_max',''),(162,'shippingID','1','width_max',''),(163,'shippingID','1','height_max',''),(164,'shippingID','1','depth_max',''),(165,'shippingID','1','status','1'),(166,'shippingID','1','shippingID','1'),(167,'shippingID','1','shippingTitle','Local collection'),(168,'shippingID','1','shippingSlug','local-collection'),(169,'shippingID','1','shippingCreated','2016-04-01 13:42:25'),(170,'shippingID','1','shippingUpdated','2016-04-07 14:42:56'),(171,'shippingID','1','shippingDeleted',''),(172,'shippingID','1','itemID',''),(173,'shippingID','1','itemRowID',''),(174,'shippingID','1','sort_price_0','2'),(175,'shippingID','1','sort_price_1','3'),(176,'shippingID','1','sort_price_2','1'),(177,'shippingID','1','_id','1'),(207,'shippingID','3','title','Courier'),(208,'shippingID','3','slug','courier'),(209,'shippingID','3','company','FedEx'),(210,'shippingID','3','description','48 hour delivery from FedEx'),(211,'shippingID','3','tax_group','1'),(212,'shippingID','3','price_max',''),(213,'shippingID','3','price_max.gbp',''),(214,'shippingID','3','price_max.usd',''),(215,'shippingID','3','price_min','10.00'),(216,'shippingID','3','price_min.gbp','10.00'),(217,'shippingID','3','price_min.usd','0.00'),(218,'shippingID','3','weight_min',''),(219,'shippingID','3','weight_max',''),(220,'shippingID','3','width_max',''),(221,'shippingID','3','height_max',''),(222,'shippingID','3','depth_max',''),(223,'shippingID','3','status','1'),(224,'shippingID','3','shippingID','3'),(225,'shippingID','3','shippingTitle','Courier'),(226,'shippingID','3','shippingSlug','courier'),(227,'shippingID','3','shippingCreated','2016-04-01 13:44:05'),(228,'shippingID','3','shippingUpdated','2016-04-07 14:46:34'),(229,'shippingID','3','shippingDeleted',''),(230,'shippingID','3','itemID',''),(231,'shippingID','3','itemRowID',''),(232,'shippingID','3','sort_price_0','2'),(233,'shippingID','3','sort_price_1','3'),(234,'shippingID','3','sort_price_2','1'),(235,'shippingID','3','_id','3'),(236,'shippingID','2','title','Standard shipping'),(237,'shippingID','2','slug','standard'),(238,'shippingID','2','company','Royal Mail'),(239,'shippingID','2','description','Standard shipping by Postman Pat.'),(240,'shippingID','2','tax_group','1'),(241,'shippingID','2','price_max',''),(242,'shippingID','2','price_max.gbp',''),(243,'shippingID','2','price_max.usd',''),(244,'shippingID','2','price_min','0.00'),(245,'shippingID','2','price_min.gbp','0.00'),(246,'shippingID','2','price_min.usd','0.00'),(247,'shippingID','2','weight_min',''),(248,'shippingID','2','weight_max',''),(249,'shippingID','2','width_max',''),(250,'shippingID','2','height_max',''),(251,'shippingID','2','depth_max',''),(252,'shippingID','2','status','1'),(253,'shippingID','2','shippingID','2'),(254,'shippingID','2','shippingTitle','Standard shipping'),(255,'shippingID','2','shippingSlug','standard'),(256,'shippingID','2','shippingCreated','2016-04-01 13:43:09'),(257,'shippingID','2','shippingUpdated','2016-04-07 14:47:14'),(258,'shippingID','2','shippingDeleted',''),(259,'shippingID','2','itemID',''),(260,'shippingID','2','itemRowID',''),(261,'shippingID','2','sort_price_0','2'),(262,'shippingID','2','sort_price_1','3'),(263,'shippingID','2','sort_price_2','1'),(264,'shippingID','2','_id','2');
/*!40000 ALTER TABLE `perch2_shop_admin_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_brands`
--

DROP TABLE IF EXISTS `perch2_shop_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_brands` (
  `brandID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brandTitle` varchar(255) NOT NULL DEFAULT '',
  `brandDynamicFields` mediumtext NOT NULL,
  `brandCreated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `brandUpdated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `brandDeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`brandID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_brands`
--

LOCK TABLES `perch2_shop_brands` WRITE;
/*!40000 ALTER TABLE `perch2_shop_brands` DISABLE KEYS */;
INSERT INTO `perch2_shop_brands` VALUES (1,'Nest Running','{\"title\":\"Nest Running\",\"slug\":\"nest-running\",\"description\":{\"_flang\":\"markdown\",\"raw\":\"Our own-branded running gear.\",\"processed\":\"<p>Our own-branded running gear.<\\/p>\"},\"image\":null,\"status\":\"1\"}','2016-04-01 13:50:33','2016-04-01 14:50:33',NULL);
/*!40000 ALTER TABLE `perch2_shop_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_cart`
--

DROP TABLE IF EXISTS `perch2_shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_cart` (
  `cartID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberID` int(10) unsigned DEFAULT NULL,
  `customerID` int(10) unsigned DEFAULT NULL,
  `currencyID` int(10) unsigned DEFAULT NULL,
  `locationID` int(10) unsigned NOT NULL,
  `shippingID` int(10) unsigned DEFAULT NULL,
  `cartPricing` enum('standard','sale','trade') DEFAULT 'standard',
  `cartTotalItems` int(10) unsigned NOT NULL DEFAULT '0',
  `cartTotalProducts` int(10) unsigned NOT NULL DEFAULT '0',
  `cartTotalWithTax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cartTotalWithoutTax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `billingAddress` char(128) DEFAULT NULL,
  `shippingAddress` char(128) DEFAULT NULL,
  `cartProperties` text,
  `cartDiscountCode` char(255) DEFAULT '',
  PRIMARY KEY (`cartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_cart`
--

LOCK TABLES `perch2_shop_cart` WRITE;
/*!40000 ALTER TABLE `perch2_shop_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_cart_data`
--

DROP TABLE IF EXISTS `perch2_shop_cart_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_cart_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cartID` char(32) NOT NULL DEFAULT '',
  `productID` char(32) DEFAULT NULL,
  `orderID` char(32) DEFAULT NULL,
  `cartData` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_cart_data`
--

LOCK TABLES `perch2_shop_cart_data` WRITE;
/*!40000 ALTER TABLE `perch2_shop_cart_data` DISABLE KEYS */;
INSERT INTO `perch2_shop_cart_data` VALUES (1,'2','42',NULL,'{\"product\":\"42\"}'),(2,'2','23',NULL,'{\"product\":\"23\"}');
/*!40000 ALTER TABLE `perch2_shop_cart_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_cart_items`
--

DROP TABLE IF EXISTS `perch2_shop_cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_cart_items` (
  `itemID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cartID` int(10) unsigned NOT NULL,
  `productID` int(10) unsigned NOT NULL,
  `itemQty` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`itemID`),
  KEY `idx_cart` (`cartID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_cart_items`
--

LOCK TABLES `perch2_shop_cart_items` WRITE;
/*!40000 ALTER TABLE `perch2_shop_cart_items` DISABLE KEYS */;
INSERT INTO `perch2_shop_cart_items` VALUES (1,2,42,1),(2,2,23,1);
/*!40000 ALTER TABLE `perch2_shop_cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_countries`
--

DROP TABLE IF EXISTS `perch2_shop_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_countries` (
  `countryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(255) NOT NULL DEFAULT '',
  `iso2` char(2) NOT NULL DEFAULT '',
  `iso3` char(3) NOT NULL DEFAULT '',
  `isonum` int(10) unsigned NOT NULL DEFAULT '0',
  `eu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `countryActive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`countryID`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_countries`
--

LOCK TABLES `perch2_shop_countries` WRITE;
/*!40000 ALTER TABLE `perch2_shop_countries` DISABLE KEYS */;
INSERT INTO `perch2_shop_countries` VALUES (1,'Afganistan','AF','AFG',4,0,1),(2,'Åland Islands','AX','ALA',248,0,1),(3,'Albania','AL','ALB',8,0,1),(4,'Algeria','DZ','DZA',12,0,1),(5,'American Samoa','AS','ASM',16,0,1),(6,'Andorra','AD','AND',20,0,1),(7,'Angola','AO','AGO',24,0,1),(8,'Anguilla','AI','AIA',660,0,1),(9,'Antigua & Barbuda','AG','ATG',28,0,1),(10,'Argentina','AR','ARG',32,0,1),(11,'Armenia','AM','ARM',51,0,1),(12,'Aruba','AW','ABW',533,0,1),(13,'Australia','AU','AUS',36,0,1),(14,'Austria','AT','AUT',40,1,1),(15,'Azerbaijan','AZ','AZE',31,0,1),(16,'Bahamas','BS','BHS',44,0,1),(17,'Bahrain','BH','BHR',48,0,1),(18,'Bangladesh','BD','BGD',50,0,1),(19,'Barbados','BB','BRB',52,0,1),(20,'Belarus','BY','BLR',112,0,1),(21,'Belgium','BE','BEL',56,1,1),(22,'Belize','BZ','BLZ',84,0,1),(23,'Benin','BJ','BEN',204,0,1),(24,'Bermuda','BM','BMU',60,0,1),(25,'Bhutan','BT','BTN',64,0,1),(26,'Bolivia','BO','BOL',68,0,1),(27,'Bonaire','BQ','BES',535,0,1),(28,'Bosnia-Herzegovina','BA','BIH',70,0,1),(29,'Botswana','BW','BWA',72,0,1),(30,'Brazil','BR','BRA',76,0,1),(31,'British Indian Ocean Territory','IO','IOT',86,0,1),(32,'British Virgin Islands','VG','VGB',92,0,1),(33,'Brunei Darussalam','BN','BRN',96,0,1),(34,'Bulgaria','BG','BGR',100,1,1),(35,'Burkina Faso','BF','BFA',854,0,1),(36,'Burundi','BI','BDI',108,0,1),(37,'Cambodia','KH','KHM',116,0,1),(38,'Cameroon','CM','CMR',120,0,1),(39,'Canada','CA','CAN',124,0,1),(40,'Cape Verde Islands','CV','CPV',132,0,1),(41,'Cayman Islands','KY','CYM',136,0,1),(42,'Central African Republic','CF','CAF',140,0,1),(43,'Chad','TD','TCD',148,0,1),(44,'Chile','CL','CHL',152,0,1),(45,'China','CN','CHN',156,0,1),(46,'Christmas Island','CX','CXR',162,0,1),(47,'Cocos (Keeling) Islands','CC','CCK',166,0,1),(48,'Colombia','CO','COL',170,0,1),(49,'Comoros','KM','COM',174,0,1),(50,'Congo (Brazzaville)','CG','COG',178,0,1),(51,'Congo (Kinshasa)','CD','ZAR',180,0,1),(52,'Cook Islands','CK','COK',184,0,1),(53,'Costa Rica','CR','CRI',188,0,1),(54,'Croatia','HR','HRV',191,1,1),(55,'Cuba','CU','CUB',192,0,1),(56,'Curaçao','CW','CUW',531,0,1),(57,'Cyprus','CY','CYP',196,1,1),(58,'Czech Republic','CZ','CZE',203,1,1),(59,'Denmark','DK','DNK',208,1,1),(60,'Djibouti','DJ','DJI',262,0,1),(61,'Dominica','DM','DMA',212,0,1),(62,'Dominican Republic','DO','DOM',214,0,1),(63,'East Timor','TL','TLS',626,0,1),(64,'Ecuador','EC','ECU',218,0,1),(65,'Egypt','EG','EGY',818,0,1),(66,'El Salvador','SV','SLV',222,0,1),(67,'Equatorial Guinea','GQ','GNQ',226,0,1),(68,'Eritrea','ER','ERI',232,0,1),(69,'Estonia','EE','EST',233,1,1),(70,'Ethiopia','ET','ETH',231,0,1),(71,'Faeroe Islands','FO','FRO',234,0,1),(72,'Falkland Islands','FK','FLK',238,0,1),(73,'Fiji','FJ','FJI',242,0,1),(74,'Finland','FI','FIN',246,1,1),(75,'France','FR','FRA',250,1,1),(76,'French Guiana','GF','GUF',254,0,1),(77,'French Polynesia','PF','PYF',258,0,1),(78,'French Southern Territories','TF','ATF',260,0,1),(79,'Gabon','GA','GAB',266,0,1),(80,'Gambia','GM','GMB',270,0,1),(81,'Georgia','GE','GEO',268,0,1),(82,'Germany','DE','DEU',276,1,1),(83,'Ghana','GH','GHA',288,0,1),(84,'Gibralter','GI','GIB',292,0,1),(85,'Greece','GR','GRC',300,1,1),(86,'Greenland','GL','GRL',304,0,1),(87,'Grenada','GD','GRD',308,0,1),(88,'Guadeloupe','GP','GLP',312,0,1),(89,'Guam','GU','GUM',316,0,1),(90,'Guatemala','GT','GTM',320,0,1),(91,'Guernsey','GG','GGY',831,0,1),(92,'Guinea','GN','GIN',324,0,1),(93,'Guinea-Bissau','GW','GNB',624,0,1),(94,'Guyana','GY','GUY',328,0,1),(95,'Haiti','HT','HTI',332,0,1),(96,'Holy See','VA','VAT',336,0,1),(97,'Honduras','HN','HND',340,0,1),(98,'Hong Kong','HK','HKG',344,0,1),(99,'Hungary','HU','HUN',348,1,1),(100,'Iceland','IS','ISL',352,0,1),(101,'India','IN','IND',356,0,1),(102,'Indonesia','ID','IDN',360,0,1),(103,'Iran','IR','IRN',364,0,1),(104,'Iraq','IQ','IRQ',368,0,1),(105,'Ireland','IE','IRL',372,1,1),(106,'Isle of Man','IM','IMN',833,0,1),(107,'Israel','IL','ISR',376,0,1),(108,'Italy','IT','ITA',380,1,1),(109,'Ivory Coast','CI','CIV',384,0,1),(110,'Jamaica','JM','JAM',388,0,1),(111,'Japan','JP','JPN',392,0,1),(112,'Jersey','JE','JEY',832,0,1),(113,'Jordan','JO','JOR',400,0,1),(114,'Kazakhstan','KZ','KAZ',398,0,1),(115,'Kenya','KE','KEN',404,0,1),(116,'Kiribati','KI','KIR',296,0,1),(117,'Kuwait','KW','KWT',414,0,1),(118,'Kyrgyzstan','KG','KGZ',417,0,1),(119,'Laos','LA','LAO',418,0,1),(120,'Latvia','LV','LVA',428,1,1),(121,'Lebanon','LB','LBN',422,0,1),(122,'Lesotho','LS','LSO',426,0,1),(123,'Liberia','LR','LBR',430,0,1),(124,'Libya','LY','LBY',434,0,1),(125,'Liechtenstein','LI','LIE',438,0,1),(126,'Lithuania','LT','LTU',440,1,1),(127,'Luxembourg','LU','LUX',442,1,1),(128,'Macau','MO','MAC',446,0,1),(129,'Macedonia','MK','MKD',807,0,1),(130,'Madagascar','MG','MDG',450,0,1),(131,'Malawi','MW','MWI',454,0,1),(132,'Malaysia','MY','MYS',458,0,1),(133,'Maldives','MV','MDV',462,0,1),(134,'Mali','ML','MLI',466,0,1),(135,'Malta','MT','MLT',470,1,1),(136,'Marshall Islands','MH','MHL',584,0,1),(137,'Martinique','MQ','MTQ',474,0,1),(138,'Mauritania','MR','MRT',478,0,1),(139,'Mauritius','MU','MUS',480,0,1),(140,'Mayotte','YT','MYT',175,0,1),(141,'Mexico','MX','MEX',484,0,1),(142,'Micronesia','FM','FSM',583,0,1),(143,'Moldova','MD','MDA',498,0,1),(144,'Monaco','MC','MCO',492,0,1),(145,'Mongolia','MN','MNG',496,0,1),(146,'Montenegro','ME','MNE',499,0,1),(147,'Montserrat','MS','MSR',500,0,1),(148,'Morocco','MA','MAR',504,0,1),(149,'Mozambique','MZ','MOZ',508,0,1),(150,'Myanmar','MM','MMR',104,0,1),(151,'Namibia','NA','NAM',516,0,1),(152,'Nauru','NR','NRU',520,0,1),(153,'Nepal','NP','NPL',524,0,1),(154,'Netherlands Antilles','AN','ANT',530,0,1),(155,'Netherlands','NL','NLD',528,1,1),(156,'New Caledonia','NC','NCL',540,0,1),(157,'New Zealand','NZ','NZL',554,0,1),(158,'Nicaragua','NI','NIC',558,0,1),(159,'Niger','NE','NER',562,0,1),(160,'Nigeria','NG','NGA',566,0,1),(161,'Niue','NU','NIU',570,0,1),(162,'Norfolk Island','NF','NFK',574,0,1),(163,'North Korea','KP','PRK',408,0,1),(164,'Northern Mariana Islands','MP','MNP',580,0,1),(165,'Norway','NO','NOR',578,0,1),(166,'Oman','OM','OMN',512,0,1),(167,'Pakistan','PK','PAK',586,0,1),(168,'Palau','PW','PLW',585,0,1),(169,'Palestinian Territories','PS','PSE',275,0,1),(170,'Panama','PA','PAN',591,0,1),(171,'Papua New Guinea','PG','PNG',598,0,1),(172,'Paraguay','PY','PRY',600,0,1),(173,'Peru','PE','PER',604,0,1),(174,'Philippines','PH','PHL',608,0,1),(175,'Pitcairn Islands','PN','PCN',612,0,1),(176,'Poland','PL','POL',616,1,1),(177,'Portugal','PT','PRT',620,1,1),(178,'Puerto Rico','PR','PRI',630,0,1),(179,'Qatar','QA','QAT',634,0,1),(180,'Romania','RO','ROU',642,1,1),(181,'Russia','RU','RUS',643,0,1),(182,'Rwanda','RW','RWA',646,0,1),(183,'Réunion','RE','REU',638,0,1),(184,'Saba','BQ','BES',535,0,1),(185,'Saint Barthélemy','BL','BLM',652,0,1),(186,'Saint Christopher & Nevis','KN','KNA',659,0,1),(187,'Saint Helena','SH','SHN',654,0,1),(188,'Saint Lucia','LC','LCA',662,0,1),(189,'Saint Martin','MF','MAF',663,0,1),(190,'Saint Pierre & Miquelon','PM','SPM',666,0,1),(191,'Saint Vincent & The Grenadines','VC','VCT',670,0,1),(192,'Samoa','WS','WSM',882,0,1),(193,'San Marino','SM','SMR',674,0,1),(194,'Sao Tome & Principe','ST','STP',678,0,1),(195,'Saudi Arabia','SA','SAU',682,0,1),(196,'Senegal','SN','SEN',686,0,1),(197,'Serbia','RS','SRB',688,0,1),(198,'Seychelles','SC','SYC',690,0,1),(199,'Sierra Leone','SL','SLE',694,0,1),(200,'Singapore','SG','SGP',702,0,1),(201,'Sint Eustatius','BQ','BES',535,0,1),(202,'Sint Maarten','SX','SXM',534,0,1),(203,'Slovakia','SK','SVK',703,1,1),(204,'Slovenia','SI','SVN',705,1,1),(205,'Solomon Islands','SB','SLB',90,0,1),(206,'Somalia','SO','SOM',706,0,1),(207,'Somaliland','SO','SOM',706,0,1),(208,'South Africa','ZA','ZAF',710,0,1),(209,'South Georgia & The South Sandwish Islands','GS','SGS',239,0,1),(210,'South Korea','KR','KOR',418,0,1),(211,'South Sudan','SS','SSD',0,0,1),(212,'Spain','ES','ESP',724,1,1),(213,'Sri Lanka','LK','LKA',144,0,1),(214,'Sudan','SD','SDN',736,0,1),(215,'Suriname','SR','SUR',740,0,1),(216,'Swaziland','SZ','SWZ',748,0,1),(217,'Sweden','SE','SWE',752,1,1),(218,'Switzerland','CH','CHE',756,0,1),(219,'Syria','SY','SYR',760,0,1),(220,'Taiwan','TW','TWN',158,0,1),(221,'Tajikistan','TJ','TJK',762,0,1),(222,'Tanzania','TZ','TZA',834,0,1),(223,'Thailand','TH','THA',764,0,1),(224,'Togo','TG','TGO',768,0,1),(225,'Tokelau','TK','TKL',772,0,1),(226,'Tonga','TO','TON',776,0,1),(227,'Trinidad & Tobago','TT','TTO',780,0,1),(228,'Tunisia','TN','TUN',788,0,1),(229,'Turkey','TR','TUR',792,0,1),(230,'Turkmenistan','TM','TKM',795,0,1),(231,'Turks & Caicos Islands','TC','TCA',796,0,1),(232,'Tuvalu','TV','TUV',798,0,1),(233,'Uganda','UG','UGA',800,0,1),(234,'Ukraine','UA','UKR',804,0,1),(235,'United Arab Emirates','AE','ARE',784,0,1),(236,'United Kingdom','GB','GBR',826,1,1),(237,'United States','US','USA',840,0,1),(238,'United States Virgin Islands','VI','VIR',850,0,1),(239,'Uruguay','UY','URY',858,0,1),(240,'Uzbekistan','UZ','UZB',860,0,1),(241,'Vanuatu','VU','VUT',548,0,1),(242,'Venezuela','VE','VEN',862,0,1),(243,'Vietnam','VN','VNM',704,0,1),(244,'Wallis & Futuna','WF','WLF',876,0,1),(245,'Western Sahara','EH','ESH',732,0,1),(246,'Yemen','YE','YEM',887,0,1),(247,'Zambia','ZM','ZMB',894,0,1),(248,'Zimbabwe','ZW','ZWE',716,0,1);
/*!40000 ALTER TABLE `perch2_shop_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_currencies`
--

DROP TABLE IF EXISTS `perch2_shop_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_currencies` (
  `currencyID` int(10) NOT NULL AUTO_INCREMENT,
  `currencyCode` char(3) NOT NULL DEFAULT '',
  `currencyNumber` int(10) unsigned DEFAULT NULL,
  `currencyTitle` char(64) NOT NULL DEFAULT '',
  `currencySymbol` char(16) NOT NULL DEFAULT '',
  `currencySymbolPosition` enum('before','after') NOT NULL DEFAULT 'before',
  `currencyDecimals` int(10) unsigned NOT NULL DEFAULT '2',
  `currencyRate` decimal(65,4) unsigned NOT NULL DEFAULT '1.0000',
  `currencyActive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `currencyIsCommon` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `currencyDynamicFields` text,
  PRIMARY KEY (`currencyID`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_currencies`
--

LOCK TABLES `perch2_shop_currencies` WRITE;
/*!40000 ALTER TABLE `perch2_shop_currencies` DISABLE KEYS */;
INSERT INTO `perch2_shop_currencies` VALUES (1,'AED',784,'United Arab Emirates dirham','د.إ','before',2,1.0000,0,0,NULL),(2,'AFN',971,'Afghan afghani','؋','before',2,1.0000,0,0,NULL),(3,'ALL',8,'Albanian lek','Lek','before',2,1.0000,0,0,NULL),(4,'AMD',51,'Armenian dram','¤','before',2,1.0000,0,0,NULL),(5,'ANG',532,'Netherlands Antillean guilder','ƒ','before',2,1.0000,0,0,NULL),(6,'AOA',973,'Angolan kwanza','Kz','before',2,1.0000,0,0,NULL),(7,'ARS',32,'Argentine peso','$','before',2,1.0000,0,0,NULL),(8,'AUD',36,'Australian dollar','$','before',2,1.0000,0,1,NULL),(9,'AWG',533,'Aruban florin','ƒ','before',2,1.0000,0,0,NULL),(10,'AZN',944,'Azerbaijani manat','ман','before',2,1.0000,0,0,NULL),(11,'BAM',977,'Bosnia and Herzegovina convertible mark','KM','before',2,1.0000,0,0,NULL),(12,'BBD',52,'Barbados dollar','$','before',2,1.0000,0,0,NULL),(13,'BDT',50,'Bangladeshi taka','৳','before',2,1.0000,0,0,NULL),(14,'BGN',975,'Bulgarian lev','лв','before',2,1.0000,0,0,NULL),(15,'BHD',48,'Bahraini dinar','BD','before',3,1.0000,0,0,NULL),(16,'BIF',108,'Burundian franc','FBu','before',0,1.0000,0,0,NULL),(17,'BMD',60,'Bermudian dollar','$','before',2,1.0000,0,0,NULL),(18,'BND',96,'Brunei dollar','$','before',2,1.0000,0,0,NULL),(19,'BOB',68,'Boliviano','$b','before',2,1.0000,0,0,NULL),(20,'BRL',986,'Brazilian real','R$','before',2,1.0000,0,0,NULL),(21,'BSD',44,'Bahamian dollar','$','before',2,1.0000,0,0,NULL),(22,'BTN',64,'Bhutanese ngultrum','Nu.','before',2,1.0000,0,0,NULL),(23,'BWP',72,'Botswana pula','P','before',2,1.0000,0,0,NULL),(24,'BYR',974,'Belarusian ruble','p.','before',0,1.0000,0,0,NULL),(25,'BZD',84,'Belize dollar','BZ$','before',2,1.0000,0,0,NULL),(26,'CAD',124,'Canadian dollar','$','before',2,1.0000,0,1,NULL),(27,'CDF',976,'Congolese franc','FC','before',2,1.0000,0,0,NULL),(28,'CHF',756,'Swiss franc','CHF','before',2,1.0000,0,1,NULL),(29,'CLP',152,'Chilean peso','$','before',0,1.0000,0,0,NULL),(30,'CNY',156,'Chinese yuan','¥','before',2,1.0000,0,0,NULL),(31,'COP',170,'Colombian peso','$','before',2,1.0000,0,0,NULL),(32,'CRC',188,'Costa Rican colon','₡','before',2,1.0000,0,0,NULL),(33,'CUC',931,'Cuban convertible peso','CUC$','before',2,1.0000,0,0,NULL),(34,'CUP',192,'Cuban peso','₱','before',2,1.0000,0,0,NULL),(35,'CVE',132,'Cape Verde escudo','$','before',0,1.0000,0,0,NULL),(36,'CZK',203,'Czech koruna','Kč','before',2,1.0000,0,0,NULL),(37,'DJF',262,'Djiboutian franc','Fdj','before',0,1.0000,0,0,NULL),(38,'DKK',208,'Danish krone','kr','before',2,1.0000,0,1,NULL),(39,'DOP',214,'Dominican peso','RD$','before',2,1.0000,0,0,NULL),(40,'DZD',12,'Algerian dinar','د.ج','before',2,1.0000,0,0,NULL),(41,'EGP',818,'Egyptian pound','£','before',2,1.0000,0,0,NULL),(42,'ERN',232,'Eritrean nakfa','Nfk','before',2,1.0000,0,0,NULL),(43,'ETB',230,'Ethiopian birr','Br','before',2,1.0000,0,0,NULL),(44,'EUR',978,'Euro','€','before',2,1.0000,0,1,'[]'),(45,'FJD',242,'Fiji dollar','$','before',2,1.0000,0,0,NULL),(46,'FKP',238,'Falkland Islands pound','£','before',2,1.0000,0,0,NULL),(47,'GBP',826,'Pound sterling','£','before',2,1.0000,1,1,NULL),(48,'GEL',981,'Georgian lari','GEL','before',2,1.0000,0,0,NULL),(49,'GHS',936,'Ghanaian cedi','GH₵','before',2,1.0000,0,0,NULL),(50,'GIP',292,'Gibraltar pound','£','before',2,1.0000,0,0,NULL),(51,'GMD',270,'Gambian dalasi','D','before',2,1.0000,0,0,NULL),(52,'GNF',324,'Guinean franc','FG','before',0,1.0000,0,0,NULL),(53,'GTQ',320,'Guatemalan quetzal','Q','before',2,1.0000,0,0,NULL),(54,'GYD',328,'Guyanese dollar','$','before',2,1.0000,0,0,NULL),(55,'HKD',344,'Hong Kong dollar','$','before',2,1.0000,0,0,NULL),(56,'HNL',340,'Honduran lempira','L','before',2,1.0000,0,0,NULL),(57,'HRK',191,'Croatian kuna','kn','before',2,1.0000,0,0,NULL),(58,'HTG',332,'Haitian gourde','G','before',2,1.0000,0,0,NULL),(59,'HUF',348,'Hungarian forint','Ft','before',2,1.0000,0,0,NULL),(60,'IDR',360,'Indonesian rupiah','Rp','before',2,1.0000,0,0,NULL),(61,'ILS',376,'Israeli new shekel','₪','before',2,1.0000,0,0,NULL),(62,'INR',356,'Indian rupee','₹','before',2,1.0000,0,0,NULL),(63,'IQD',368,'Iraqi dinar','ع.د','before',3,1.0000,0,0,NULL),(64,'IRR',364,'Iranian rial','﷼','before',2,1.0000,0,0,NULL),(65,'ISK',352,'Icelandic króna','kr','before',0,1.0000,0,0,NULL),(66,'JMD',388,'Jamaican dollar','J$','before',2,1.0000,0,0,NULL),(67,'JOD',400,'Jordanian dinar','JD','before',3,1.0000,0,0,NULL),(68,'JPY',392,'Japanese yen','¥','before',0,1.0000,0,0,NULL),(69,'KES',404,'Kenyan shilling','KSh','before',2,1.0000,0,0,NULL),(70,'KGS',417,'Kyrgyzstani som','лв','before',2,1.0000,0,0,NULL),(71,'KHR',116,'Cambodian riel','៛','before',2,1.0000,0,0,NULL),(72,'KMF',174,'Comoro franc','CF','before',0,1.0000,0,0,NULL),(73,'KPW',408,'North Korean won','₩','before',2,1.0000,0,0,NULL),(74,'KRW',410,'South Korean won','₩','before',0,1.0000,0,0,NULL),(75,'KWD',414,'Kuwaiti dinar','K.D.','before',3,1.0000,0,0,NULL),(76,'KYD',136,'Cayman Islands dollar','$','before',2,1.0000,0,0,NULL),(77,'KZT',398,'Kazakhstani tenge','лв','before',2,1.0000,0,0,NULL),(78,'LAK',418,'Lao kip','₭','before',2,1.0000,0,0,NULL),(79,'LBP',422,'Lebanese pound','£','before',2,1.0000,0,0,NULL),(80,'LKR',144,'Sri Lankan rupee','₨','before',2,1.0000,0,0,NULL),(81,'LRD',430,'Liberian dollar','$','before',2,1.0000,0,0,NULL),(82,'LSL',426,'Lesotho loti','L','before',2,1.0000,0,0,NULL),(83,'LYD',434,'Libyan dinar','LD','before',3,1.0000,0,0,NULL),(84,'MAD',504,'Moroccan dirham','د.م.','before',2,1.0000,0,0,NULL),(85,'MDL',498,'Moldovan leu','lei','before',2,1.0000,0,0,NULL),(86,'MGA',969,'Malagasy ariary','Ar','before',1,1.0000,0,0,NULL),(87,'MKD',807,'Macedonian denar','ден','before',2,1.0000,0,0,NULL),(88,'MMK',104,'Myanmar kyat','K','before',2,1.0000,0,0,NULL),(89,'MNT',496,'Mongolian tugrik','₮','before',2,1.0000,0,0,NULL),(90,'MOP',446,'Macanese pataca','MOP$','before',2,1.0000,0,0,NULL),(91,'MRO',478,'Mauritanian ouguiya','UM','before',1,1.0000,0,0,NULL),(92,'MUR',480,'Mauritian rupee','₨','before',2,1.0000,0,0,NULL),(93,'MVR',462,'Maldivian rufiyaa','Rf','before',2,1.0000,0,0,NULL),(94,'MWK',454,'Malawian kwacha','MK','before',2,1.0000,0,0,NULL),(95,'MXN',484,'Mexican peso','$','before',2,1.0000,0,0,NULL),(96,'MYR',458,'Malaysian ringgit','RM','before',2,1.0000,0,0,NULL),(97,'MZN',943,'Mozambican metical','MT','before',2,1.0000,0,0,NULL),(98,'NAD',516,'Namibian dollar','$','before',2,1.0000,0,0,NULL),(99,'NGN',566,'Nigerian naira','₦','before',2,1.0000,0,0,NULL),(100,'NIO',558,'Nicaraguan córdoba','C$','before',2,1.0000,0,0,NULL),(101,'NOK',578,'Norwegian krone','kr','before',2,1.0000,0,1,NULL),(102,'NPR',524,'Nepalese rupee','₨','before',2,1.0000,0,0,NULL),(103,'NZD',554,'New Zealand dollar','$','before',2,1.0000,0,1,NULL),(104,'OMR',512,'Omani rial','﷼','before',3,1.0000,0,0,NULL),(105,'PAB',590,'Panamanian balboa','B/.','before',2,1.0000,0,0,NULL),(106,'PEN',604,'Peruvian nuevo sol','S/.','before',2,1.0000,0,0,NULL),(107,'PGK',598,'Papua New Guinean kina','K','before',2,1.0000,0,0,NULL),(108,'PHP',608,'Philippine peso','₱','before',2,1.0000,0,0,NULL),(109,'PKR',586,'Pakistani rupee','₨','before',2,1.0000,0,0,NULL),(110,'PLN',985,'Polish złoty','zł','before',2,1.0000,0,0,NULL),(111,'PYG',600,'Paraguayan guaraní','Gs','before',0,1.0000,0,0,NULL),(112,'QAR',634,'Qatari riyal','﷼','before',2,1.0000,0,0,NULL),(113,'RON',946,'Romanian leu','lei','before',2,1.0000,0,0,NULL),(114,'RSD',941,'Serbian dinar','Дин.','before',2,1.0000,0,0,NULL),(115,'RUB',643,'Russian ruble','руб','before',2,1.0000,0,0,NULL),(116,'RWF',646,'Rwandan franc','FRw','before',0,1.0000,0,0,NULL),(117,'SAR',682,'Saudi riyal','﷼','before',2,1.0000,0,0,NULL),(118,'SBD',90,'Solomon Islands dollar','$','before',2,1.0000,0,0,NULL),(119,'SCR',690,'Seychelles rupee','₨','before',2,1.0000,0,0,NULL),(120,'SDG',938,'Sudanese pound','ج.س.','before',2,1.0000,0,0,NULL),(121,'SEK',752,'Swedish krona/kronor','kr','before',2,1.0000,0,1,NULL),(122,'SGD',702,'Singapore dollar','$','before',2,1.0000,0,0,NULL),(123,'SHP',654,'Saint Helena pound','£','before',2,1.0000,0,0,NULL),(124,'SLL',694,'Sierra Leonean leone','Le','before',2,1.0000,0,0,NULL),(125,'SOS',706,'Somali shilling','S','before',2,1.0000,0,0,NULL),(126,'SRD',968,'Surinamese dollar','$','before',2,1.0000,0,0,NULL),(127,'SSP',728,'South Sudanese pound','SSP','before',2,1.0000,0,0,NULL),(128,'STD',678,'São Tomé and Príncipe dobra','Db','before',2,1.0000,0,0,NULL),(129,'SYP',760,'Syrian pound','£','before',2,1.0000,0,0,NULL),(130,'SZL',748,'Swazi lilangeni','E','before',2,1.0000,0,0,NULL),(131,'THB',764,'Thai baht','฿','before',2,1.0000,0,0,NULL),(132,'TJS',972,'Tajikistani somoni','TJS','before',2,1.0000,0,0,NULL),(133,'TMT',934,'Turkmenistani manat','T','before',2,1.0000,0,0,NULL),(134,'TND',788,'Tunisian dinar','DT','before',3,1.0000,0,0,NULL),(135,'TOP',776,'Tongan paʻanga','T$','before',2,1.0000,0,0,NULL),(136,'TRY',949,'Turkish lira','₺','before',2,1.0000,0,0,NULL),(137,'TTD',780,'Trinidad and Tobago dollar','TT$','before',2,1.0000,0,0,NULL),(138,'TWD',901,'New Taiwan dollar','NT$','before',2,1.0000,0,0,NULL),(139,'TZS',834,'Tanzanian shilling','TSh','before',2,1.0000,0,0,NULL),(140,'UAH',980,'Ukrainian hryvnia','₴','before',2,1.0000,0,0,NULL),(141,'UGX',800,'Ugandan shilling','USh','before',0,1.0000,0,0,NULL),(142,'USD',840,'United States dollar','$','before',2,1.0000,1,1,'[]'),(143,'UYU',858,'Uruguayan peso','$U','before',2,1.0000,0,0,NULL),(144,'UZS',860,'Uzbekistan som','лв','before',2,1.0000,0,0,NULL),(145,'VEF',937,'Venezuelan bolívar','Bs','before',2,1.0000,0,0,NULL),(146,'VND',704,'Vietnamese dong','₫','before',0,1.0000,0,0,NULL),(147,'VUV',548,'Vanuatu vatu','VT','before',0,1.0000,0,0,NULL),(148,'WST',882,'Samoan tala','WS$','before',2,1.0000,0,0,NULL),(149,'YER',886,'Yemeni rial','﷼','before',2,1.0000,0,0,NULL),(150,'ZAR',710,'South African rand','R','before',2,1.0000,0,0,NULL),(151,'ZMW',967,'Zambian kwacha','ZMW','before',2,1.0000,0,0,NULL),(152,'XBT',NULL,'Bitcoin','Ƀ','before',2,1.0000,0,0,'[]');
/*!40000 ALTER TABLE `perch2_shop_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_customers`
--

DROP TABLE IF EXISTS `perch2_shop_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_customers` (
  `customerID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customerFirstName` char(128) NOT NULL DEFAULT '',
  `customerLastName` char(128) NOT NULL DEFAULT '',
  `customerEmail` char(128) NOT NULL DEFAULT '',
  `customerDynamicFields` mediumtext,
  `customerCreated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `customerUpdated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `customerDeleted` datetime DEFAULT NULL,
  `memberID` int(10) unsigned NOT NULL DEFAULT '0',
  `customerTaxID` char(255) DEFAULT NULL,
  `customerTaxIDType` char(32) DEFAULT NULL,
  `customerTaxIDStatus` enum('valid','invalid','unchecked') NOT NULL DEFAULT 'unchecked',
  `customerTaxIDLastChecked` datetime DEFAULT NULL,
  `customerTaxIDLastResponse` char(255) DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  KEY `idx_member` (`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_customers`
--

LOCK TABLES `perch2_shop_customers` WRITE;
/*!40000 ALTER TABLE `perch2_shop_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_shop_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_emails`
--

DROP TABLE IF EXISTS `perch2_shop_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_emails` (
  `emailID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `emailTitle` varchar(255) NOT NULL,
  `emailSlug` varchar(255) NOT NULL,
  `emailFor` enum('customer','customer_bcc','admin') NOT NULL DEFAULT 'customer',
  `emailRecipient` varchar(255) DEFAULT NULL,
  `emailStatus` varchar(255) NOT NULL DEFAULT '',
  `emailTemplate` varchar(255) NOT NULL DEFAULT 'order_paid.html',
  `emailActive` varchar(255) NOT NULL,
  `emailDynamicFields` mediumtext NOT NULL,
  `emailCreated` datetime NOT NULL,
  `emailUpdated` datetime NOT NULL,
  PRIMARY KEY (`emailID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_emails`
--

LOCK TABLES `perch2_shop_emails` WRITE;
/*!40000 ALTER TABLE `perch2_shop_emails` DISABLE KEYS */;
INSERT INTO `perch2_shop_emails` VALUES (1,'Order paid','order_paid','customer',NULL,'1','order_paid.html','1','{\"name\":\"Order paid\",\"subject\":\"Thank you for your order\",\"sender_name\":\"Nest Running Club\",\"sender_email\":\"nest@perchdemo.com\",\"enabled\":\"1\",\"logo\":null,\"intro\":{\"_flang\":\"markdown\",\"raw\":\"Thank you for placing your order!\",\"processed\":\"<p>Thank you for placing your order!<\\/p>\"},\"signoff\":{\"_flang\":\"markdown\",\"raw\":\"We appreciate your business.\",\"processed\":\"<p>We appreciate your business.<\\/p>\"}}','0000-00-00 00:00:00','2016-04-08 10:05:16');
/*!40000 ALTER TABLE `perch2_shop_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_index`
--

DROP TABLE IF EXISTS `perch2_shop_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_index` (
  `indexID` int(10) NOT NULL AUTO_INCREMENT,
  `itemKey` char(64) NOT NULL DEFAULT '-',
  `itemID` char(32) NOT NULL DEFAULT '0',
  `indexKey` char(64) NOT NULL DEFAULT '-',
  `indexValue` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`indexID`),
  KEY `idx_fk` (`itemKey`,`itemID`),
  KEY `idx_key` (`indexKey`),
  KEY `idx_key_val` (`indexKey`,`indexValue`),
  KEY `idx_keys` (`itemKey`,`indexKey`)
) ENGINE=InnoDB AUTO_INCREMENT=1501 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_index`
--

LOCK TABLES `perch2_shop_index` WRITE;
/*!40000 ALTER TABLE `perch2_shop_index` DISABLE KEYS */;
INSERT INTO `perch2_shop_index` VALUES (1,'brandID','1','title','Nest Running'),(2,'brandID','1','slug','nest-running'),(3,'brandID','1','description','Our own-branded running gear.'),(4,'brandID','1','image',''),(5,'brandID','1','status','1'),(6,'brandID','1','brandID','1'),(7,'brandID','1','brandTitle','Nest Running'),(8,'brandID','1','brandCreated','2016-04-01 13:50:33'),(9,'brandID','1','brandUpdated','2016-04-01 14:50:33'),(10,'brandID','1','brandDeleted',''),(11,'brandID','1','_id','1'),(57,'optionID','1','title','Size'),(58,'optionID','1','precendence','2'),(59,'optionID','1','optionID','1'),(60,'optionID','1','optionTitle','Size'),(61,'optionID','1','optionPrecendence','2'),(62,'optionID','1','optionCreated','2016-04-01 14:48:03'),(63,'optionID','1','optionUpdated','2016-04-01 15:53:13'),(64,'optionID','1','optionDeleted',''),(65,'optionID','1','itemID',''),(66,'optionID','1','itemRowID',''),(67,'optionID','1','options.title','Extra Small'),(68,'optionID','1','options.title','Small'),(69,'optionID','1','options.title','Medium'),(70,'optionID','1','options.title','Large'),(71,'optionID','1','options.title','Extra Large'),(72,'optionID','1','options.skucode','XS'),(73,'optionID','1','options.skucode','S'),(74,'optionID','1','options.skucode','M'),(75,'optionID','1','options.skucode','L'),(76,'optionID','1','options.skucode','XL'),(77,'optionID','1','options.id','1'),(78,'optionID','1','options.id','2'),(79,'optionID','1','options.id','3'),(80,'optionID','1','options.id','4'),(81,'optionID','1','options.id','5'),(82,'optionID','1','_id','1'),(121,'optionID','2','title','Vest style'),(122,'optionID','2','precendence','1'),(123,'optionID','2','optionID','2'),(124,'optionID','2','optionTitle','Vest style'),(125,'optionID','2','optionPrecendence','1'),(126,'optionID','2','optionCreated','2016-04-01 14:53:09'),(127,'optionID','2','optionUpdated','2016-04-01 15:55:57'),(128,'optionID','2','optionDeleted',''),(129,'optionID','2','itemID',''),(130,'optionID','2','itemRowID',''),(131,'optionID','2','options.title','Men\'s t-shirt'),(132,'optionID','2','options.title','Men\'s vest'),(133,'optionID','2','options.title','Women\'s t-shirt'),(134,'optionID','2','options.title','Women\'s vest'),(135,'optionID','2','options.skucode','MT'),(136,'optionID','2','options.skucode','MV'),(137,'optionID','2','options.skucode','WT'),(138,'optionID','2','options.skucode','WV'),(139,'optionID','2','options.id','6'),(140,'optionID','2','options.id','7'),(141,'optionID','2','options.id','8'),(142,'optionID','2','options.id','9'),(143,'optionID','2','_id','2'),(228,'productID','2','description','<p>Our exclusive club vest for wearing to races, or to the races.</p>'),(229,'productID','2','description__flang','markdown'),(230,'productID','2','description_raw','Our exclusive club vest for wearing to races, or to the races.'),(231,'productID','2','description_processed','<p>Our exclusive club vest for wearing to races, or to the races.</p>'),(232,'productID','2','image',''),(233,'productID','2','slug','club-running-vest1'),(234,'productID','2','status','1'),(235,'productID','2','brand','1'),(236,'productID','2','category_0','5'),(237,'productID','2','catalog_only','0'),(238,'productID','2','price','20.00'),(239,'productID','2','price.gbp','20.00'),(240,'productID','2','sale_price','16.50'),(241,'productID','2','sale_price.gbp','16.50'),(242,'productID','2','trade_price','14.00'),(243,'productID','2','trade_price.gbp','14.00'),(244,'productID','2','on_sale',''),(245,'productID','2','tax_group','2'),(246,'productID','2','stock_status','1'),(247,'productID','2','stock_location','0'),(248,'productID','2','max_in_cart',''),(249,'productID','2','requires_shipping','1'),(250,'productID','2','weight','250'),(251,'productID','2','width','100'),(252,'productID','2','height','250'),(253,'productID','2','depth','100'),(254,'productID','2','productID','2'),(255,'productID','2','title','Club running vest'),(256,'productID','2','sku','VEST1-MT-XS'),(257,'productID','2','productSlug',''),(258,'productID','2','stock_level','100'),(259,'productID','2','parentID','1'),(260,'productID','2','productVariantDesc','Men\'s t-shirt, Extra Small'),(261,'productID','2','productOrder','1'),(262,'productID','2','productHasVariants','0'),(263,'productID','2','productStockOnParent','0'),(264,'productID','2','productTemplate','product.html'),(265,'productID','2','productCreated','2016-04-01 14:56:05'),(266,'productID','2','productUpdated','2016-04-01 15:57:01'),(267,'productID','2','productDeleted',''),(268,'productID','2','has_variants','1'),(269,'productID','2','_variant_opts','Men\'s t-shirt\\, Extra Small (100 in stock)|2,Men\'s t-shirt\\, Small|3,Men\'s t-shirt\\, Medium|4,Men\'s t-shirt\\, Large|5,Men\'s t-shirt\\, Extra Large|6,Men\'s vest\\, Extra Small|7,Men\'s vest\\, Small|8,Men\'s vest\\, Medium|9,Men\'s vest\\, Large|10,Men\'s vest\\, Ex'),(270,'productID','2','itemID',''),(271,'productID','2','itemRowID',''),(272,'productID','2','_id','2'),(273,'productID','3','description','<p>Our exclusive club vest for wearing to races, or to the races.</p>'),(274,'productID','3','description__flang','markdown'),(275,'productID','3','description_raw','Our exclusive club vest for wearing to races, or to the races.'),(276,'productID','3','description_processed','<p>Our exclusive club vest for wearing to races, or to the races.</p>'),(277,'productID','3','image',''),(278,'productID','3','slug','club-running-vest1'),(279,'productID','3','status','1'),(280,'productID','3','brand','1'),(281,'productID','3','category_0','5'),(282,'productID','3','catalog_only','0'),(283,'productID','3','price','20.00'),(284,'productID','3','price.gbp','20.00'),(285,'productID','3','sale_price','16.50'),(286,'productID','3','sale_price.gbp','16.50'),(287,'productID','3','trade_price','14.00'),(288,'productID','3','trade_price.gbp','14.00'),(289,'productID','3','on_sale',''),(290,'productID','3','tax_group','2'),(291,'productID','3','stock_status','1'),(292,'productID','3','stock_location','0'),(293,'productID','3','max_in_cart',''),(294,'productID','3','requires_shipping','1'),(295,'productID','3','weight','250'),(296,'productID','3','width','100'),(297,'productID','3','height','250'),(298,'productID','3','depth','100'),(299,'productID','3','productID','3'),(300,'productID','3','title','Club running vest'),(301,'productID','3','sku','VEST1-MT-S'),(302,'productID','3','productSlug',''),(303,'productID','3','stock_level','100'),(304,'productID','3','parentID','1'),(305,'productID','3','productVariantDesc','Men\'s t-shirt, Small'),(306,'productID','3','productOrder','2'),(307,'productID','3','productHasVariants','0'),(308,'productID','3','productStockOnParent','0'),(309,'productID','3','productTemplate','product.html'),(310,'productID','3','productCreated','2016-04-01 14:56:05'),(311,'productID','3','productUpdated','2016-04-01 15:57:08'),(312,'productID','3','productDeleted',''),(313,'productID','3','has_variants','1'),(314,'productID','3','_variant_opts','Men\'s t-shirt\\, Extra Small (100 in stock)|2,Men\'s t-shirt\\, Small (100 in stock)|3,Men\'s t-shirt\\, Medium|4,Men\'s t-shirt\\, Large|5,Men\'s t-shirt\\, Extra Large|6,Men\'s vest\\, Extra Small|7,Men\'s vest\\, Small|8,Men\'s vest\\, Medium|9,Men\'s vest\\, Large|10,'),(315,'productID','3','itemID',''),(316,'productID','3','itemRowID',''),(317,'productID','3','_id','3'),(486,'promoID','1','title','10% off'),(487,'promoID','1','description','Save 10% with this special coupon deal!'),(488,'promoID','1','from','2016-01-01 00:00:00'),(489,'promoID','1','to','2026-12-31 23:59:00'),(490,'promoID','1','active','1'),(491,'promoID','1','action','discount_by_percent'),(492,'promoID','1','discount_code','SAVE10'),(493,'promoID','1','amount_percent','10'),(494,'promoID','1','amount',''),(495,'promoID','1','amount.gbp',''),(496,'promoID','1','trigger_value',''),(497,'promoID','1','trigger_value.gbp',''),(498,'promoID','1','max_discount',''),(499,'promoID','1','max_discount.gbp',''),(500,'promoID','1','max_uses',''),(501,'promoID','1','customer_uses',''),(502,'promoID','1','terminating','0'),(503,'promoID','1','persistent','0'),(504,'promoID','1','priority','1'),(505,'promoID','1','apply_to_shipping','0'),(506,'promoID','1','shipping_methods',''),(507,'promoID','1','promoID','1'),(508,'promoID','1','promoTitle','10% off'),(509,'promoID','1','promoFrom','2016-01-01 00:00:00'),(510,'promoID','1','promoTo','2026-12-31 23:59:00'),(511,'promoID','1','promoActive','1'),(512,'promoID','1','promoOrder','1'),(513,'promoID','1','promoCreated','2016-04-07 10:18:40'),(514,'promoID','1','promoUpdated','2016-04-07 11:18:40'),(515,'promoID','1','promoDeleted',''),(516,'promoID','1','_id','1'),(604,'emailID','1','name','Order paid'),(605,'emailID','1','subject','Thank you for your order'),(606,'emailID','1','sender_name','Nest Running Club'),(607,'emailID','1','sender_email','nest@perchdemo.com'),(608,'emailID','1','enabled','1'),(609,'emailID','1','logo',''),(610,'emailID','1','intro','Thank you for placing your order!'),(611,'emailID','1','signoff','We appreciate your business.'),(612,'emailID','1','emailID','1'),(613,'emailID','1','emailTitle','Order paid'),(614,'emailID','1','emailSlug','order_paid'),(615,'emailID','1','emailFor','customer'),(616,'emailID','1','emailRecipient',''),(617,'emailID','1','emailStatus','1'),(618,'emailID','1','emailTemplate','order_paid.html'),(619,'emailID','1','emailActive','1'),(620,'emailID','1','emailCreated','0000-00-00 00:00:00'),(621,'emailID','1','emailUpdated','2016-04-08 10:05:16'),(622,'emailID','1','itemID',''),(623,'emailID','1','itemRowID',''),(624,'emailID','1','_id','1'),(666,'productID','42','description','If you run with Nest we ask you to sign up and become a member. The small annual fee helps cover our costs such as window cleaning and big gold chains.'),(667,'productID','42','image','/perch/resources/img0043.jpg'),(668,'productID','42','slug','annual-membership'),(669,'productID','42','status','1'),(670,'productID','42','brand','1'),(671,'productID','42','_category','products/memberships/'),(672,'productID','42','catalog_only','0'),(673,'productID','42','price','15.00'),(674,'productID','42','price.gbp','15.00'),(675,'productID','42','price.usd','20.00'),(676,'productID','42','sale_price','15.00'),(677,'productID','42','sale_price.gbp','15.00'),(678,'productID','42','sale_price.usd','20.00'),(679,'productID','42','trade_price','15.00'),(680,'productID','42','trade_price.gbp','15.00'),(681,'productID','42','trade_price.usd','20.00'),(682,'productID','42','on_sale',''),(683,'productID','42','tax_group','3'),(684,'productID','42','stock_status','0'),(685,'productID','42','stock_location','0'),(686,'productID','42','max_in_cart',''),(687,'productID','42','requires_shipping','0'),(688,'productID','42','weight',''),(689,'productID','42','width',''),(690,'productID','42','height',''),(691,'productID','42','depth',''),(692,'productID','42','productID','42'),(693,'productID','42','title','Annual Membership'),(694,'productID','42','sku','MEMBER1'),(695,'productID','42','productSlug','annual-membership'),(696,'productID','42','stock_level',''),(697,'productID','42','parentID',''),(698,'productID','42','productVariantDesc',''),(699,'productID','42','productOrder','1'),(700,'productID','42','productHasVariants','0'),(701,'productID','42','productStockOnParent','0'),(702,'productID','42','productTemplate','product.html'),(703,'productID','42','productCreated','2016-04-08 12:26:57'),(704,'productID','42','productUpdated','2016-04-08 13:27:24'),(705,'productID','42','productDeleted',''),(706,'productID','42','itemID',''),(707,'productID','42','itemRowID',''),(708,'productID','42','_id','42'),(1016,'productID','43','description','Enjoy this high quality MP3 recording of our club anthem in the comfort of your own home. As performed by our amazing brass ensemble, The Nest Tooters.'),(1017,'productID','43','image','/perch/resources/nestanthem.jpg'),(1018,'productID','43','slug','club-anthem'),(1019,'productID','43','status','1'),(1020,'productID','43','brand','1'),(1021,'productID','43','_category','products/misc/'),(1022,'productID','43','catalog_only','0'),(1023,'productID','43','price','3'),(1024,'productID','43','price.gbp','3'),(1025,'productID','43','price.usd','5'),(1026,'productID','43','sale_price','2'),(1027,'productID','43','sale_price.gbp','2'),(1028,'productID','43','sale_price.usd','4'),(1029,'productID','43','trade_price','2'),(1030,'productID','43','trade_price.gbp','2'),(1031,'productID','43','trade_price.usd','4'),(1032,'productID','43','on_sale',''),(1033,'productID','43','tax_group','4'),(1034,'productID','43','stock_status','0'),(1035,'productID','43','stock_location','0'),(1036,'productID','43','max_in_cart','1'),(1037,'productID','43','requires_shipping','0'),(1038,'productID','43','weight',''),(1039,'productID','43','width',''),(1040,'productID','43','height',''),(1041,'productID','43','depth',''),(1042,'productID','43','productID','43'),(1043,'productID','43','title','Club Anthem'),(1044,'productID','43','sku','ANTHEM1'),(1045,'productID','43','productSlug','club-anthem'),(1046,'productID','43','stock_level',''),(1047,'productID','43','parentID',''),(1048,'productID','43','productVariantDesc',''),(1049,'productID','43','productOrder','1'),(1050,'productID','43','productHasVariants','0'),(1051,'productID','43','productStockOnParent','0'),(1052,'productID','43','productTemplate','product.html'),(1053,'productID','43','productCreated','2016-04-09 11:06:58'),(1054,'productID','43','productUpdated','2016-04-09 12:26:28'),(1055,'productID','43','productDeleted',''),(1056,'productID','43','itemID',''),(1057,'productID','43','itemRowID',''),(1058,'productID','43','_id','43'),(1059,'fileID','1','file','/shop/download/clubanthem.mp3'),(1060,'fileID','1','fileID','1'),(1061,'fileID','1','productID','43'),(1062,'fileID','1','fileTitle','MP3'),(1063,'fileID','1','fileSlug','mp3'),(1064,'fileID','1','resourceID','96'),(1065,'fileID','1','fileOrder','1'),(1066,'fileID','1','itemID',''),(1067,'fileID','1','itemRowID',''),(1068,'fileID','1','_id','1'),(1069,'productID','23','description','<p>Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.</p>'),(1070,'productID','23','description__flang','markdown'),(1071,'productID','23','description_raw','Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.'),(1072,'productID','23','description_processed','<p>Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.</p>'),(1073,'productID','23','image','/perch/resources/img0259.jpg'),(1074,'productID','23','image_assetID','26'),(1075,'productID','23','image_title','Img0259'),(1076,'productID','23','image__default','/perch/resources/img0259.jpg'),(1077,'productID','23','image_bucket','default'),(1078,'productID','23','image_path','img0259.jpg'),(1079,'productID','23','image_size','152263'),(1080,'productID','23','image_w','1024'),(1081,'productID','23','image_h','683'),(1082,'productID','23','image_mime','image/jpeg'),(1083,'productID','23','slug','club-running-vest1'),(1084,'productID','23','status','1'),(1085,'productID','23','brand','1'),(1086,'productID','23','category_0','5'),(1087,'productID','23','catalog_only','0'),(1088,'productID','23','price','20.00'),(1089,'productID','23','price.gbp','20.00'),(1090,'productID','23','price.usd','30.00'),(1091,'productID','23','sale_price','16.50'),(1092,'productID','23','sale_price.gbp','16.50'),(1093,'productID','23','sale_price.usd','25.00'),(1094,'productID','23','trade_price','14.00'),(1095,'productID','23','trade_price.gbp','14.00'),(1096,'productID','23','trade_price.usd','22.00'),(1097,'productID','23','on_sale',''),(1098,'productID','23','tax_group','2'),(1099,'productID','23','stock_status','1'),(1100,'productID','23','stock_location','0'),(1101,'productID','23','max_in_cart',''),(1102,'productID','23','requires_shipping','1'),(1103,'productID','23','weight','250'),(1104,'productID','23','width','100'),(1105,'productID','23','height','250'),(1106,'productID','23','depth','100'),(1107,'productID','23','productID','23'),(1108,'productID','23','title','Club running vest'),(1109,'productID','23','sku','VEST1-MT-S'),(1110,'productID','23','productSlug',''),(1111,'productID','23','stock_level','100'),(1112,'productID','23','parentID','1'),(1113,'productID','23','productVariantDesc','Men\'s t-shirt, Small'),(1114,'productID','23','productOrder','2'),(1115,'productID','23','productHasVariants','0'),(1116,'productID','23','productStockOnParent','0'),(1117,'productID','23','productTemplate','product.html'),(1118,'productID','23','productCreated','2016-04-01 14:57:43'),(1119,'productID','23','productUpdated','2016-04-09 15:54:06'),(1120,'productID','23','productDeleted',''),(1121,'productID','23','has_variants','1'),(1122,'productID','23','_variant_opts','Men\'s t-shirt\\, Extra Small (100 in stock)|22,Men\'s t-shirt\\, Small (100 in stock)|23,Men\'s t-shirt\\, Medium (100 in stock)|24,Men\'s t-shirt\\, Large (99 in stock)|25,Men\'s t-shirt\\, Extra Large (96 in stock)|26,Men\'s vest\\, Extra Small (97 in stock)|27,Me'),(1123,'productID','23','itemID',''),(1124,'productID','23','itemRowID',''),(1125,'productID','23','_id','23'),(1126,'productID','25','description','<p>Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.</p>'),(1127,'productID','25','description__flang','markdown'),(1128,'productID','25','description_raw','Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.'),(1129,'productID','25','description_processed','<p>Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.</p>'),(1130,'productID','25','image','/perch/resources/img0259.jpg'),(1131,'productID','25','image_assetID','26'),(1132,'productID','25','image_title','Img0259'),(1133,'productID','25','image__default','/perch/resources/img0259.jpg'),(1134,'productID','25','image_bucket','default'),(1135,'productID','25','image_path','img0259.jpg'),(1136,'productID','25','image_size','152263'),(1137,'productID','25','image_w','1024'),(1138,'productID','25','image_h','683'),(1139,'productID','25','image_mime','image/jpeg'),(1140,'productID','25','slug','club-running-vest1'),(1141,'productID','25','status','1'),(1142,'productID','25','brand','1'),(1143,'productID','25','category_0','5'),(1144,'productID','25','catalog_only','0'),(1145,'productID','25','price','20.00'),(1146,'productID','25','price.gbp','20.00'),(1147,'productID','25','price.usd','30.00'),(1148,'productID','25','sale_price','16.50'),(1149,'productID','25','sale_price.gbp','16.50'),(1150,'productID','25','sale_price.usd','25.00'),(1151,'productID','25','trade_price','14.00'),(1152,'productID','25','trade_price.gbp','14.00'),(1153,'productID','25','trade_price.usd','22.00'),(1154,'productID','25','on_sale',''),(1155,'productID','25','tax_group','2'),(1156,'productID','25','stock_status','1'),(1157,'productID','25','stock_location','0'),(1158,'productID','25','max_in_cart',''),(1159,'productID','25','requires_shipping','1'),(1160,'productID','25','weight','250'),(1161,'productID','25','width','100'),(1162,'productID','25','height','250'),(1163,'productID','25','depth','100'),(1164,'productID','25','productID','25'),(1165,'productID','25','title','Club running vest'),(1166,'productID','25','sku','VEST1-MT-L'),(1167,'productID','25','productSlug',''),(1168,'productID','25','stock_level','100'),(1169,'productID','25','parentID','1'),(1170,'productID','25','productVariantDesc','Men\'s t-shirt, Large'),(1171,'productID','25','productOrder','4'),(1172,'productID','25','productHasVariants','0'),(1173,'productID','25','productStockOnParent','0'),(1174,'productID','25','productTemplate','product.html'),(1175,'productID','25','productCreated','2016-04-01 14:57:43'),(1176,'productID','25','productUpdated','2016-04-09 15:54:13'),(1177,'productID','25','productDeleted',''),(1178,'productID','25','has_variants','1'),(1179,'productID','25','_variant_opts','Men\'s t-shirt\\, Extra Small (100 in stock)|22,Men\'s t-shirt\\, Small (100 in stock)|23,Men\'s t-shirt\\, Medium (100 in stock)|24,Men\'s t-shirt\\, Large (100 in stock)|25,Men\'s t-shirt\\, Extra Large (96 in stock)|26,Men\'s vest\\, Extra Small (97 in stock)|27,M'),(1180,'productID','25','itemID',''),(1181,'productID','25','itemRowID',''),(1182,'productID','25','_id','25'),(1183,'productID','26','description','<p>Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.</p>'),(1184,'productID','26','description__flang','markdown'),(1185,'productID','26','description_raw','Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.'),(1186,'productID','26','description_processed','<p>Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.</p>'),(1187,'productID','26','image','/perch/resources/img0259.jpg'),(1188,'productID','26','image_assetID','26'),(1189,'productID','26','image_title','Img0259'),(1190,'productID','26','image__default','/perch/resources/img0259.jpg'),(1191,'productID','26','image_bucket','default'),(1192,'productID','26','image_path','img0259.jpg'),(1193,'productID','26','image_size','152263'),(1194,'productID','26','image_w','1024'),(1195,'productID','26','image_h','683'),(1196,'productID','26','image_mime','image/jpeg'),(1197,'productID','26','slug','club-running-vest1'),(1198,'productID','26','status','1'),(1199,'productID','26','brand','1'),(1200,'productID','26','category_0','5'),(1201,'productID','26','catalog_only','0'),(1202,'productID','26','price','20.00'),(1203,'productID','26','price.gbp','20.00'),(1204,'productID','26','price.usd','30.00'),(1205,'productID','26','sale_price','16.50'),(1206,'productID','26','sale_price.gbp','16.50'),(1207,'productID','26','sale_price.usd','25.00'),(1208,'productID','26','trade_price','14.00'),(1209,'productID','26','trade_price.gbp','14.00'),(1210,'productID','26','trade_price.usd','22.00'),(1211,'productID','26','on_sale',''),(1212,'productID','26','tax_group','2'),(1213,'productID','26','stock_status','1'),(1214,'productID','26','stock_location','0'),(1215,'productID','26','max_in_cart',''),(1216,'productID','26','requires_shipping','1'),(1217,'productID','26','weight','250'),(1218,'productID','26','width','100'),(1219,'productID','26','height','250'),(1220,'productID','26','depth','100'),(1221,'productID','26','productID','26'),(1222,'productID','26','title','Club running vest'),(1223,'productID','26','sku','VEST1-MT-XL'),(1224,'productID','26','productSlug',''),(1225,'productID','26','stock_level','100'),(1226,'productID','26','parentID','1'),(1227,'productID','26','productVariantDesc','Men\'s t-shirt, Extra Large'),(1228,'productID','26','productOrder','5'),(1229,'productID','26','productHasVariants','0'),(1230,'productID','26','productStockOnParent','0'),(1231,'productID','26','productTemplate','product.html'),(1232,'productID','26','productCreated','2016-04-01 14:57:43'),(1233,'productID','26','productUpdated','2016-04-09 15:54:19'),(1234,'productID','26','productDeleted',''),(1235,'productID','26','has_variants','1'),(1236,'productID','26','_variant_opts','Men\'s t-shirt\\, Extra Small (100 in stock)|22,Men\'s t-shirt\\, Small (100 in stock)|23,Men\'s t-shirt\\, Medium (100 in stock)|24,Men\'s t-shirt\\, Large (100 in stock)|25,Men\'s t-shirt\\, Extra Large (100 in stock)|26,Men\'s vest\\, Extra Small (97 in stock)|27,'),(1237,'productID','26','itemID',''),(1238,'productID','26','itemRowID',''),(1239,'productID','26','_id','26'),(1240,'productID','27','description','<p>Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.</p>'),(1241,'productID','27','description__flang','markdown'),(1242,'productID','27','description_raw','Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.'),(1243,'productID','27','description_processed','<p>Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.</p>'),(1244,'productID','27','image','/perch/resources/img0259.jpg'),(1245,'productID','27','image_assetID','26'),(1246,'productID','27','image_title','Img0259'),(1247,'productID','27','image__default','/perch/resources/img0259.jpg'),(1248,'productID','27','image_bucket','default'),(1249,'productID','27','image_path','img0259.jpg'),(1250,'productID','27','image_size','152263'),(1251,'productID','27','image_w','1024'),(1252,'productID','27','image_h','683'),(1253,'productID','27','image_mime','image/jpeg'),(1254,'productID','27','slug','club-running-vest1'),(1255,'productID','27','status','1'),(1256,'productID','27','brand','1'),(1257,'productID','27','category_0','5'),(1258,'productID','27','catalog_only','0'),(1259,'productID','27','price','20.00'),(1260,'productID','27','price.gbp','20.00'),(1261,'productID','27','price.usd','30.00'),(1262,'productID','27','sale_price','16.50'),(1263,'productID','27','sale_price.gbp','16.50'),(1264,'productID','27','sale_price.usd','25.00'),(1265,'productID','27','trade_price','14.00'),(1266,'productID','27','trade_price.gbp','14.00'),(1267,'productID','27','trade_price.usd','22.00'),(1268,'productID','27','on_sale',''),(1269,'productID','27','tax_group','2'),(1270,'productID','27','stock_status','1'),(1271,'productID','27','stock_location','0'),(1272,'productID','27','max_in_cart',''),(1273,'productID','27','requires_shipping','1'),(1274,'productID','27','weight','250'),(1275,'productID','27','width','100'),(1276,'productID','27','height','250'),(1277,'productID','27','depth','100'),(1278,'productID','27','productID','27'),(1279,'productID','27','title','Club running vest'),(1280,'productID','27','sku','VEST1-MV-XS'),(1281,'productID','27','productSlug',''),(1282,'productID','27','stock_level','100'),(1283,'productID','27','parentID','1'),(1284,'productID','27','productVariantDesc','Men\'s vest, Extra Small'),(1285,'productID','27','productOrder','6'),(1286,'productID','27','productHasVariants','0'),(1287,'productID','27','productStockOnParent','0'),(1288,'productID','27','productTemplate','product.html'),(1289,'productID','27','productCreated','2016-04-01 14:57:43'),(1290,'productID','27','productUpdated','2016-04-09 15:54:26'),(1291,'productID','27','productDeleted',''),(1292,'productID','27','has_variants','1'),(1293,'productID','27','_variant_opts','Men\'s t-shirt\\, Extra Small (100 in stock)|22,Men\'s t-shirt\\, Small (100 in stock)|23,Men\'s t-shirt\\, Medium (100 in stock)|24,Men\'s t-shirt\\, Large (100 in stock)|25,Men\'s t-shirt\\, Extra Large (100 in stock)|26,Men\'s vest\\, Extra Small (100 in stock)|27'),(1294,'productID','27','itemID',''),(1295,'productID','27','itemRowID',''),(1296,'productID','27','_id','27'),(1297,'productID','29','description','<p>Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.</p>'),(1298,'productID','29','description__flang','markdown'),(1299,'productID','29','description_raw','Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.'),(1300,'productID','29','description_processed','<p>Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.</p>'),(1301,'productID','29','image','/perch/resources/img0259.jpg'),(1302,'productID','29','image_assetID','26'),(1303,'productID','29','image_title','Img0259'),(1304,'productID','29','image__default','/perch/resources/img0259.jpg'),(1305,'productID','29','image_bucket','default'),(1306,'productID','29','image_path','img0259.jpg'),(1307,'productID','29','image_size','152263'),(1308,'productID','29','image_w','1024'),(1309,'productID','29','image_h','683'),(1310,'productID','29','image_mime','image/jpeg'),(1311,'productID','29','slug','club-running-vest1'),(1312,'productID','29','status','1'),(1313,'productID','29','brand','1'),(1314,'productID','29','category_0','5'),(1315,'productID','29','catalog_only','0'),(1316,'productID','29','price','20.00'),(1317,'productID','29','price.gbp','20.00'),(1318,'productID','29','price.usd','30.00'),(1319,'productID','29','sale_price','16.50'),(1320,'productID','29','sale_price.gbp','16.50'),(1321,'productID','29','sale_price.usd','25.00'),(1322,'productID','29','trade_price','14.00'),(1323,'productID','29','trade_price.gbp','14.00'),(1324,'productID','29','trade_price.usd','22.00'),(1325,'productID','29','on_sale',''),(1326,'productID','29','tax_group','2'),(1327,'productID','29','stock_status','1'),(1328,'productID','29','stock_location','0'),(1329,'productID','29','max_in_cart',''),(1330,'productID','29','requires_shipping','1'),(1331,'productID','29','weight','250'),(1332,'productID','29','width','100'),(1333,'productID','29','height','250'),(1334,'productID','29','depth','100'),(1335,'productID','29','productID','29'),(1336,'productID','29','title','Club running vest'),(1337,'productID','29','sku','VEST1-MV-M'),(1338,'productID','29','productSlug',''),(1339,'productID','29','stock_level','100'),(1340,'productID','29','parentID','1'),(1341,'productID','29','productVariantDesc','Men\'s vest, Medium'),(1342,'productID','29','productOrder','8'),(1343,'productID','29','productHasVariants','0'),(1344,'productID','29','productStockOnParent','0'),(1345,'productID','29','productTemplate','product.html'),(1346,'productID','29','productCreated','2016-04-01 14:57:43'),(1347,'productID','29','productUpdated','2016-04-09 15:54:32'),(1348,'productID','29','productDeleted',''),(1349,'productID','29','has_variants','1'),(1350,'productID','29','_variant_opts','Men\'s t-shirt\\, Extra Small (100 in stock)|22,Men\'s t-shirt\\, Small (100 in stock)|23,Men\'s t-shirt\\, Medium (100 in stock)|24,Men\'s t-shirt\\, Large (100 in stock)|25,Men\'s t-shirt\\, Extra Large (100 in stock)|26,Men\'s vest\\, Extra Small (100 in stock)|27'),(1351,'productID','29','itemID',''),(1352,'productID','29','itemRowID',''),(1353,'productID','29','_id','29'),(1354,'productID','34','description','<p>Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.</p>'),(1355,'productID','34','description__flang','markdown'),(1356,'productID','34','description_raw','Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.'),(1357,'productID','34','description_processed','<p>Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.</p>'),(1358,'productID','34','image','/perch/resources/img0259.jpg'),(1359,'productID','34','image_assetID','26'),(1360,'productID','34','image_title','Img0259'),(1361,'productID','34','image__default','/perch/resources/img0259.jpg'),(1362,'productID','34','image_bucket','default'),(1363,'productID','34','image_path','img0259.jpg'),(1364,'productID','34','image_size','152263'),(1365,'productID','34','image_w','1024'),(1366,'productID','34','image_h','683'),(1367,'productID','34','image_mime','image/jpeg'),(1368,'productID','34','slug','club-running-vest1'),(1369,'productID','34','status','1'),(1370,'productID','34','brand','1'),(1371,'productID','34','category_0','5'),(1372,'productID','34','catalog_only','0'),(1373,'productID','34','price','20.00'),(1374,'productID','34','price.gbp','20.00'),(1375,'productID','34','price.usd','30.00'),(1376,'productID','34','sale_price','16.50'),(1377,'productID','34','sale_price.gbp','16.50'),(1378,'productID','34','sale_price.usd','25.00'),(1379,'productID','34','trade_price','14.00'),(1380,'productID','34','trade_price.gbp','14.00'),(1381,'productID','34','trade_price.usd','22.00'),(1382,'productID','34','on_sale',''),(1383,'productID','34','tax_group','2'),(1384,'productID','34','stock_status','1'),(1385,'productID','34','stock_location','0'),(1386,'productID','34','max_in_cart',''),(1387,'productID','34','requires_shipping','1'),(1388,'productID','34','weight','250'),(1389,'productID','34','width','100'),(1390,'productID','34','height','250'),(1391,'productID','34','depth','100'),(1392,'productID','34','productID','34'),(1393,'productID','34','title','Club running vest'),(1394,'productID','34','sku','VEST1-WT-M'),(1395,'productID','34','productSlug',''),(1396,'productID','34','stock_level','100'),(1397,'productID','34','parentID','1'),(1398,'productID','34','productVariantDesc','Women\'s t-shirt, Medium'),(1399,'productID','34','productOrder','13'),(1400,'productID','34','productHasVariants','0'),(1401,'productID','34','productStockOnParent','0'),(1402,'productID','34','productTemplate','product.html'),(1403,'productID','34','productCreated','2016-04-01 14:57:43'),(1404,'productID','34','productUpdated','2016-04-09 15:54:42'),(1405,'productID','34','productDeleted',''),(1406,'productID','34','has_variants','1'),(1407,'productID','34','_variant_opts','Men\'s t-shirt\\, Extra Small (100 in stock)|22,Men\'s t-shirt\\, Small (100 in stock)|23,Men\'s t-shirt\\, Medium (100 in stock)|24,Men\'s t-shirt\\, Large (100 in stock)|25,Men\'s t-shirt\\, Extra Large (100 in stock)|26,Men\'s vest\\, Extra Small (100 in stock)|27'),(1408,'productID','34','itemID',''),(1409,'productID','34','itemRowID',''),(1410,'productID','34','_id','34'),(1456,'productID','1','description','Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.'),(1457,'productID','1','image','/perch/resources/img0259.jpg'),(1458,'productID','1','slug','club-running-vest1'),(1459,'productID','1','status','1'),(1460,'productID','1','brand','1'),(1461,'productID','1','_category','products/club-kit/'),(1462,'productID','1','catalog_only','0'),(1463,'productID','1','price','20.00'),(1464,'productID','1','price.gbp','20.00'),(1465,'productID','1','price.usd','30.00'),(1466,'productID','1','sale_price','16.50'),(1467,'productID','1','sale_price.gbp','16.50'),(1468,'productID','1','sale_price.usd','25.00'),(1469,'productID','1','trade_price','14.00'),(1470,'productID','1','trade_price.gbp','14.00'),(1471,'productID','1','trade_price.usd','22.00'),(1472,'productID','1','on_sale',''),(1473,'productID','1','tax_group','2'),(1474,'productID','1','stock_status','1'),(1475,'productID','1','stock_location','0'),(1476,'productID','1','max_in_cart',''),(1477,'productID','1','requires_shipping','1'),(1478,'productID','1','weight','250'),(1479,'productID','1','width','100'),(1480,'productID','1','height','250'),(1481,'productID','1','depth','100'),(1482,'productID','1','productID','1'),(1483,'productID','1','title','Club running vest'),(1484,'productID','1','sku','VEST1'),(1485,'productID','1','productSlug','club-running-vest1'),(1486,'productID','1','stock_level','100'),(1487,'productID','1','parentID',''),(1488,'productID','1','productVariantDesc',''),(1489,'productID','1','productOrder','1'),(1490,'productID','1','productHasVariants','1'),(1491,'productID','1','productStockOnParent','0'),(1492,'productID','1','productTemplate','product.html'),(1493,'productID','1','productCreated','2016-04-01 14:55:36'),(1494,'productID','1','productUpdated','2016-04-09 15:55:13'),(1495,'productID','1','productDeleted',''),(1496,'productID','1','itemID',''),(1497,'productID','1','itemRowID',''),(1498,'productID','1','has_variants','1'),(1499,'productID','1','_variant_opts','Men\'s t-shirt\\, Extra Small (100 in stock)|22,Men\'s t-shirt\\, Small (100 in stock)|23,Men\'s t-shirt\\, Medium (100 in stock)|24,Men\'s t-shirt\\, Large (100 in stock)|25,Men\'s t-shirt\\, Extra Large (100 in stock)|26,Men\'s vest\\, Extra Small (100 in stock)|27'),(1500,'productID','1','_id','1');
/*!40000 ALTER TABLE `perch2_shop_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_option_values`
--

DROP TABLE IF EXISTS `perch2_shop_option_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_option_values` (
  `valueID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `optionID` int(10) unsigned NOT NULL,
  `valueTitle` varchar(255) NOT NULL DEFAULT '',
  `valueSKUCode` char(16) DEFAULT NULL,
  `valueOrder` int(10) unsigned NOT NULL DEFAULT '1',
  `valueDynamicFields` mediumtext NOT NULL,
  `valueCreated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `valueUpdated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `valueDeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`valueID`),
  KEY `idx_mod` (`optionID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_option_values`
--

LOCK TABLES `perch2_shop_option_values` WRITE;
/*!40000 ALTER TABLE `perch2_shop_option_values` DISABLE KEYS */;
INSERT INTO `perch2_shop_option_values` VALUES (1,1,'Extra Small','XS',1,'{}','2016-04-01 14:48:03','2016-04-01 15:53:13',NULL),(2,1,'Small','S',2,'{}','2016-04-01 14:48:03','2016-04-01 15:53:13',NULL),(3,1,'Medium','M',3,'{}','2016-04-01 14:48:03','2016-04-01 15:53:13',NULL),(4,1,'Large','L',4,'{}','2016-04-01 14:48:03','2016-04-01 15:53:13',NULL),(5,1,'Extra Large','XL',5,'{}','2016-04-01 14:48:03','2016-04-01 15:53:13',NULL),(6,2,'Men\'s t-shirt','MT',1,'{}','2016-04-01 14:53:09','2016-04-01 15:55:57',NULL),(7,2,'Men\'s vest','MV',2,'{}','2016-04-01 14:53:09','2016-04-01 15:55:57',NULL),(8,2,'Women\'s t-shirt','WT',3,'{}','2016-04-01 14:53:09','2016-04-01 15:55:57',NULL),(9,2,'Women\'s vest','WV',4,'{}','2016-04-01 14:53:09','2016-04-01 15:55:57',NULL);
/*!40000 ALTER TABLE `perch2_shop_option_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_options`
--

DROP TABLE IF EXISTS `perch2_shop_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_options` (
  `optionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `optionTitle` varchar(255) NOT NULL DEFAULT '',
  `optionPrecendence` int(10) unsigned NOT NULL DEFAULT '1',
  `optionDynamicFields` mediumtext NOT NULL,
  `optionCreated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `optionUpdated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `optionDeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`optionID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_options`
--

LOCK TABLES `perch2_shop_options` WRITE;
/*!40000 ALTER TABLE `perch2_shop_options` DISABLE KEYS */;
INSERT INTO `perch2_shop_options` VALUES (1,'Size',2,'{\"title\":\"Size\",\"precendence\":\"2\"}','2016-04-01 14:48:03','2016-04-01 15:53:13',NULL),(2,'Vest style',1,'{\"title\":\"Vest style\",\"precendence\":\"1\"}','2016-04-01 14:53:09','2016-04-01 15:55:57',NULL);
/*!40000 ALTER TABLE `perch2_shop_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_order_items`
--

DROP TABLE IF EXISTS `perch2_shop_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_order_items` (
  `itemID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemType` enum('product','shipping','discount') NOT NULL DEFAULT 'product',
  `orderID` int(10) unsigned DEFAULT NULL,
  `productID` int(10) unsigned DEFAULT NULL,
  `shippingID` int(10) unsigned DEFAULT NULL,
  `itemPrice` decimal(10,2) DEFAULT '0.00',
  `itemTax` decimal(10,2) DEFAULT '0.00',
  `itemDiscount` decimal(10,2) DEFAULT '0.00',
  `itemTaxDiscount` decimal(10,2) DEFAULT '0.00',
  `itemTotal` decimal(10,2) DEFAULT '0.00',
  `itemQty` int(10) unsigned NOT NULL DEFAULT '1',
  `itemTaxRate` char(16) DEFAULT '0.00',
  `itemDynamicFields` mediumtext,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_order_items`
--

LOCK TABLES `perch2_shop_order_items` WRITE;
/*!40000 ALTER TABLE `perch2_shop_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_shop_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_order_promotions`
--

DROP TABLE IF EXISTS `perch2_shop_order_promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_order_promotions` (
  `orderpromoID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `promoID` int(10) unsigned NOT NULL,
  `orderID` int(10) unsigned NOT NULL,
  `customerID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`orderpromoID`),
  KEY `idx_promo` (`promoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_order_promotions`
--

LOCK TABLES `perch2_shop_order_promotions` WRITE;
/*!40000 ALTER TABLE `perch2_shop_order_promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_shop_order_promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_order_statuses`
--

DROP TABLE IF EXISTS `perch2_shop_order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_order_statuses` (
  `statusID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `statusKey` char(64) NOT NULL DEFAULT '',
  `statusTitle` char(128) NOT NULL,
  `statusEditable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `statusIndex` int(10) unsigned NOT NULL DEFAULT '101',
  `statusDynamicFields` text,
  `statusCreated` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `statusUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statusDeleted` datetime DEFAULT NULL,
  `statusActive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`statusID`),
  KEY `idx_key` (`statusKey`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_order_statuses`
--

LOCK TABLES `perch2_shop_order_statuses` WRITE;
/*!40000 ALTER TABLE `perch2_shop_order_statuses` DISABLE KEYS */;
INSERT INTO `perch2_shop_order_statuses` VALUES (1,'created','Created',0,0,'[]','0000-00-00 00:00:00','2016-02-26 12:42:44',NULL,1),(2,'payment_failed','Payment failed',0,50,NULL,'0000-00-00 00:00:00','2016-02-26 12:39:44',NULL,1),(3,'paid','Paid',0,100,'[]','0000-00-00 00:00:00','2016-02-26 20:42:00',NULL,1),(4,'processing','Processing',0,150,NULL,'0000-00-00 00:00:00','2016-02-26 12:39:45',NULL,1),(5,'cancelled','Cancelled',0,200,NULL,'0000-00-00 00:00:00','2016-02-26 12:39:45',NULL,1),(6,'dispatched','Dispatched',0,250,NULL,'0000-00-00 00:00:00','2016-02-26 12:39:45',NULL,1),(7,'returned','Returned',0,300,NULL,'0000-00-00 00:00:00','2016-02-26 12:39:46',NULL,1),(8,'partial_refund','Partial refund',0,350,NULL,'0000-00-00 00:00:00','2016-02-26 12:39:46',NULL,1),(9,'refunded','Refunded',0,400,NULL,'0000-00-00 00:00:00','2016-02-26 12:39:47',NULL,1);
/*!40000 ALTER TABLE `perch2_shop_order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_orders`
--

DROP TABLE IF EXISTS `perch2_shop_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_orders` (
  `orderID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderStatus` char(128) DEFAULT '',
  `orderInvoiceNumber` char(128) DEFAULT NULL,
  `orderGateway` char(128) NOT NULL DEFAULT '',
  `orderTotal` char(128) NOT NULL DEFAULT '',
  `orderItemsSubtotal` char(128) NOT NULL DEFAULT '0',
  `orderItemsTax` char(128) NOT NULL DEFAULT '0',
  `orderItemsTotal` char(128) NOT NULL DEFAULT '0',
  `orderShippingSubtotal` char(128) NOT NULL DEFAULT '0',
  `orderShippingDiscounts` char(128) NOT NULL DEFAULT '0',
  `orderShippingTax` char(128) NOT NULL DEFAULT '0',
  `orderShippingTaxDiscounts` char(128) NOT NULL DEFAULT '0',
  `orderShippingTotal` char(128) NOT NULL DEFAULT '0',
  `orderDiscountsTotal` char(128) NOT NULL DEFAULT '0',
  `orderTaxDiscountsTotal` char(128) NOT NULL DEFAULT '0',
  `orderSubtotal` char(128) NOT NULL DEFAULT '0',
  `orderTaxTotal` char(128) NOT NULL DEFAULT '0',
  `orderItemsRefunded` char(128) NOT NULL DEFAULT '0',
  `orderTaxRefunded` char(128) NOT NULL DEFAULT '0',
  `orderShippingRefunded` char(128) NOT NULL DEFAULT '0',
  `orderTotalRefunded` char(128) NOT NULL DEFAULT '0',
  `orderTaxID` char(255) DEFAULT NULL,
  `currencyID` int(10) unsigned NOT NULL,
  `orderExchangeRate` float(10,5) unsigned DEFAULT NULL,
  `orderShippingWeight` char(128) NOT NULL DEFAULT '0',
  `customerID` int(10) unsigned NOT NULL DEFAULT '0',
  `shippingID` int(10) unsigned DEFAULT '0',
  `orderShippingTaxRate` char(128) NOT NULL DEFAULT '0',
  `orderShippingAddress` int(10) unsigned NOT NULL DEFAULT '0',
  `orderBillingAddress` int(10) unsigned NOT NULL DEFAULT '0',
  `orderGatewayRef` char(255) DEFAULT NULL,
  `orderPricing` enum('standard','sale','trade') NOT NULL DEFAULT 'standard',
  `orderDynamicFields` mediumtext,
  `orderCreated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `orderUpdated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `orderDeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `idx_customer` (`customerID`),
  KEY `idx_status` (`orderStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_orders`
--

LOCK TABLES `perch2_shop_orders` WRITE;
/*!40000 ALTER TABLE `perch2_shop_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_shop_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_orders_meta`
--

DROP TABLE IF EXISTS `perch2_shop_orders_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_orders_meta` (
  `id` char(64) NOT NULL DEFAULT '',
  `metaValue` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_orders_meta`
--

LOCK TABLES `perch2_shop_orders_meta` WRITE;
/*!40000 ALTER TABLE `perch2_shop_orders_meta` DISABLE KEYS */;
INSERT INTO `perch2_shop_orders_meta` VALUES ('last_invoice_number','0');
/*!40000 ALTER TABLE `perch2_shop_orders_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_product_files`
--

DROP TABLE IF EXISTS `perch2_shop_product_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_product_files` (
  `fileID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productID` int(10) unsigned NOT NULL,
  `fileTitle` char(255) NOT NULL DEFAULT '',
  `fileSlug` char(255) NOT NULL DEFAULT '',
  `resourceID` int(10) NOT NULL DEFAULT '0',
  `fileDynamicFields` text,
  `fileOrder` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`fileID`),
  KEY `idx_product` (`productID`),
  KEY `idx_resource` (`resourceID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_product_files`
--

LOCK TABLES `perch2_shop_product_files` WRITE;
/*!40000 ALTER TABLE `perch2_shop_product_files` DISABLE KEYS */;
INSERT INTO `perch2_shop_product_files` VALUES (1,43,'MP3','mp3',96,'{\"file\":{\"assetID\":\"96\",\"title\":\"Club anthem\",\"_default\":\"\\/shop\\/download\\/clubanthem.mp3\",\"bucket\":\"shop\",\"path\":\"clubanthem.mp3\",\"size\":68766,\"mime\":\"audio\\/mpeg\"}}',1);
/*!40000 ALTER TABLE `perch2_shop_product_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_product_option_values`
--

DROP TABLE IF EXISTS `perch2_shop_product_option_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_product_option_values` (
  `prodoptID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productID` int(10) unsigned NOT NULL,
  `optionID` int(10) unsigned NOT NULL,
  `valueID` int(10) unsigned NOT NULL,
  `valueModPrice` decimal(4,2) NOT NULL DEFAULT '0.00',
  `valueModOperator` enum('+','-','=') NOT NULL DEFAULT '+',
  PRIMARY KEY (`prodoptID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_product_option_values`
--

LOCK TABLES `perch2_shop_product_option_values` WRITE;
/*!40000 ALTER TABLE `perch2_shop_product_option_values` DISABLE KEYS */;
INSERT INTO `perch2_shop_product_option_values` VALUES (1,1,1,1,0.00,'+'),(2,1,1,2,0.00,'+'),(3,1,1,3,0.00,'+'),(4,1,1,4,0.00,'+'),(5,1,1,5,0.00,'+'),(6,1,2,6,0.00,'+'),(7,1,2,7,0.00,'+'),(8,1,2,8,0.00,'+'),(9,1,2,9,0.00,'+');
/*!40000 ALTER TABLE `perch2_shop_product_option_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_product_options`
--

DROP TABLE IF EXISTS `perch2_shop_product_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_product_options` (
  `productID` int(10) unsigned NOT NULL,
  `optionID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`productID`,`optionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_product_options`
--

LOCK TABLES `perch2_shop_product_options` WRITE;
/*!40000 ALTER TABLE `perch2_shop_product_options` DISABLE KEYS */;
INSERT INTO `perch2_shop_product_options` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `perch2_shop_product_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_product_tags`
--

DROP TABLE IF EXISTS `perch2_shop_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_product_tags` (
  `prodtagID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productID` int(10) unsigned NOT NULL,
  `tagID` int(10) unsigned NOT NULL DEFAULT '0',
  `tagExpiry` char(255) DEFAULT NULL,
  `tagDynamicFields` text,
  `tagOrder` int(10) unsigned DEFAULT NULL,
  `tagCreated` datetime DEFAULT NULL,
  `tagModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tagDeleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`prodtagID`),
  KEY `idx_product` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_product_tags`
--

LOCK TABLES `perch2_shop_product_tags` WRITE;
/*!40000 ALTER TABLE `perch2_shop_product_tags` DISABLE KEYS */;
INSERT INTO `perch2_shop_product_tags` VALUES (1,42,1,'+12 MONTHS','{\"tag\":\"member\",\"expiry\":{\"_default\":\"+12 MONTHS\",\"count\":\"12\",\"unit\":\"MONTHS\"},\"id\":null}',1,NULL,'2016-04-08 12:28:43',NULL);
/*!40000 ALTER TABLE `perch2_shop_product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_products`
--

DROP TABLE IF EXISTS `perch2_shop_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_products` (
  `productID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `sku` char(255) NOT NULL DEFAULT '',
  `productSlug` varchar(255) DEFAULT NULL,
  `stock_level` int(10) unsigned DEFAULT NULL,
  `parentID` int(10) unsigned DEFAULT NULL,
  `productVariantDesc` varchar(255) DEFAULT NULL,
  `productOrder` int(10) unsigned NOT NULL DEFAULT '1',
  `productHasVariants` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `productStockOnParent` tinyint(1) unsigned DEFAULT '0',
  `productDynamicFields` mediumtext NOT NULL,
  `productTemplate` char(64) NOT NULL DEFAULT 'product.html',
  `productCreated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `productUpdated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `productDeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`productID`),
  KEY `idx_sku` (`sku`),
  KEY `idx_del` (`productDeleted`),
  KEY `idx_parent` (`parentID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_products`
--

LOCK TABLES `perch2_shop_products` WRITE;
/*!40000 ALTER TABLE `perch2_shop_products` DISABLE KEYS */;
INSERT INTO `perch2_shop_products` VALUES (1,'Club running vest','VEST1','club-running-vest1',100,NULL,NULL,1,1,0,'{\"description\":{\"_flang\":\"markdown\",\"raw\":\"Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.\",\"processed\":\"<p>Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.<\\/p>\"},\"image\":{\"assetID\":\"26\",\"title\":\"Img0259\",\"_default\":\"\\/perch\\/resources\\/img0259.jpg\",\"bucket\":\"default\",\"path\":\"img0259.jpg\",\"size\":152263,\"w\":1024,\"h\":683,\"mime\":\"image\\/jpeg\",\"sizes\":{\"thumb\":{\"w\":\"150\",\"h\":\"100\",\"target_w\":150,\"target_h\":150,\"density\":2,\"path\":\"img0259-thumb.jpg\",\"size\":4770,\"mime\":\"\",\"assetID\":\"27\"},\"w800hc0\":{\"w\":\"800\",\"h\":\"533\",\"target_w\":\"800\",\"target_h\":false,\"crop\":false,\"density\":\"1\",\"path\":\"img0259-w800.jpg\",\"size\":52719,\"mime\":\"\",\"assetID\":\"90\"},\"w80h80c1@1.6x\":{\"w\":80,\"h\":80,\"target_w\":\"80\",\"target_h\":\"80\",\"crop\":\"true\",\"density\":\"1.6\",\"path\":\"img0259-w80h80@1.6x.jpg\",\"size\":5241,\"mime\":\"image\\/jpeg\"},\"w600h600c1@1.6x\":{\"w\":600,\"h\":600,\"target_w\":\"600\",\"target_h\":\"600\",\"crop\":\"true\",\"density\":\"1.6\",\"path\":\"img0259-w600h600@1.6x.jpg\",\"size\":111228,\"mime\":\"image\\/jpeg\"}}},\"slug\":\"club-running-vest1\",\"status\":\"1\",\"brand\":\"1\",\"category\":[\"5\"],\"catalog_only\":\"0\",\"price\":{\"47\":\"20.00\",\"142\":\"30.00\"},\"sale_price\":{\"47\":\"16.50\",\"142\":\"25.00\"},\"trade_price\":{\"47\":\"14.00\",\"142\":\"22.00\"},\"on_sale\":null,\"tax_group\":\"2\",\"stock_status\":\"1\",\"stock_location\":\"0\",\"max_in_cart\":null,\"requires_shipping\":\"1\",\"weight\":\"250\",\"width\":\"100\",\"height\":\"250\",\"depth\":\"100\"}','product.html','2016-04-01 14:55:36','2016-04-09 15:55:13',NULL),(2,'Club running vest','VEST1-MT-XS',NULL,100,1,'Men\'s t-shirt, Extra Small',1,0,0,'{\"price\":{\"47\":\"20.00\"},\"sale_price\":{\"47\":\"16.50\"},\"trade_price\":{\"47\":\"14.00\"},\"on_sale\":null,\"tax_group\":\"2\",\"stock_status\":\"1\",\"requires_shipping\":\"1\",\"weight\":\"250\",\"width\":\"100\",\"height\":\"250\",\"depth\":\"100\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:12','2016-04-01 14:57:12'),(3,'Club running vest','VEST1-MT-S',NULL,100,1,'Men\'s t-shirt, Small',2,0,0,'{\"price\":{\"47\":\"20.00\"},\"sale_price\":{\"47\":\"16.50\"},\"trade_price\":{\"47\":\"14.00\"},\"on_sale\":null,\"tax_group\":\"2\",\"stock_status\":\"1\",\"requires_shipping\":\"1\",\"weight\":\"250\",\"width\":\"100\",\"height\":\"250\",\"depth\":\"100\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:14','2016-04-01 14:57:14'),(4,'Club running vest','VEST1-MT-M',NULL,NULL,1,'Men\'s t-shirt, Medium',3,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:15','2016-04-01 14:57:15'),(5,'Club running vest','VEST1-MT-L',NULL,NULL,1,'Men\'s t-shirt, Large',4,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:16','2016-04-01 14:57:16'),(6,'Club running vest','VEST1-MT-XL',NULL,NULL,1,'Men\'s t-shirt, Extra Large',5,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:18','2016-04-01 14:57:18'),(7,'Club running vest','VEST1-MV-XS',NULL,NULL,1,'Men\'s vest, Extra Small',6,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:19','2016-04-01 14:57:19'),(8,'Club running vest','VEST1-MV-S',NULL,NULL,1,'Men\'s vest, Small',7,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:20','2016-04-01 14:57:20'),(9,'Club running vest','VEST1-MV-M',NULL,NULL,1,'Men\'s vest, Medium',8,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:21','2016-04-01 14:57:21'),(10,'Club running vest','VEST1-MV-L',NULL,NULL,1,'Men\'s vest, Large',9,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:22','2016-04-01 14:57:22'),(11,'Club running vest','VEST1-MV-XL',NULL,NULL,1,'Men\'s vest, Extra Large',10,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:23','2016-04-01 14:57:23'),(12,'Club running vest','VEST1-WT-XS',NULL,NULL,1,'Women\'s t-shirt, Extra Small',11,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:24','2016-04-01 14:57:24'),(13,'Club running vest','VEST1-WT-S',NULL,NULL,1,'Women\'s t-shirt, Small',12,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:25','2016-04-01 14:57:25'),(14,'Club running vest','VEST1-WT-M',NULL,NULL,1,'Women\'s t-shirt, Medium',13,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:26','2016-04-01 14:57:26'),(15,'Club running vest','VEST1-WT-L',NULL,NULL,1,'Women\'s t-shirt, Large',14,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:27','2016-04-01 14:57:27'),(16,'Club running vest','VEST1-WT-XL',NULL,NULL,1,'Women\'s t-shirt, Extra Large',15,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:29','2016-04-01 14:57:29'),(17,'Club running vest','VEST1-WV-XS',NULL,NULL,1,'Women\'s vest, Extra Small',16,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:30','2016-04-01 14:57:30'),(18,'Club running vest','VEST1-WV-S',NULL,NULL,1,'Women\'s vest, Small',17,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:31','2016-04-01 14:57:31'),(19,'Club running vest','VEST1-WV-M',NULL,NULL,1,'Women\'s vest, Medium',18,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:32','2016-04-01 14:57:32'),(20,'Club running vest','VEST1-WV-L',NULL,NULL,1,'Women\'s vest, Large',19,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:33','2016-04-01 14:57:33'),(21,'Club running vest','VEST1-WV-XL',NULL,NULL,1,'Women\'s vest, Extra Large',20,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:56:05','2016-04-01 15:57:34','2016-04-01 14:57:34'),(22,'Club running vest','VEST1-MT-XS',NULL,100,1,'Men\'s t-shirt, Extra Small',1,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(23,'Club running vest','VEST1-MT-S',NULL,100,1,'Men\'s t-shirt, Small',2,0,0,'{\"price\":{\"47\":\"20.00\",\"142\":\"30.00\"},\"sale_price\":{\"47\":\"16.50\",\"142\":\"25.00\"},\"trade_price\":{\"47\":\"14.00\",\"142\":\"22.00\"},\"on_sale\":null,\"tax_group\":\"2\",\"stock_status\":\"1\",\"requires_shipping\":\"1\",\"weight\":\"250\",\"width\":\"100\",\"height\":\"250\",\"depth\":\"100\",\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(24,'Club running vest','VEST1-MT-M',NULL,100,1,'Men\'s t-shirt, Medium',3,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(25,'Club running vest','VEST1-MT-L',NULL,100,1,'Men\'s t-shirt, Large',4,0,0,'{\"price\":{\"47\":\"20.00\",\"142\":\"30.00\"},\"sale_price\":{\"47\":\"16.50\",\"142\":\"25.00\"},\"trade_price\":{\"47\":\"14.00\",\"142\":\"22.00\"},\"on_sale\":null,\"tax_group\":\"2\",\"stock_status\":\"1\",\"requires_shipping\":\"1\",\"weight\":\"250\",\"width\":\"100\",\"height\":\"250\",\"depth\":\"100\",\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(26,'Club running vest','VEST1-MT-XL',NULL,100,1,'Men\'s t-shirt, Extra Large',5,0,0,'{\"price\":{\"47\":\"20.00\",\"142\":\"30.00\"},\"sale_price\":{\"47\":\"16.50\",\"142\":\"25.00\"},\"trade_price\":{\"47\":\"14.00\",\"142\":\"22.00\"},\"on_sale\":null,\"tax_group\":\"2\",\"stock_status\":\"1\",\"requires_shipping\":\"1\",\"weight\":\"250\",\"width\":\"100\",\"height\":\"250\",\"depth\":\"100\",\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(27,'Club running vest','VEST1-MV-XS',NULL,100,1,'Men\'s vest, Extra Small',6,0,0,'{\"price\":{\"47\":\"20.00\",\"142\":\"30.00\"},\"sale_price\":{\"47\":\"16.50\",\"142\":\"25.00\"},\"trade_price\":{\"47\":\"14.00\",\"142\":\"22.00\"},\"on_sale\":null,\"tax_group\":\"2\",\"stock_status\":\"1\",\"requires_shipping\":\"1\",\"weight\":\"250\",\"width\":\"100\",\"height\":\"250\",\"depth\":\"100\",\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(28,'Club running vest','VEST1-MV-S',NULL,100,1,'Men\'s vest, Small',7,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(29,'Club running vest','VEST1-MV-M',NULL,100,1,'Men\'s vest, Medium',8,0,0,'{\"price\":{\"47\":\"20.00\",\"142\":\"30.00\"},\"sale_price\":{\"47\":\"16.50\",\"142\":\"25.00\"},\"trade_price\":{\"47\":\"14.00\",\"142\":\"22.00\"},\"on_sale\":null,\"tax_group\":\"2\",\"stock_status\":\"1\",\"requires_shipping\":\"1\",\"weight\":\"250\",\"width\":\"100\",\"height\":\"250\",\"depth\":\"100\",\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(30,'Club running vest','VEST1-MV-L',NULL,100,1,'Men\'s vest, Large',9,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(31,'Club running vest','VEST1-MV-XL',NULL,100,1,'Men\'s vest, Extra Large',10,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(32,'Club running vest','VEST1-WT-XS',NULL,100,1,'Women\'s t-shirt, Extra Small',11,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(33,'Club running vest','VEST1-WT-S',NULL,100,1,'Women\'s t-shirt, Small',12,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(34,'Club running vest','VEST1-WT-M',NULL,100,1,'Women\'s t-shirt, Medium',13,0,0,'{\"price\":{\"47\":\"20.00\",\"142\":\"30.00\"},\"sale_price\":{\"47\":\"16.50\",\"142\":\"25.00\"},\"trade_price\":{\"47\":\"14.00\",\"142\":\"22.00\"},\"on_sale\":null,\"tax_group\":\"2\",\"stock_status\":\"1\",\"requires_shipping\":\"1\",\"weight\":\"250\",\"width\":\"100\",\"height\":\"250\",\"depth\":\"100\",\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(35,'Club running vest','VEST1-WT-L',NULL,100,1,'Women\'s t-shirt, Large',14,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(36,'Club running vest','VEST1-WT-XL',NULL,100,1,'Women\'s t-shirt, Extra Large',15,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(37,'Club running vest','VEST1-WV-XS',NULL,100,1,'Women\'s vest, Extra Small',16,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(38,'Club running vest','VEST1-WV-S',NULL,100,1,'Women\'s vest, Small',17,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(39,'Club running vest','VEST1-WV-M',NULL,100,1,'Women\'s vest, Medium',18,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(40,'Club running vest','VEST1-WV-L',NULL,100,1,'Women\'s vest, Large',19,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(41,'Club running vest','VEST1-WV-XL',NULL,100,1,'Women\'s vest, Extra Large',20,0,0,'{\"stock_location\":\"0\"}','product.html','2016-04-01 14:57:43','2016-04-09 15:55:13',NULL),(42,'Annual Membership','MEMBER1','annual-membership',0,NULL,NULL,1,0,0,'{\"description\":{\"_flang\":\"markdown\",\"raw\":\"If you run with Nest we ask you to sign up and become a member. The small annual fee helps cover our costs such as window cleaning and big gold chains.\",\"processed\":\"<p>If you run with Nest we ask you to sign up and become a member. The small annual fee helps cover our costs such as window cleaning and big gold chains.<\\/p>\"},\"image\":{\"assetID\":\"29\",\"title\":\"Img0043\",\"_default\":\"\\/perch\\/resources\\/img0043.jpg\",\"bucket\":\"default\",\"path\":\"img0043.jpg\",\"size\":304542,\"w\":1024,\"h\":683,\"mime\":\"image\\/jpeg\",\"sizes\":{\"thumb\":{\"w\":\"150\",\"h\":\"100\",\"target_w\":150,\"target_h\":150,\"density\":2,\"path\":\"img0043-thumb.jpg\",\"size\":7288,\"mime\":\"\",\"assetID\":\"30\"},\"w800hc0\":{\"w\":\"800\",\"h\":\"533\",\"target_w\":\"800\",\"target_h\":false,\"crop\":false,\"density\":\"1\",\"path\":\"img0043-w800.jpg\",\"size\":117982,\"mime\":\"\",\"assetID\":\"93\"},\"w80h80c1@1.6x\":{\"w\":80,\"h\":80,\"target_w\":\"80\",\"target_h\":\"80\",\"crop\":\"true\",\"density\":\"1.6\",\"path\":\"img0043-w80h80@1.6x.jpg\",\"size\":8008,\"mime\":\"image\\/jpeg\"},\"w600h600c1@1.6x\":{\"w\":600,\"h\":600,\"target_w\":\"600\",\"target_h\":\"600\",\"crop\":\"true\",\"density\":\"1.6\",\"path\":\"img0043-w600h600@1.6x.jpg\",\"size\":207287,\"mime\":\"image\\/jpeg\"}}},\"slug\":\"annual-membership\",\"status\":\"1\",\"brand\":\"1\",\"category\":[\"4\"],\"catalog_only\":\"0\",\"price\":{\"47\":\"15.00\",\"142\":\"20.00\"},\"sale_price\":{\"47\":\"15.00\",\"142\":\"20.00\"},\"trade_price\":{\"47\":\"15.00\",\"142\":\"20.00\"},\"on_sale\":null,\"tax_group\":\"3\",\"stock_status\":\"0\",\"stock_location\":\"0\",\"max_in_cart\":null,\"requires_shipping\":\"0\",\"weight\":null,\"width\":null,\"height\":null,\"depth\":null}','product.html','2016-04-08 12:26:57','2016-04-09 14:27:38',NULL),(43,'Club Anthem','ANTHEM1','club-anthem',0,NULL,NULL,1,0,0,'{\"description\":{\"_flang\":\"markdown\",\"raw\":\"Enjoy this high quality MP3 recording of our club anthem in the comfort of your own home. As performed by our amazing brass ensemble, The Nest Tooters.\",\"processed\":\"<p>Enjoy this high quality MP3 recording of our club anthem in the comfort of your own home. As performed by our amazing brass ensemble, The Nest Tooters.<\\/p>\"},\"image\":{\"assetID\":\"106\",\"title\":\"Nestanthem\",\"_default\":\"\\/perch\\/resources\\/nestanthem.jpg\",\"bucket\":\"default\",\"path\":\"nestanthem.jpg\",\"size\":134406,\"w\":600,\"h\":600,\"mime\":\"image\\/jpeg\",\"sizes\":{\"thumb\":{\"w\":\"150\",\"h\":\"150\",\"target_w\":150,\"target_h\":150,\"density\":2,\"path\":\"nestanthem-thumb@2x.jpg\",\"size\":17350,\"mime\":\"\",\"assetID\":\"107\"},\"w800hc0\":{\"w\":600,\"h\":600,\"target_w\":\"800\",\"target_h\":false,\"crop\":false,\"density\":\"1\",\"path\":\"nestanthem-w800.jpg\",\"size\":134406,\"mime\":\"\"},\"w80h80c1@1.6x\":{\"w\":80,\"h\":80,\"target_w\":\"80\",\"target_h\":\"80\",\"crop\":\"true\",\"density\":\"1.6\",\"path\":\"nestanthem-w80h80@1.6x.jpg\",\"size\":5875,\"mime\":\"image\\/jpeg\"},\"w600h600c1@1.6x\":{\"w\":600,\"h\":600,\"target_w\":\"600\",\"target_h\":\"600\",\"crop\":\"true\",\"density\":\"1.6\",\"path\":\"nestanthem-w600h600@1.6x.jpg\",\"size\":134406,\"mime\":\"\"}}},\"slug\":\"club-anthem\",\"status\":\"1\",\"brand\":\"1\",\"category\":[\"6\"],\"catalog_only\":\"0\",\"price\":{\"47\":\"3\",\"142\":\"5\"},\"sale_price\":{\"47\":\"2\",\"142\":\"4\"},\"trade_price\":{\"47\":\"2\",\"142\":\"4\"},\"on_sale\":null,\"tax_group\":\"4\",\"stock_status\":\"0\",\"stock_location\":\"0\",\"max_in_cart\":\"1\",\"requires_shipping\":\"0\",\"weight\":null,\"width\":null,\"height\":null,\"depth\":null}','product.html','2016-04-09 11:06:58','2016-04-09 14:27:38',NULL);
/*!40000 ALTER TABLE `perch2_shop_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_promotions`
--

DROP TABLE IF EXISTS `perch2_shop_promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_promotions` (
  `promoID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `promoTitle` varchar(255) NOT NULL DEFAULT '',
  `promoDynamicFields` mediumtext NOT NULL,
  `promoFrom` datetime DEFAULT NULL,
  `promoTo` datetime DEFAULT NULL,
  `promoActive` tinyint(1) DEFAULT '1',
  `promoOrder` int(10) unsigned NOT NULL DEFAULT '1',
  `promoCreated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `promoUpdated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `promoDeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`promoID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_promotions`
--

LOCK TABLES `perch2_shop_promotions` WRITE;
/*!40000 ALTER TABLE `perch2_shop_promotions` DISABLE KEYS */;
INSERT INTO `perch2_shop_promotions` VALUES (1,'10% off','{\"title\":\"10% off\",\"description\":{\"_flang\":\"markdown\",\"raw\":\"Save 10% with this special coupon deal!\",\"processed\":\"<p>Save 10% with this special coupon deal!<\\/p>\"},\"from\":\"2016-01-01 00:00:00\",\"to\":\"2026-12-31 23:59:00\",\"active\":\"1\",\"action\":\"discount_by_percent\",\"discount_code\":\"SAVE10\",\"amount_percent\":\"10\",\"amount\":{\"47\":\"\"},\"trigger_value\":{\"47\":\"\"},\"max_discount\":{\"47\":\"\"},\"max_uses\":null,\"customer_uses\":null,\"terminating\":\"0\",\"persistent\":\"0\",\"priority\":\"1\",\"apply_to_shipping\":\"0\",\"shipping_methods\":null}','2016-01-01 00:00:00','2026-12-31 23:59:00',1,1,'2016-04-07 10:18:40','2016-04-07 11:18:40',NULL);
/*!40000 ALTER TABLE `perch2_shop_promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_search`
--

DROP TABLE IF EXISTS `perch2_shop_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_search` (
  `searchID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemKey` int(10) unsigned NOT NULL,
  `itemType` enum('product','brand') DEFAULT 'product',
  `searchBody` text,
  PRIMARY KEY (`searchID`),
  KEY `itemKey` (`itemKey`,`itemType`),
  FULLTEXT KEY `idx_search` (`searchBody`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_search`
--

LOCK TABLES `perch2_shop_search` WRITE;
/*!40000 ALTER TABLE `perch2_shop_search` DISABLE KEYS */;
INSERT INTO `perch2_shop_search` VALUES (4,2,'product',' VEST1-MT-XS     2 1 100 1 250 100 250 100 '),(5,3,'product',' VEST1-MT-S     2 1 100 1 250 100 250 100 '),(28,1,'product',' VEST1 Club running vest Our exclusive club vest for wearing to races, or to the races. Available in t-shirt or vest cut, for men and women alike.  club running vest1 1 1 Club kit 0     2 1 100 0  1 250 100 250 100  '),(12,42,'product',' MEMBER1 Annual Membership If you run with Nest we ask you to sign up and become a member. The small annual fee helps cover our costs such as window cleaning and big gold chains.  annual membership 1 1 Memberships 0     3 0  0  0      '),(20,43,'product',' ANTHEM1 Club Anthem Enjoy this high quality MP3 recording of our club anthem in the comfort of your own home. As performed by our amazing brass ensemble, The Nest Tooters.  club anthem 1 1 Misc 0     4 0  0 1 0      '),(21,23,'product',' VEST1-MT-S     2 1 100 1 250 100 250 100 '),(22,25,'product',' VEST1-MT-L     2 1 100 1 250 100 250 100 '),(23,26,'product',' VEST1-MT-XL     2 1 100 1 250 100 250 100 '),(24,27,'product',' VEST1-MV-XS     2 1 100 1 250 100 250 100 '),(25,29,'product',' VEST1-MV-M     2 1 100 1 250 100 250 100 '),(26,34,'product',' VEST1-WT-M     2 1 100 1 250 100 250 100 ');
/*!40000 ALTER TABLE `perch2_shop_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_shipping_zone_countries`
--

DROP TABLE IF EXISTS `perch2_shop_shipping_zone_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_shipping_zone_countries` (
  `zcID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zoneID` int(10) unsigned NOT NULL,
  `countryID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`zcID`),
  KEY `idx_country` (`countryID`),
  KEY `idx_zone` (`zoneID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_shipping_zone_countries`
--

LOCK TABLES `perch2_shop_shipping_zone_countries` WRITE;
/*!40000 ALTER TABLE `perch2_shop_shipping_zone_countries` DISABLE KEYS */;
INSERT INTO `perch2_shop_shipping_zone_countries` VALUES (1,1,236),(2,2,14),(3,2,21),(4,2,34),(5,2,54),(6,2,57),(7,2,58),(8,2,59),(9,2,69),(10,2,74),(11,2,75),(12,2,82),(13,2,85),(14,2,99),(15,2,105),(16,2,108),(17,2,120),(18,2,126),(19,2,127),(20,2,135),(21,2,155),(22,2,176),(23,2,177),(24,2,180),(25,2,203),(26,2,204),(27,2,212),(28,2,217);
/*!40000 ALTER TABLE `perch2_shop_shipping_zone_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_shipping_zones`
--

DROP TABLE IF EXISTS `perch2_shop_shipping_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_shipping_zones` (
  `zoneID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zoneTitle` char(255) NOT NULL DEFAULT '',
  `zoneSlug` char(255) DEFAULT NULL,
  `zoneIsDefault` tinyint(1) unsigned DEFAULT '0',
  `zoneActive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `zoneDynamicFields` mediumtext,
  `zoneCreated` datetime DEFAULT NULL,
  `zoneUpdated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `zoneDeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`zoneID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_shipping_zones`
--

LOCK TABLES `perch2_shop_shipping_zones` WRITE;
/*!40000 ALTER TABLE `perch2_shop_shipping_zones` DISABLE KEYS */;
INSERT INTO `perch2_shop_shipping_zones` VALUES (1,'United Kingdom','united-kingdom',0,1,'{\"title\":\"United Kingdom\",\"slug\":\"united-kingdom\",\"description\":{\"_flang\":\"markdown\",\"raw\":\"\",\"processed\":\"\"},\"status\":\"1\",\"countries\":[\"236\"]}','2016-04-01 13:34:11','2016-04-01 13:36:59',NULL),(2,'Europe','europe',0,1,'{\"title\":\"Europe\",\"slug\":\"europe\",\"description\":{\"_flang\":\"markdown\",\"raw\":\"\",\"processed\":\"\"},\"status\":\"1\",\"countries\":[\"14\",\"21\",\"34\",\"54\",\"57\",\"58\",\"59\",\"69\",\"74\",\"75\",\"82\",\"85\",\"99\",\"105\",\"108\",\"120\",\"126\",\"127\",\"135\",\"155\",\"176\",\"177\",\"180\",\"203\",\"204\",\"212\",\"217\"]}','2016-04-01 13:36:32','2016-04-01 13:36:59',NULL),(3,'Rest of world','rest-of-world',1,1,'{\"title\":\"Rest of world\",\"slug\":\"rest-of-world\",\"description\":{\"_flang\":\"markdown\",\"raw\":\"\",\"processed\":\"\"},\"status\":\"1\",\"countries\":null}','2016-04-01 13:36:59','2016-04-01 13:36:59',NULL);
/*!40000 ALTER TABLE `perch2_shop_shipping_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_shippings`
--

DROP TABLE IF EXISTS `perch2_shop_shippings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_shippings` (
  `shippingID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shippingTitle` varchar(255) NOT NULL DEFAULT '',
  `shippingSlug` varchar(255) NOT NULL DEFAULT '',
  `shippingDynamicFields` mediumtext NOT NULL,
  `shippingCreated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `shippingUpdated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `shippingDeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`shippingID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_shippings`
--

LOCK TABLES `perch2_shop_shippings` WRITE;
/*!40000 ALTER TABLE `perch2_shop_shippings` DISABLE KEYS */;
INSERT INTO `perch2_shop_shippings` VALUES (1,'Local collection','local-collection','{\"title\":\"Local collection\",\"slug\":\"local-collection\",\"company\":\"Quartermaster Dave\",\"description\":{\"_flang\":\"markdown\",\"raw\":\"Pick your orders up from Quartermaster Dave on a club night.\",\"processed\":\"<p>Pick your orders up from Quartermaster Dave on a club night.<\\/p>\"},\"price\":{\"zones\":[\"2\",\"3\",\"1\"],\"z2\":{\"47\":\"0.00\",\"142\":\"0.00\"},\"z3\":{\"47\":\"0.00\",\"142\":\"0.00\"},\"z1\":{\"47\":\"0.00\",\"142\":\"0.00\"}},\"tax_group\":\"1\",\"price_max\":{\"47\":\"\",\"142\":\"\"},\"price_min\":{\"47\":\"0.00\",\"142\":\"0.00\"},\"weight_min\":null,\"weight_max\":null,\"width_max\":null,\"height_max\":null,\"depth_max\":null,\"status\":\"1\"}','2016-04-01 13:42:25','2016-04-07 14:42:56',NULL),(2,'Standard shipping','standard','{\"title\":\"Standard shipping\",\"slug\":\"standard\",\"company\":\"Royal Mail\",\"description\":{\"_flang\":\"markdown\",\"raw\":\"Standard shipping by Postman Pat.\",\"processed\":\"<p>Standard shipping by Postman Pat.<\\/p>\"},\"price\":{\"zones\":[\"2\",\"3\",\"1\"],\"z2\":{\"47\":\"10.00\",\"142\":\"15.00\"},\"z3\":{\"47\":\"20.00\",\"142\":\"30.00\"},\"z1\":{\"47\":\"5.00\",\"142\":\"10.00\"}},\"tax_group\":\"1\",\"price_max\":{\"47\":\"\",\"142\":\"\"},\"price_min\":{\"47\":\"0.00\",\"142\":\"0.00\"},\"weight_min\":null,\"weight_max\":null,\"width_max\":null,\"height_max\":null,\"depth_max\":null,\"status\":\"1\"}','2016-04-01 13:43:09','2016-04-07 14:47:14',NULL),(3,'Courier','courier','{\"title\":\"Courier\",\"slug\":\"courier\",\"company\":\"FedEx\",\"description\":{\"_flang\":\"markdown\",\"raw\":\"48 hour delivery from FedEx\",\"processed\":\"<p>48 hour delivery from FedEx<\\/p>\"},\"price\":{\"zones\":[\"2\",\"3\",\"1\"],\"z2\":{\"47\":\"20.00\",\"142\":\"30.00\"},\"z3\":{\"47\":\"30.00\",\"142\":\"45.00\"},\"z1\":{\"47\":\"10.00\",\"142\":\"15.00\"}},\"tax_group\":\"1\",\"price_max\":{\"47\":\"\",\"142\":\"\"},\"price_min\":{\"47\":\"10.00\",\"142\":\"0.00\"},\"weight_min\":null,\"weight_max\":null,\"width_max\":null,\"height_max\":null,\"depth_max\":null,\"status\":\"1\"}','2016-04-01 13:44:05','2016-04-07 14:46:34',NULL);
/*!40000 ALTER TABLE `perch2_shop_shippings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_tax_exhibits`
--

DROP TABLE IF EXISTS `perch2_shop_tax_exhibits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_tax_exhibits` (
  `exhibitID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderID` int(10) unsigned NOT NULL,
  `exhibitType` enum('BILL_ADDRESS','SHIP_ADDRESS','IP_ADDRESS','CARD_ADDRESS','MANUAL') NOT NULL DEFAULT 'IP_ADDRESS',
  `exhibitDetail` char(255) NOT NULL DEFAULT '',
  `exhibitSource` char(255) NOT NULL DEFAULT '',
  `locationID` int(10) unsigned DEFAULT NULL,
  `countryID` int(10) unsigned DEFAULT NULL,
  `exhibitDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`exhibitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_tax_exhibits`
--

LOCK TABLES `perch2_shop_tax_exhibits` WRITE;
/*!40000 ALTER TABLE `perch2_shop_tax_exhibits` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_shop_tax_exhibits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_tax_group_rates`
--

DROP TABLE IF EXISTS `perch2_shop_tax_group_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_tax_group_rates` (
  `grouprateID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locationID` int(10) unsigned NOT NULL,
  `groupID` int(10) unsigned NOT NULL,
  `rateID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`grouprateID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_tax_group_rates`
--

LOCK TABLES `perch2_shop_tax_group_rates` WRITE;
/*!40000 ALTER TABLE `perch2_shop_tax_group_rates` DISABLE KEYS */;
INSERT INTO `perch2_shop_tax_group_rates` VALUES (2,1,1,1),(3,2,1,4),(4,1,2,1),(5,2,2,4),(6,1,3,1),(7,2,3,4),(8,1,4,1),(9,2,4,4);
/*!40000 ALTER TABLE `perch2_shop_tax_group_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_tax_groups`
--

DROP TABLE IF EXISTS `perch2_shop_tax_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_tax_groups` (
  `groupID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupTitle` char(255) NOT NULL DEFAULT '',
  `groupSlug` char(255) DEFAULT NULL,
  `groupTaxRate` enum('buyer','seller') NOT NULL DEFAULT 'seller',
  `groupDynamicFields` mediumtext,
  `groupCreated` datetime DEFAULT NULL,
  `groupUpdated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `groupDeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_tax_groups`
--

LOCK TABLES `perch2_shop_tax_groups` WRITE;
/*!40000 ALTER TABLE `perch2_shop_tax_groups` DISABLE KEYS */;
INSERT INTO `perch2_shop_tax_groups` VALUES (1,'Shipping','shipping','seller','[]','2016-04-01 13:32:22',NULL,NULL),(2,'Kit','kit','seller','[]','2016-04-01 13:33:03',NULL,NULL),(3,'Memberships','memberships','seller','[]','2016-04-08 12:27:13',NULL,NULL),(4,'Downloads','downloads','buyer','[]','2016-04-09 10:35:11',NULL,NULL);
/*!40000 ALTER TABLE `perch2_shop_tax_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_tax_locations`
--

DROP TABLE IF EXISTS `perch2_shop_tax_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_tax_locations` (
  `locationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locationTitle` char(255) NOT NULL,
  `countryID` int(10) unsigned DEFAULT NULL,
  `regionID` int(10) unsigned DEFAULT NULL,
  `locationIsHome` tinyint(1) unsigned DEFAULT '0',
  `locationIsDefault` tinyint(1) unsigned DEFAULT '0',
  `locationTaxRate` decimal(4,2) unsigned NOT NULL DEFAULT '0.00',
  `locationTaxRateReduced` decimal(4,2) unsigned NOT NULL DEFAULT '0.00',
  `locationDynamicFields` mediumtext,
  `locationCreated` datetime DEFAULT NULL,
  `locationUpdated` datetime DEFAULT NULL,
  `locationDeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_tax_locations`
--

LOCK TABLES `perch2_shop_tax_locations` WRITE;
/*!40000 ALTER TABLE `perch2_shop_tax_locations` DISABLE KEYS */;
INSERT INTO `perch2_shop_tax_locations` VALUES (1,'United Kingdom',236,NULL,1,0,0.00,0.00,'[]','2016-04-01 13:32:02',NULL,NULL),(2,'Rest of world',NULL,NULL,NULL,1,0.00,0.00,'[]','2016-04-01 13:32:41',NULL,NULL);
/*!40000 ALTER TABLE `perch2_shop_tax_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_tax_rates`
--

DROP TABLE IF EXISTS `perch2_shop_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_tax_rates` (
  `rateID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locationID` int(10) unsigned NOT NULL,
  `rateTitle` char(128) NOT NULL DEFAULT 'Standard',
  `rateValue` decimal(4,2) NOT NULL DEFAULT '0.00',
  `rateDynamicFields` text,
  `rateCreated` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `rateUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rateDeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`rateID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_tax_rates`
--

LOCK TABLES `perch2_shop_tax_rates` WRITE;
/*!40000 ALTER TABLE `perch2_shop_tax_rates` DISABLE KEYS */;
INSERT INTO `perch2_shop_tax_rates` VALUES (1,1,'Standard',20.00,'{}','2015-01-01 00:00:00','2016-04-01 21:32:02',NULL),(2,1,'Reduced',5.00,'{}','2015-01-01 00:00:00','2016-04-01 21:32:02',NULL),(3,1,'Exempt',0.00,'{}','2015-01-01 00:00:00','2016-04-01 21:32:02',NULL),(4,2,'Zero',0.00,'{}','2015-01-01 00:00:00','2016-04-01 21:32:41',NULL);
/*!40000 ALTER TABLE `perch2_shop_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_shop_variants`
--

DROP TABLE IF EXISTS `perch2_shop_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_shop_variants` (
  `productID` int(10) unsigned NOT NULL,
  `optionID` int(10) unsigned NOT NULL,
  `valueID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`productID`,`optionID`,`valueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_shop_variants`
--

LOCK TABLES `perch2_shop_variants` WRITE;
/*!40000 ALTER TABLE `perch2_shop_variants` DISABLE KEYS */;
INSERT INTO `perch2_shop_variants` VALUES (2,1,1),(2,2,6),(3,1,2),(3,2,6),(4,1,3),(4,2,6),(5,1,4),(5,2,6),(6,1,5),(6,2,6),(7,1,1),(7,2,7),(8,1,2),(8,2,7),(9,1,3),(9,2,7),(10,1,4),(10,2,7),(11,1,5),(11,2,7),(12,1,1),(12,2,8),(13,1,2),(13,2,8),(14,1,3),(14,2,8),(15,1,4),(15,2,8),(16,1,5),(16,2,8),(17,1,1),(17,2,9),(18,1,2),(18,2,9),(19,1,3),(19,2,9),(20,1,4),(20,2,9),(21,1,5),(21,2,9),(22,1,1),(22,2,6),(23,1,2),(23,2,6),(24,1,3),(24,2,6),(25,1,4),(25,2,6),(26,1,5),(26,2,6),(27,1,1),(27,2,7),(28,1,2),(28,2,7),(29,1,3),(29,2,7),(30,1,4),(30,2,7),(31,1,5),(31,2,7),(32,1,1),(32,2,8),(33,1,2),(33,2,8),(34,1,3),(34,2,8),(35,1,4),(35,2,8),(36,1,5),(36,2,8),(37,1,1),(37,2,9),(38,1,2),(38,2,9),(39,1,3),(39,2,9),(40,1,4),(40,2,9),(41,1,5),(41,2,9);
/*!40000 ALTER TABLE `perch2_shop_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_user_passwords`
--

DROP TABLE IF EXISTS `perch2_user_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_user_passwords` (
  `passwordID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  `userPassword` varchar(255) NOT NULL DEFAULT '',
  `passwordLastUsed` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`passwordID`),
  KEY `idx_user` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_user_passwords`
--

LOCK TABLES `perch2_user_passwords` WRITE;
/*!40000 ALTER TABLE `perch2_user_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_user_passwords` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_user_privileges`
--

LOCK TABLES `perch2_user_privileges` WRITE;
/*!40000 ALTER TABLE `perch2_user_privileges` DISABLE KEYS */;
INSERT INTO `perch2_user_privileges` VALUES (1,'perch.login','Log in',1),(2,'perch.settings','Change settings',2),(3,'perch.users.manage','Manage users',3),(4,'perch.updatenotices','View update notices',4),(5,'content.regions.delete','Delete regions',1),(6,'content.regions.options','Edit region options',2),(7,'content.pages.edit','Edit page details',1),(8,'content.pages.reorder','Reorder pages',2),(9,'content.pages.create','Add new pages',3),(10,'content.pages.configure','Configure page settings',5),(11,'content.pages.delete','Delete pages',4),(12,'content.templates.delete','Delete master pages',6),(13,'content.navgroups.configure','Configure navigation groups',7),(14,'content.navgroups.create','Create navigation groups',8),(15,'content.navgroups.delete','Delete navigation groups',9),(16,'perch_events','Access events',1),(17,'perch_events.categories.manage','Manage categories',1),(18,'perch_blog','Access the blog',1),(19,'perch_blog.post.create','Create posts',1),(20,'perch_blog.post.delete','Delete posts',1),(21,'perch_blog.post.publish','Publish posts',1),(22,'perch_blog.comments.moderate','Moderate comments',1),(23,'perch_blog.comments.enable','Enable comments on a post',1),(24,'perch_blog.categories.manage','Manage categories',1),(25,'perch_blog.import','Import data',1),(26,'perch_blog.authors.manage','Manage authors',1),(27,'content.pages.republish','Republish pages',12),(28,'perch_gallery','Access the gallery',1),(29,'perch_gallery.album.create','Create albums',1),(30,'perch_gallery.image.upload','Upload images',1),(31,'perch_forms','Access forms',1),(32,'perch_forms.configure','Configure forms',1),(33,'perch_forms.delete','Delete forms',1),(34,'perch_shop','Access shop',1),(35,'perch_shop.categories.manage','Manage categories',1),(36,'perch_members','Manage members',1),(37,'content.pages.create.toplevel','Add new top-level pages',3),(38,'content.pages.delete.own','Delete pages they created themselves',4),(39,'content.templates.configure','Configure master pages',6),(40,'content.pages.attributes','Edit page titles and attributes',6),(41,'assets.create','Upload assets',1),(42,'perch_blog.sections.manage','Manage sections',1),(43,'categories.create','Create new categories',1),(44,'categories.delete','Delete categories',2),(45,'categories.manage','Manage categories',3),(46,'categories.sets.create','Create category sets',4),(47,'categories.sets.delete','Delete category sets',5),(48,'assets.manage','Manage assets',2),(49,'content.regions.revert','Roll back regions',3),(50,'perch_blog.blogs.manage','Manage blogs',1);
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
  `userPasswordToken` char(255) NOT NULL DEFAULT 'expired',
  `userPasswordTokenExpires` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `userLastFailedLogin` datetime DEFAULT NULL,
  `userFailedLoginAttempts` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`),
  KEY `idx_enabled` (`userEnabled`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_users`
--

LOCK TABLES `perch2_users` WRITE;
/*!40000 ALTER TABLE `perch2_users` DISABLE KEYS */;
INSERT INTO `perch2_users` VALUES (1,'REPLACE_username','$P$B20jI.PtwnmvUnYE19qC3iedFvrKZt.','2013-04-30 13:11:53','2016-04-10 05:58:32','2016-04-10 06:58:07','REPLACE_firstname','REPLACE_lastname','REPLACE_hello@grabaperch.com',1,'fa57628bc6c0e673a158940ec67efa96',2,1,'expired','2015-01-01 00:00:00',NULL,0);
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

-- Dump completed on 2016-04-09 23:00:30
