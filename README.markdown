# Euruko

Minimal conference handling app that allows to:

* register users interested in Euruko
* send notifications to registered users
* register speakers
* pay for participation
* issue invoices

## Installation

Make sure you have RubyGems 1.3.5 installed and that you have http://gemcutter.org/ in your gem sources.

To run the application:

    rake gems:install
    rake db:migrate
    ./script/server

To run tests:

    RAILS_ENV=cucumber rake gems:install
    rake db:migrate
    rake spec cucumber

