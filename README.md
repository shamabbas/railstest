== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    ruby '2.2.2'
* System dependencies
    'rails', '4.2.5.1'
* Configuration

# No database was mentioned in the quiz so used sqlite
* Database creation
    rake db:create
* Database initialization
    rake db:migrate


* Model specs have been implemented. To run specs simply use:
 bundle exec rspec spec/models

* Services (job queues, cache servers, search engines, etc.) NO service or jobs

* Deployment instructions
rails s

I have used GRAPE API for api development. Could have used simple RESTApi but prefer to use GRAPE as for large scale projects
GRAPE has proper documentation / apidoc page available which do have all URLs and their parameters with their types mentioned so
there must be 0% chances of having API issues regarding URLs or parameter.
