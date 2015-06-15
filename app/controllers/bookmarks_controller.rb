class BookmarksController < ApplicationController
  @bookmarks = Bookmark.visible_to(current.user)
end