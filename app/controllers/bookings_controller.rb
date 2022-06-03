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

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "CONFIRMED"
    @booking.save

    redirect_to users_path(current_user)
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.status = "CANCELLED"
    @booking.save

    redirect_to users_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(
      :start_date,
      :end_date
    )
  end
end
