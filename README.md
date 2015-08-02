= Rateble

rateable is a rails gem providing a rating interface for ActiveRecord models.
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

Now your model is extended by the plugin, you can rate it (1-#) or calculate the average rating.

    @movie.rate_it(4, current_user)

    @movie.average_rating          #=> 4.0
    @movie.average_rating_round    #=> 4
    @movie.average_rating_percent  #=> 80
    @movie.rated_by?(current_user) #=> true
    @movie.rating_by(current_user) #=> 4
    @movie.ratings_count          #=> 1

    Movie.find_top_rated           #=> top rated records

Optional you can specify the highest score using the :max_rating paramter as follows. The default for :max_rating is 5.

    class Comment < ActiveRecord::Base
      acts_as_rateable :max_rating => 10
    end


CREDIT:
The gem is based on https://github.com/mreinsch/acts_as_rateable. This gem simply enhance it to be compitable with Rails 3 and up
