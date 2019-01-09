class FavoritesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :current_weather_summary
end
