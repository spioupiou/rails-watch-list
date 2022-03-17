class MoviesController < ApplicationController
  def results
  end

  def search
    require 'open-uri'

    keyword = params[:keyword]
    url = "http://www.omdbapi.com/?s=#{keyword}&type=movie&apikey=#{ENV['OMDB_KEY']}"

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

    respond_to do |format|
      format.js {render layout: false}
    end
  end

  # create a new movie
  def create
    @list = List.find(params[:list_id])
    @movie = Movie.new(movie_params)
    @movie.list = @list
    @movie.save!
    redirect_to list_path(@list)
  end

  # def destroy
  #   @bookmark = Bookmark.find(params[:id])
  #   @list_id = @bookmark.list_id
  #   @bookmark.destroy
  #   redirect_to list_path(@list_id)
  # end

  private

  def movie_params
    params.require(:movie).permit(:title, :poster_url)
  end
end
