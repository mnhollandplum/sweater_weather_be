class DarkSkyResultsService

  def get_results(search_lat, search_lng)
    get_json("/forecast/#{ENV['DARK_SKY_API_KEY']}/#{search_lat},#{search_lng}")
  end

  private

  def conn
    Faraday.new(url:"https://api.darksky.net") do |faraday|
      faraday.params["key"] = ENV['DARK_SKY_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
