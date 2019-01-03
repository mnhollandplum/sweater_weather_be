require 'rails_helper'

describe GoogleGeolocationService do
  it 'exists' do
    VCR.use_cassette("google_coord_service") do
    coordinates_service = GoogleGeolocationService.new
    expect(coordinates_service).to be_a(GoogleGeolocationService)
    end
  end
  it 'returns coordinates' do
    VCR.use_cassette("google_coord_service") do
      coordinates_service = GoogleGeolocationService.new
      expect(coordinates_service.get_coordinates("Denver, CO")).to eq({"lat": 39.7392358, "lng": -104.990251})
    end
  end
end
