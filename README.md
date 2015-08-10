= Rateble

rails_rateable is a rails gem providing a rating interface for ActiveRecord models.
It is compitable only with Rails 3 and above. It is released under the MIT license. 


= Features

* Make any of yor model rateable without any change to the existing model
* Users can update previous ratings
* Stores computed score and number of ratings for efficient data access
* Possibility to change range of the ratings (1..5 is default)

= Installation

== Install as gem

Install as a gem:

    $ sudo gem instal rails_rateable

or
	Add below to Gemfile and run bundle install

	gem 'rails_rateable'

After you install rateable, you need to run the generator:

rails generate rails_rateable

The generator will add new migration, so run migration:

rake db:migrate

= Example Usage

Add 'include RailsRateable' to the modal you want to make rateable, then restart your application.

    class Movie < ActiveRecord::Base
      include RailsRateable
    end

Now your model is extended by the Gem, you can rate it (1-#) or calculate the average rating. 


By default max_rating is 5 i,e user can give rating from 1 to 5 . You can override it by passing max_rating parameter
to rails_rateable

In Below example, Comment model is made rateable and max_rating set to 10, so for comment user can provide rating between 1 to 10

    class Comment < ActiveRecord::Base
	  include RailsRateable
      rails_rateable :max_rating => 10
    end


    @movie.rate_it(4, current_user)

    @movie.average_rating          #=> 4.0
    @movie.average_rating_round    #=> 4
    @movie.average_rating_percent  #=> 80
    @movie.rated_by?(current_user) #=> true
    @movie.rating_by(current_user) #=> 4
    @movie.ratings_count          #=> 1

    Movie.find_top_rated           #=> top rated records

    By default 20 top rated result will be returned. Youu can override it by passing numer of record you want.

	Movie.find_top_rated(40) # will return 40 records




CREDIT:
The gem is based on https://github.com/mreinsch/acts_as_rateable. This gem simply enhance it to be compitable with Rails 3 and up
