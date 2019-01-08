require 'rails_helper'

describe 'User List of Favorites Locations' do

  it 'favorites can be listed for user' do
  #
    user = User.create(email: "test@email.com", password: "password", password_confirmation: "password")
    Favorite.create(user_id: user.id, location: 'denver,co')
    Favorite.create(user_id: user.id, location: 'new york,ny')

    get "/api/v1/favorites?api_key=#{user.api_key}"

    favorite_json= JSON.parse(response.body, symbolize_names: true)
    binding.pry
    expect(response.status).to eq(200)
    expect(favorite_json).to be_an_instance_of(Hash)
    expect(favorite_json.keys).to eq ([:location, :current_weather])
    expect(favorite_json[:location]).to eq ('denver,co')
    expect(favorite_json[:api_key]).to eq ("#{user.api_key}")
  end
end
