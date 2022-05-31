class BikesController < ApplicationController
  def edit
  end

  def update
    @bike.update(bike_params)
    redirect_to  bike_path(@bike)
  end
end
