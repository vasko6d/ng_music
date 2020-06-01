# NG Music

## Description

A simple rails application to manage and search a local music information database.

- Connect to a local sql database
- Perform basic queries and updates
- Manage users (non-encrpyted for now)
- Simple Searching Capabilities
- Display Results

NOTE: This project is no longer maintained except if GitHub sends me any more vulnerability messages.

## Project Requirements

- Ruby
- Rails Framework
- Web Server
- Database System

Normal Ruby on Rail installation:

- Windows: https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm
- Ubunti: https://gorails.com/setup/ubuntu/18.04

## Other Set Up

- Once everything: Ruby, Rails and mySql are correctly installed...

```
bundle install
bundle update
```

- Create the user for the application to use and grant necessary permissions.

```
CREATE USER 'ng_user'@'localhost' IDENTIFIED BY 'ng';
GRANT ALL PRIVILEGES ON ng_music.* TO 'ng_user'@'localhost' IDENTIFIED BY 'ng';
GRANT FILE ON *.* to 'ng_user'@'localhost' IDENTIFIED BY 'ng'; --needed to acces the server side files (not database sepcific so must be *.*)
```

- Create a test user to use in the web app (cannot add user from web app at this time). Alternatively, if you load the sample data use oen of the sample users.

```
INSERT INTO ng_users(username,password) VALUES ('ng_test','ngt');

```

Create the DB:

```
rake db:create
rake db:schema:load
```

## Add test data in if desired using the provided POJO.

**IMPORTANT**: If your mysql has the "--secure-file-priv" option you many need to move the files or disable the option: see https://superuser.com/questions/1088512/how-to-disable-secure-file-priv-mysql-ubuntu.

```
sudo echo "secure_file_priv=\"\"" | sudo tee -a /etc/mysql/mysql.conf.d/mysqld.cnf
service mysql stop
service mysql start
```

I also needed to let mysql have read acces to my svn folder, see: https://stackoverflow.com/questions/4215231/load-data-infile-error-code-13/19511472.

```
[/etc/apparmor.d/usr.sbin.mysqld]
...
#Allow local SVN Read Acces
  /home/david/svn/** r,
...
}
```

and reload AppArmour

```
sudo /etc/init.d/apparmor reload
```

Actually load the test data by compiling the java file and running it (from the ng-music folder). Dont forget since we are using a mysql jdbc we need the mysql-connecter.jar in the classpath.

```
javac ./db/util/ng_music_db_loader.java
java -cp "<path-to-mysql-connector-java-8.0.17.jar>:./db/util" ng_music_db_loader <full-path-to: ng-music>/db/util/ ng_user ng

```

## Running Development Server

```
rails server
```

## To Do (archived)

- Give flash warning if trying to create duplicate not ANGRY RAILS
- SORT RESULTS!!! DOABLE!
- Cryptographically hashed password: Wont have time but bhash gem with salt looks awesome. Would have to run a migration forst too
- Add admin bool column to user table so i can allow admins right to add more users
- Changing Skin seems hard
