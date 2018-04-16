class DashboardController < ApplicationController
  def index
    @orders = Order.includes({screening: :movie}, {screening: :theater}, :customer)
    @movies = Movie.includes({orders: :customer}).limit(5)
    @movie_sales = Movie.includes(:orders).group("movies.name").sum('orders.total_cost').sort_by{|k,v| v}.reverse.transpose
    @popular_movies = Movie.ordered_by_popularity.limit(20).map { |movie| [movie.name, movie.popularity]}.transpose
    @daily_sales= @orders.order("date_trunc('day', screenings.scheduled_at) ASC, orders.total_cost ASC")
      .pluck("date_trunc('day', screenings.scheduled_at)", :total_cost)
      .group_by(&:first)
      .map {|day, records| [day.strftime("%a, %m-%d"), records.map(&:last).reduce(:+)]}
      .transpose
  end
end
