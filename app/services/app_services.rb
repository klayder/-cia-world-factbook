require 'nokogiri'

# AppServices
module AppServices
  # XMLReaderService
  class XMLReaderService
    def initialize
      @document = parse_document File.open("#{Rails.root}/app/assets/files/cia-1996.xml") { |f| Nokogiri::XML(f) }
    end

    def read_document
      @document
    end

    private

    def parse_document(document)
      initial_hash = {
        contries: [],
        continets: Hash.new([])
      }
      document.css('country').each_with_object(initial_hash) do |country, hash|
        country_data = parse_county_data country
        hash[:contries] << country_data
        group_countries(country_data, hash[:continets])
      end
    end

    def parse_county_data(country)
      {
        name: country['name'],
        continent: country['continent'],
        inflation: country['inflation'].to_f,
        population: country['population'].to_i
      }
    end

    def group_countries(country_data, hash)
      continent = country_data[:continent]
      hash[continent] = hash[continent].clone.push(country_data)
    end
  end
end
