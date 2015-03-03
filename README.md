Debian / Wheezy Installation Deployment
==============================================
Using Phusion passenger (aka mod_rails), Apache2

Preconditions
-----------------------------

Set up all Debian packets

<pre>apt-get install build-essential ruby1.9.3 ruby-1.9.3-dev libmysqlclient-dev mysql-server git apache2
gem install rake -v=0.8.4 --no-ri --no-rdoc
gem install rails -v=2.3.18 --no-ri --no-rdoc
gem install passenger --no-ri --no-rdoc</pre>


Create Database
---------------------

Create a database (eg reservierung) and a user. This is not covered here


Install application
------------------

Install passenger: <code>passenger-install-apache2-module # ...</code>

Since passenger su's to the owner of the directoy, creating a new user is recommended:

<code>useradd -s /bin/bash reservireung && chown /srv/reservierung</code>

Afterarwds, su to that user and checkout the source-tree<pre>
su - reservierung
cd /srv
git clone https://github.com/yanosz/thw-reservierung.git
cd /srv/thw-reservierung
cp config/database.yml.template database.yml
# Terminate su shell - back to root
</pre>

<pre>
# Make sure, that you're root again
cd /srv/thw-reservierung
rake gems:install
</pre>


Configure application
------------------------

1. Edit <code>/srv/thw-reservierung/config/database.yml</code> according to your needs
2. Populate database - if not empty (eg. <pre>
su - reservierung
cd /srv/thw-reservierung
export RAILS_ENV=production
rake db:migrate
</pre>
3. Configure Apache. Example<pre>
# These have been added:
    Alias /reservierung /srv/thw-reservierung/public
    <Location /reservierung>
        PassengerBaseURI /reservierung
        PassengerAppRoot /srv/thw-reservierung
    </Location>
    <Directory /srv/thw-reservierung>
        Allow from all
        Options -MultiViews
        # Uncomment this if you're on Apache >= 2.4:
        #Require all granted
    </Directory>
</pre>
