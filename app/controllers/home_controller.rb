class HomeController < ApplicationController
  def index
    @villas = Villa.scoped.limit(4).order("created_at DESC")
    @home_page = true
  end
end
