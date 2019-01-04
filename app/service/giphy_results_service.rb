class GiphyResultsService

  def get_gifs(search)
    get_json("/v1/gifs/random?api_key=#{ENV['GIPHY_API_KEY']}&q=#{search}")
  end

  private

  def conn
    Faraday.new(url:"https://api.giphy.com") do |faraday|
      faraday.params["key"] = ENV["GIPHY_API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
