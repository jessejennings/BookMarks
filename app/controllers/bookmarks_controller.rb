class BookmarksController < ApplicationController
  
  def index
    @bookmarks = Bookmark.all
    @mybookmarks = Bookmark.where(user_id: current_user.id) 
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
  end
end