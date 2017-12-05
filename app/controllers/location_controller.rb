class LocationController < ApplicationController
  def index
    @location = Location.all
  end
end
