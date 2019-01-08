class Forecast
  def initialize(lat, lng)
    @lat = lat
    @lng = lng
  end

  def daily_forecast
    forecast_service.get_forecast(@lat, @lng)[:daily]
  end

  def current_weather
    forecast_service.get_forecast(@lat, @lng)[:currently][:summary]
  end


  def forecast_service
    DarkSkyResultsService.new
  end
end
