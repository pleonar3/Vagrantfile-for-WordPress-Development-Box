WordPress Vagrant File
======================

Purpose of this repository is to set up a simple WordPress vm. This has been done mostly for my own education. The provision script sets up a simple LAMP web stack for development use only. The stack will not be secure for web use out of the box.

Prerequisites
-------------
- Install Vagrant and Virtualbox

Installation
------------

- Clone the repository.
- Run 'vagrant up'. It will take a while for the script to run and set things up. Make sure you are within the directory you should have just cloned from git.
- Navigate to 100.0.0.2/wordpress in your browser. Do this after the previous command has completed. 
- Fill out the wordpress installation details. Look at the provision script for database details.
- If it asks you to create the wp config php file, use 'vagrant ssh'. Navigate to /var/www/html/wordpress. Create the file using sudo, and paste in the text it asks you to.
- At this point, things should work appropriately. Make an admin account and a user account. Confirm that different logins have the appropriate access

Moving to Production
--------------------

- If you decide to move to production, you'll need to add additional security settings
- Start by changing apache firewall and running mysql_secure_install
