require 'rails_helper'

describe 'internal gif api' do

  it 'API request is successful' do

    VCR.use_cassette("can send gif and summary request") do
      get "/api/v1/gifs?location=denver,co"
    end
    expect(response).to be_successful
    binding.pry
    gifs = JSON.parse(response.body, symbolize_names: true)
    # expect(forecast).to be_an_instance_of(Hash)

#     {
#   data: {
#     daily_forecasts: [
#       {
#         time: "1546498800",
#         summary: "Mostly sunny in the morning.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1546585200",
#         summary: "Partly cloudy in the evening.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1546671600",
#         summary: "Snowy.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1546758000",
#         summary: "Firenado",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1546844400",
#         summary: "Corgis because I cant think of other weather",
#         url: "<GIPHY_URL_GOES_HERE>"
#       }
#     ]
#   }
#   copyright: "2018"
# }
  end
end
