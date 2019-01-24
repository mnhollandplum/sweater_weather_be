require 'rails_helper'

RSpec.describe Forecast, type: :model do

  before(:each) do
    location = 'denver,co'
    @coordinates = Coordinate.new(location).coordinates

    @lat = @coordinates[:lat]
    @lng = @coordinates[:lng]

    @forecast = Forecast.new(@lat,@lng)
  end

  context 'instance methods' do
    it 'can get daily forecast' do
      expect(@forecast.daily_forecast).to be_an_instance_of(Hash)
      expect(@forecast.daily_forecast.keys).to eq([:summary, :icon, :data])
    end
    it 'can get hourly forecast' do
      expect(@forecast.hourly_forecast).to be_an_instance_of(Hash)
      expect(@forecast.hourly_forecast.keys).to eq([:summary, :icon, :data])
    end
    it 'can get current weather' do
      expect(@forecast.current_weather).to be_an_instance_of(Hash)
      expect(@forecast.current_weather[:summary]).to be_an_instance_of(String)
    end
  end
end
