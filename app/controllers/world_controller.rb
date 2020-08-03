# WorldController
class WorldController < ApplicationController
  def index
    @world = World.new
    @continents = @world.read_continents
    @countries = @world.read_contries
    @country_with_biggest_population = CountriesStatsAnalysisService
                                       .find_country_with_biggest_population(@countries)
    @highest_inflation_countries = CountriesStatsAnalysisService
                                   .find_highest_inflation_countries(@countries)
  end
end
