# Gisle Thorsen's Personal Website
### Tech-Stack
This website is developed using _Rails-5.1.6_ and _Ruby-2.5.0_ with a _PostgreSQL_ database.

### Deployment
Production uses [Heroku](heroku.com) which automatically fetches successful builds from the **Master** branch. 

You can find the hosted website on [www.gislethorsen.com](www.gislethorsen.com). Allow it a few extra seconds to show the page as Heroku puts the server to sleep after some time of inactivity.

### Continous Integration (CI) and Continous Deployment (CD)
**CI** is handled by [TravisCI](travis-ci.org), you have to add it as an app to your Github project and include a `Procfile` and `.travis.yml` in your root project folder.

**CD** is handled directly by Heroku itself, which fetches the data in the Master repository when the data in it is new and if the CI build is successful.

### Testing
The website uses _RSpec_ together with _FactoryBot_ to run tests. To run RSpec tests, simply do one of the following:
```
# Run All Tests
bundle exec rspec

# Specific Folder
bundle exec spec/controllers

# Specific File
bundle exec spec/controllers/pages_controller_spec.rb
```
It is important to remember when adding RSpec to your own project to run `rails generate rspec:install`. Though if you simply follow its README on Github you should be fine.

Resources:
- http://rspec.info/
- https://devhints.io/factory_bot
- https://github.com/rspec/rspec-rails
- https://github.com/thoughtbot/factory_bot_rails
