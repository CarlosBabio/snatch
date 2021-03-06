class BikesController < ApplicationController
  before_action :set_bike, only: %i[edit update show destroy]

  def index
    if params["searchq"]
      redirect_to root_path unless params["searchq"] =~ /(\w|\d)+/
      @bikes = Bike.where("address iLIKE ?", "%#{params['searchq']}%")
                   .or(Bike.where("title iLIKE ?", "%#{params['searchq']}%"))
                   .or(Bike.where("category iLIKE ?", "%#{params['searchq']}%")).limit(50)

      @markers = @bikes.geocoded.map do |bike|
        {
          lat: bike.latitude,
          lng: bike.longitude,
          info_window: render_to_string(partial: "info_window", locals: { bike: bike })
        }
      end
    else
      redirect_to root_path
    end
  end

  def show
    @bike = Bike.find(params[:id])
    @booking = Booking.new
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @bike.update(bike_params)
    redirect_to  bike_path(@bike)
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(
      :title,
      :description,
      :address,
      :category,
      :engine_size,
      :license_plate,
      :price_per_day,
      :additional_info,
      photos: []
    )
  end
end
