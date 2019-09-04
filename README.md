# NG Music

## Description

A simple rails application to manage and search a local music information database.

- Connect to a local sql database
- Perform basic queries and updates
- Manage users (non-encrpyted for now)
- Simple Searching Capabilities
- Display Results

## Project Requirements

- Ruby
- Rails Framework
- Web Server
- Database System

Normal Ruby on Rail installation:

- Windows: https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm
- Ubunti: https://gorails.com/setup/ubuntu/18.04

## Other Set Up

- Once everythign, Ruby, Rails and mySql are correctly installed...

```
bundle install
bundle update
```

- Create the user for the application to use and grant necessary permissions

```
CREATE USER 'ng_user'@'localhost' IDENTIFIED BY 'ng';
GRANT ALL PRIVILEGES ON ng_music . * TO 'ng_user'@'localhost';
```

- Create a test user to use in the web app (cannot add user from web app at this time). Alternatively, if you load the sample data use oen of teh sample users.

```
INSERT INTO ng_users(username,password) VALUES ('ng_test','ngt');

```

Create the DB:

```
rake db:create
rake db:schema:load
```

- Add test data in if desired using the provided POJO.

```
<Will do later>
```

## Running Development Server

```
rails server
```
