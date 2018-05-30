WordPress Vagrant File
======================

Purpose of this repository is to set up a WordPress Development VM. The provision script sets up a simple LAMP web stack. Use ./start_vm.sh for cross-platform support (between WSL and native linux).

Prerequisites
-------------
- Install Vagrant and Virtualbox

Installation
------------

- Clone the repository.
- Navigate to the directory containing the cloned repo.
- Run 'vagrant up'. It will take a while for the script to run.
- Navigate to 100.0.0.2/wordpress in your browser
- Fill out the wordpress installation details. Look at the provision script for database details.
- When it asks you to create the wp config php file, use 'vagrant ssh'. Navigate to /var/www/html/wordpress. Create the file using sudo, and paste in the text it asks you to.
- At this point, things should work appropriately. Make an admin account and a user account. Confirm that different logins have the appropriate access

Moving to Production
--------------------

- If you decide to move to production, you'll need to add additional security settings
- Start by changing apache firewall and running mysql_secure_install
