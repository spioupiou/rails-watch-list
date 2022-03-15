class MoviesController < ApplicationController
  # search function with keyword

  def results
    require 'open-uri'
    keyword = params[:keyword]
    url = "http://www.omdbapi.com/?s=#{keyword}&apikey=d6e0d7e0"
    response = JSON.parse(URI.open(url).read)

    @movies = []

    response['Search'].each do |movie|
      @movies << {
        title: movie['Title'],
        poster_url: movie['Poster']
      }
    end

    @movie = Movie.new
    @list = List.find(params[:id])
  end

  # create a new movie
  def create
    @list = List.find(params[:list_id])
    @movie = Movie.create!(movie_params)
    @bookmark = Bookmark.create!(
      movie_id: @movie.id,
      list_id: @list.id,
      comment: "default"
    )
    redirect_to list_path(@list)
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :poster_url)
  end
end
