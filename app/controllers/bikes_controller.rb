class BikesController < ApplicationController
    def new 
        @bike = Bike.new
    end

    def create 
        @bike = Bike.new(bike_params)
    end

    private 

    def set_bike
        @bike = Bike.find(params[:id])
    end

    def bike_params
        params.require(:bike).permit(:title, :description, :address, :category, :engine_size, :license_plate, :price_per_day, :additional_info)
    end
end
