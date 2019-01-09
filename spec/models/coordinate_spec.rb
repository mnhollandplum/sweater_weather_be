require 'rails_helper'

  RSpec.describe Coordinate, type: :model do

    context 'instance methods' do
      it 'can get coordinates from location' do
      location = 'denver,co'
      coordinate = Coordinate.new(location)

      expect(coordinate.coordinates).to be_an_instance_of(Hash)
      expect(coordinate.coordinates.keys).to eq([:lat, :lng])
      expect(coordinate.coordinates[:lat]).to be_an_instance_of(Float)
    end
  end
end
