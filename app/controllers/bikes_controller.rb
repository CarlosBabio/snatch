class BikesController < ApplicationController

  def index
    if params["searchq"]
      redirect_to root_path unless params["searchq"] =~ /(\w|\d)+/
      @bikes = Bike.where("address iLIKE ?", "%#{params['searchq']}%")
                   .or(Bike.where("title iLIKE ?", "%#{params['searchq']}%")).limit(50)
    else
      redirect_to root_path
    end
  end
end
