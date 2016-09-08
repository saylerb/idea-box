# Idea Cubby

#### One place...for all your ideas. 

[Production Application](https://lit-woodland-67058.herokuapp.com/)

![screenshot](http://i.imgur.com/Bd0rggZ.png)

### Description

This project was an exercise in building a single page CRUD application with JavaScript. It's a
Rails application for the backend database, and uses jQuery and AJAX for the
frontend.  This project was my first experience writing a JavaScript-focused
application with heavy DOM manipulation using jQuery. I wrote it in ES6 and I
also explored using capybara-webkit for testing the JavaScript .

### Usage

* Create new ideas: Add a new idea to the list by using the form in the upper left hand
  corner.

* Change idea quality: Once an Idea is added to the list, use the
  thumbs-up/thumbs-down button to adjust the rating

* Delete ideas: To delete an idea, click the 'X' next to the idea. Careful
  though, that idea is gone forever.

* Edit ideas: To change the content of an idea, click the title or body and start
  editing! Changes will be saved automatically when you click away.

* Search: Start typing in the search box to filter the ideas list.

### Installation

1. `git clone git@github.com:saylerb/idea-box.git`

1. `cd idea-box`

1. `bundle install`

1. `rails db:setup`

1. `rails s`

### Testing

* Run `rspec` to run the test suite. 

### To Do 
 
* Allow idea bodies longer than 100 characters
