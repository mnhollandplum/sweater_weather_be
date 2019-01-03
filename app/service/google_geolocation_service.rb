require 'pry'
class GoogleGeolocationService
  def get_coordinates(location)
    get_json("/maps/api/geocode/json?address=#{location}")[0][:geometry][:location]
  end
  private
  def conn
    Faraday.new(url:"https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV['GOOGLE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)[:results]
  end
end

  # def get_geolocation_coordinates
  #   get_json("/geolocation/v1/geolocate?key=#{ENV['GOOGLE_API_KEY']}")[:location]
  # end
  #
  # private
  #
  # def conn
  #   Faraday.new(url:"https://www.googleapis.com") do |faraday|
  #     faraday.params["key"] = ENV['GOOGLE_API_KEY']
  #     faraday.adapter Faraday.default_adapter
  #   end
  # end
  #
  # def get_json(url)
  #   JSON.parse(conn.post(url).body, symbolize_names: true)
  # end
