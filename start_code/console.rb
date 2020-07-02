require("pry-byebug")
require_relative("models/casting")
require_relative("models/star")
require_relative("models/movie")


star1 = Star.new({
    'first_name' => 'Samuel L.', 
    'last_name' => 'Jackson'})
star1.save()

movie1 = Movie.new({
    'title' => 'Pulp Fiction',
    'genre' => 'Thriller'
})
movie1.save()




binding.pry
nil
