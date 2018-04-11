class HomeController < ApplicationController
  def index
    @movies = Movie.first(12)
  end
end
