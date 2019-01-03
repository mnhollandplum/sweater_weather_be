require 'pry'
class GoogleGeolocationService

  def get_geolocation_coordinates
    get_json("/geolocation/v1/geolocate?key=#{ENV['GOOGLE_API_KEY']}")[:location]
    binding.pry
    #this will return the value of location{:lat => x, :lng=>x}
  end

  private

  def conn
    Faraday.new(url:"https://www.googleapis.com") do |faraday|
      faraday.params["key"] = ENV['GOOGLE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.post(url).body, symbolize_names: true)
  end

  p get_geolocation_coordinates
end
