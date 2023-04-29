# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

new_studio = Studio.new

new_studio["name"] = "Warner Bros."
puts new_studio.save

batman_begins = Movie.new

batman_begins["title"] = "Batman Begins"
batman_begins["year_released"] = "2005"
batman_begins["rated"] = "PG-13"
batman_begins["studio_id"] = new_studio["id"]
puts batman_begins.save

dark_knight = Movie.new

dark_knight["title"] = "The Dark Knight"
dark_knight["year_released"] = "2008"
dark_knight["rated"] = "PG-13"
dark_knight["studio_id"] = new_studio["id"]
puts dark_knight.save

knight_rises = Movie.new

knight_rises["title"] = "The Dark Rises"
knight_rises["year_released"] = "2012"
knight_rises["rated"] = "PG-13"
knight_rises["studio_id"] = new_studio["id"]
puts knight_rises.save

bb_actors = Actor.new

bb_actors["name"] = "Christian Bale"
bb_actors["name"] = "Michael Caine"
bb_actors["name"] = "Liam Neeson"
bb_actors["name"] = "Katie Holmes"
bb_actors["name"] = "Gary Oldman"
puts bb_actors.save

dk_actors = Actor.new

dk_actors["name"] = "Christian Bale"
dk_actors["name"] = "Heath Ledger"
dk_actors["name"] = "Aaron Eckhart"
dk_actors["name"] = "Maichael Caine"
dk_actors["name"] = "Maggie Gyllenhaal"
puts dk_actors.save

dkr_actors = Actor.new

dkr_actors["name"] = "Christian Bale"
dkr_actors["name"] = "Gary Oldman"
dkr_actors["name"] = "Tom Hardy"
dkr_actors["name"] = "Joseph Gordon-Levitt"
dkr_actors["name"] = "Anne Hathaway"
puts dkr_actors.save

# bb_roles1 = Role.new

# bb_roles["movie_id"] = batman_begins["id"]
# bb_roles["actor_id"] = bb_actors["id"]
# bb_roles["character_name"] = "Bruce Wayne"
# puts bb_roles1.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
movie_studio = Movie.where({"studio_id" => new_studio["id"]})

for movie in movie_studio
    title = movie["title"]
    release_year = movie["year_released"]
    rating = movie["rated"]
    studio = movie["studio_id"]
    puts "#{title} #{release_year} #{rating} #{studio}"
end

# Prints a header for the cast output
# puts ""
# puts "Top Cast"
# puts "========"
# puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# bb_movie = Movie.where({"name" =>["Batman Begins"]})
# for movie in 
