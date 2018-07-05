# Simple Rails App for checking Minimum Skill

This is a simple Rails App to see whether candidates have the minimum skills to participate in the development of Patentfield.

# How to run (Docker on Windows)

1. install git for windows  
https://gitforwindows.org/

2. set up SSH for GitHub  
see https://qiita.com/shizuma/items/2b2f873a0034839e47ce  
(We can use git bash for command line on windows)

3. install Docker for windows  
https://store.docker.com/editions/community/docker-ce-desktop-windows 
4. set to share local drive for docker process  
Task tray -> Docker icon -> Settings -> Shared Drives -> check C -> Apply

5. clone repository  
```
git clone git@github.com:patentfield/rails-minimum-skill-check
```

6. build docker image  
```
cd rails-minimum-skill-check
docker-compose build
```

7. run docker containters  
```
docker-compose up -d
```

8. create database  
```
winpty docker exec -ti railsminimumskillcheck_web_1 bash
bundle exec rake db:create
bundle exec rake db:migrate
```

9. access to http://localhost:3000 with your browser


# How to run (Mac)

1. install postgresql

2. create database user 'devuser'

3. install ruby 2.4.4 (recommend using rbenv)

4. install gems via bundler

```
gem install bundler
bundle install --path vendor/bundle
```

5. create database

```
bundle exec rake db:create
bundle exec rake db:migrate
```

6. run rails server

```
bundle exec rails s -b 0.0.0.0
```

7. open http://localhost:3000/peds with your browser

8. confirm data retrieved by PEDS API of USPTO
   PEDS: https://ped.uspto.gov/peds/

# Licence

© 2018 Patentfield. All Rights Reserved.

Patentfield has a right to change the license including contributed patches.
