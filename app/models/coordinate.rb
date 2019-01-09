class Coordinate
  def initialize(location)
    @location = location
  end

  def coordinates
    geolocation_service.get_coordinates(@location)
  end

  def geolocation_service
    GoogleGeolocationService.new
  end
end
