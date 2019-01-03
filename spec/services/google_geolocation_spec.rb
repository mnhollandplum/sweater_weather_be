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



# require 'rails_helper'
#
# describe GoogleGeolocationService do
#   it 'exists' do
#     VCR.use_cassette("google_geolocation_service") do
#     service = GoogleGeolocationService.new
#     expect(service).to be_a(GoogleGeolocationService)
#     end
#   end
#   it 'returns coordinates' do
#     VCR.use_cassette("google_geolocation_service") do
#       service = GoogleGeolocationService.new
#       expect(service.get_geolocation_coordinates[:lat].class).to be(Float)
#       expect(service.get_geolocation_coordinates[:lng].class).to be(Float)
#     end
#   end
# end
