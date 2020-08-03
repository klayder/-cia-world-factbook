# CountriesStatsAlalysisService
class CountriesStatsAnalysisService
  def self.find_country_with_biggest_population(countries)
    puts countries
    countries.max_by { |item| item[:population].to_f }
  end

  def self.find_highest_inflation_countries(countries)
    (countries.sort_by { |item| item[:inflation].to_f })[-5, 5].reverse
  end
end
