class PagesController < ApplicationController
  def home
    @bikes = Bike.last(8)
  end
end
