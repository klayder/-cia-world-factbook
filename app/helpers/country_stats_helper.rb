require 'nokogiri'

# Helper for reading XML and parsing needed data
module CountryStatsHelper
  def parse_stats
    stats = read_xml
    initial_hash = { 'continents' => Hash.new([]), 'countries' => [] }
    stats.css('country').each_with_object(initial_hash) do |country, hash|
      country_name = country['name']
      continent = country['continent']
      hash['continents'][continent] = hash['continents'][continent].clone.push(country_name)
      hash['countries'] << parse_county_data(country)
    end
  end

  def find_country_with_biggest_population(countries)
    countries.max_by { |item| item['population'].to_f }
  end

  def find_highest_inflation_countries(countries)
    (countries.sort_by { |item| item['inflation'].to_f })[-5, 5].reverse
  end

  private

  def read_xml
    File.open("#{Rails.root}/app/assets/files/cia-1996.xml") { |f| Nokogiri::XML(f) }
  end

  def parse_county_data(country)
    country_name = country['name']
    inflation = country['inflation']
    population = country['population']

    {
      'name' => country_name,
      'inflation' => inflation,
      'population' => population
    }
  end
end
