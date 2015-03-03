Debian / Wheezy Installation instructions using Phusion passenger (aka mod_rails)
==============================================

Preconditions
-----------------------------
Set up all Debian packets

<code>apt-get install build-essential ruby1.9.3 ruby-1.9.3-dev libmysqlclient-dev mysql-server git
gem install rake -v=0.8.4 --no-ri --no-rdoc
gem install rails -v=2.3.18 --no-ri --no-rdoc
gem install passenger --no-ri --no-rdoc</code>

Create Database
---------------------
Create a database (eg reservierung) and a user. This is not part of this manual

Install application
------------------
Since passenger su's to the owner of the directoy, creating a new user is recommended:

<code>useradd -s /bin/bash reservireung && chown /srv/reservierung</code>

<code>
su - reservierung
cd /srv
git clone https://github.com/yanosz/thw-reservierung.git
# Terminate su shell - make sure, that you're root again
</code>

