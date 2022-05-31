class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to user_path(current_user)
  end

  def show
    # Authentication logic will need to be done for user's Dashboard not to be shown to a stranger
    # This code will only run if current_user is authenticated
    # if current_user.id == params[:id]
    @user_bookings = current_user.bookings
    @user = current_user
  end
end
