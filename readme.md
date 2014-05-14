### Clonagram
[![Code Climate](https://codeclimate.com/github/duboff/clonagram.png)](https://codeclimate.com/github/duboff/clonagram)

## Week 9 Project @ Makers Academy

The goal of this project was to build fully functional Rails app mimicking the functionality of Instagram (though without the fancy filters). Users can upload pictures, add comments and vote on each other's pictures. There is a buy print functionality working in a test mode. Images are stored on the cloud. Voting works in real-time a-la Reddit using Websockets and comments use AJAX.

The app is built using "eat-your-own-dogfood" philosophy where the app itself consumes JSON it generated the same way someone else would use it for an API. There is thus a fully functional take-out API for images.

As with my other apps, the app was built in a TDD way from the start except for some front-end features.

## Stack
* Ruby
* Rails
* PostgreSQL
* Rspec & Capybara
* ERB, SASS, HTML & CSS
* Javascript & Coffeescript
* jQuery & AJAX
* Heroku deployment ([link](http://clonagram.herokuapp.com/))
* Mandrill API
* Devise, Factorygirl, Paperclip, Mailcatcher, jbuilder
* API: Stripe, Amazon S3, Geocoder, Google Maps
* Websockets

# Usage
From the console (after switching to the right folder):

```
$ rails s
```

Or use online on Heroku [here](http://clonagram.herokuapp.com/).

## Screenshot

![Screenshot](/bookmark-manager.png "Sudoku Web Version")



