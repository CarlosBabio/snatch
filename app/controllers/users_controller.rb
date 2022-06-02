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
    @my_bike_bookings = current_user.my_bike_bookings
    @user = current_user
  end
end
