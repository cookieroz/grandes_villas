class HomeController < ApplicationController
  def index
    @villas = Villa.all :limit => 4
  end
end
