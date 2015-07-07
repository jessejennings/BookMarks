class BookmarksController < ApplicationController
  
  def index
    @bookmarks = Bookmark.all
    @mybookmarks = Bookmark.where(user_id: current_user.id) 
    authorize @bookmarks
  end

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    authorize @bookmark
      if @bookmark.save
       redirect_to @bookmark, notice: "Bookmark was saved successfully."
      else
       flash[:error] = "Error creating bookmark. Please try again."
       render :new
      end 
  end
end