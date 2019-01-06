describe 'daily weather with gif' do
  it 'returns content json from objects' do
    VCR.use_cassette("returns gif based on weather") do
      get "/api/v1/gifs?location=denver,co"

      expect(response.status).to eq 200
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to be_an_instance_of(Hash)
      expect(result.keys).to eq ([:data])
      expect(result[:data].keys).to eq ([:daily_forecasts])
      expect(result[:data][:daily_forecasts][0]).to include ("time")
    end
  end
end
