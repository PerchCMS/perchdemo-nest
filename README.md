Perch Runway Demo: Nest Running Club
====================================

This is the Nest running club demo site, one of the options when you sign up for an online demo. 

The main purpose of this particular site is to demostrate several of the free Perch add-ons. It features Blog, Gallery, Forms, Events, Shop and Members.

It's also a good demonstration of the use of layouts for largely HTML-free pages.

The Nest Running Club site was designed for Perch by Paddy Donnelly @ Lefft.com 

Setup 
-----

To get up and running, you'll need to drop your Runway `perch/core` folder into place, and add each of the add-ons to the `perch/addons` folder. Update the `perch/config.php` file with your own details.

Database
--------

The `sql/nest_demo.sql` file contains the following placeholders for the primary user's details. Replace them out in the SQL before importing it.

* `{firstname}`
* `{lastname}` 
* `{email}` 
* `{username}`
* `{password}`

The password can be an MD5 (use `5f4dcc3b5aa765d61d8327deb882cf99` to log in with 'password'). It will be hashed to something more secure the first time it's used.
