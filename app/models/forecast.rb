class Forecast
  def initialize(lat, lng)
    @lat = lat
    @lng = lng
  end

  def forecast
    forecast_service.get_forecast(@lat, @lng)
  end

  def daily_forecast
    forecast_service.get_forecast(@lat, @lng)[:daily]
  end


  def hourly_forecast
    forecast_service.get_forecast(@lat, @lng)[:hourly]
  end

  def current_weather
    forecast_service.get_forecast(@lat, @lng)[:currently]
  end


  def forecast_service
    DarkSkyResultsService.new
  end
end
