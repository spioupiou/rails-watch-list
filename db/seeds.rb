# Deleting all movies
require 'open-uri'

puts 'Deleting previous data...'
Movie.destroy_all

puts 'Creating seeds...'

url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

response['results'].each do |movie_hash|
  Movie.create!(
    title: movie_hash['title'],
    overview: movie_hash['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie_hash['poster_path']}",
    rating: movie_hash['vote_average']
  )
end

puts 'Done!'
