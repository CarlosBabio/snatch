class BikesController < ApplicationController
  def show
    @bike = Bike.find(params[:id])
  end
end
