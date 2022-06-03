class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to user_path(current_user)
  end

  def show
    # Authentication logic will need to be done for user's Dashboard not to be shown to a stranger
    # This code will only run if current_user is authenticated
    # if current_user.id == params[:id]
    @my_bookings = current_user.bookings
    @my_pending_bookings = current_user.bookings.where(status: "PENDING")
    @my_approved_bookings = current_user.bookings.where(status: "CONFIRMED")
    @my_rejected_bookings = current_user.bookings.where(status: "CANCELLED")
    @my_completed_bookings = current_user.bookings.where(status: "COMPLETED")

    @my_bike_bookings = current_user.my_bike_bookings
    @my_bike_pending_bookings = current_user.my_bike_bookings.where(status: "PENDING")
    @my_bike_approved_bookings = current_user.my_bike_bookings.where(status: "CONFIRMED")
    @my_bike_rejected_bookings = current_user.my_bike_bookings.where(status: "CANCELLED")
    @my_bike_completed_bookings = current_user.my_bike_bookings.where(status: "COMPLETED")

    @user = current_user
    @bikes = current_user.bikes
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end
end
