require 'json'
require 'open-uri'

List.destroy_all
lists = [
  { name: 'favorite movies' },
  { name: 'action movies' },
  { name: 'western movies' }
]
List.create!(lists)

url = 'https://tmdb.lewagon.com/movie/top_rated'
movies = JSON.parse(URI.open(url).read)['results']

Movie.destroy_all

movies.each do |movie|
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/original/#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end
