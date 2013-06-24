perchdemo-nest
==============

Nest running club demo site, to demostrate several of the free Perch add-ons.

It's also a good demonstration of the use of layouts for largely HTML-free pages.

Database
--------

The `sql/nest_demo.sql` file contains the following placeholders for the primary user's details. Replace them out in the SQL before importing it.

* `{firstname}`
* `{lastname}` 
* `{email}` 
* `{username}`
* `{password}`

The password can be an MD5 (use `5f4dcc3b5aa765d61d8327deb882cf99` to log in with 'password'). It will be hashed to something more secure the first time it's used.
