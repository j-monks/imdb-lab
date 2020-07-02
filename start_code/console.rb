require("pry-byebug")
require_relative("models/casting")
require_relative("models/star")
require_relative("models/movie")

Casting.delete_all()
Movie.delete_all()
Star.delete_all()


star1 = Star.new({
    'first_name' => 'Samuel L.', 
    'last_name' => 'Jackson'})
star1.save()

movie1 = Movie.new({
    'title' => 'Pulp Fiction',
    'genre' => 'Thriller'
})
movie1.save()

casting1 = Casting.new({ 'movie_id' => movie1.id,
    'star_id' => star1.id,
    'fee' => 100000})
casting1.save()


binding.pry
nil
