class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list_id = @bookmark.list_id
    @bookmark.destroy
    redirect_to list_path(@list_id)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :list_id, :comment)
  end
end