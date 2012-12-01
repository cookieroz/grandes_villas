class HomeController < ApplicationController
  def index
    @villasf = Villa.scoped.limit(4).order("RANDOM()")
    @home_page = true

    if params[:location_id]
      @locations = Location.all
      @villas = Villa.by_locations(params[:location_id])
    elsif params[:sleeps]
      @villas = Villa.find_all_by_sleeps(params[:sleeps][:num])
    elsif params[:bedrooms]
      @villas = Villa.find_all_by_bedrooms(params[:bedrooms][:num])
    else
      @villas = Villa.all
    end
  end
end
