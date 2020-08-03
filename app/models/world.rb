# CountriesRecord
class World
  def initialize
    @document = read_document
  end

  def read_contries
    @document[:contries]
  end

  def read_continents
    @document[:continets]
  end

  private

  def read_document
    AppServices::XMLReaderService.new.read_document
  end
end
