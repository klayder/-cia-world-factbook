# CountriesRecord
class Countries
  def self.read_all_countries
    read_countries
  end
  
  def self.find_by_id(id)
    puts "find by id #{id}"
    read_countries.find { |i| i[:name].downcase == id.downcase }
  end

  private

  def read_countries
    AppServices::XMLReaderService.new.read_contries
  end
end
