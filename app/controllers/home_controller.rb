class HomeController < ApplicationController
  def index
    @villas = Villa.all :limit => 4
    @home_page = true
  end
end
