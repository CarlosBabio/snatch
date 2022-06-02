class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.bike = Bike.find(params[:bike_id])
    @bike = @booking.bike
    if @booking.save
      redirect_to user_path(current_user)
    else
      render "bikes/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(
      :start_date,
      :end_date
    )
  end
end
