class BookmarksController < ApplicationController
  before_action :set_bike, only: %i[create]
  before_action :authenticate_user!

  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.bike = @bike
    @bookmark.save
    redirect_to request.referer
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to request.referer
  end

  private

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end
end
