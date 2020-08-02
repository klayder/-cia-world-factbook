# CountryStatsController
class CountryStatsController < ApplicationController
  include CountryStatsHelper
  def index
    parsed_stats = parse_stats
    @country_with_biggest_population = find_country_with_biggest_population(parsed_stats['countries'])
    @highest_inflation_countries = find_highest_inflation_countries(parsed_stats['countries'])
    @continents = parsed_stats['continents']
  end
end
