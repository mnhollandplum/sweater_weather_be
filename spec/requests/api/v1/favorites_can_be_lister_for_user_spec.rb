require 'rails_helper'

describe 'User List of Favorites Locations' do

  it 'favorites can be listed for user' do
  #
    user = User.create(email: "test@email.com", password: "password", password_confirmation: "password")
    Favorite.create(user_id: user.id, location: 'denver,co')
    Favorite.create(user_id: user.id, location: 'new york,ny')

    get "/api/v1/favorites?api_key=#{user.api_key}"

    favorite_json= JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(favorite_json).to be_an_instance_of(Hash)
    expect(favorite_json.keys).to eq([:data])
    expect(favorite_json[:data].count).to eq(2)
    expect(favorite_json[:data][0][:attributes].keys).to eq([:location, :current_weather])
  end

  it 'favorites can be deleted' do
  #
    user = User.create(email: "test@email.com", password: "password", password_confirmation: "password")
    Favorite.create(user_id: user.id, location: 'denver, co')
    Favorite.create(user_id: user.id, location: 'new york, ny')

    expect(user.favorites.count).to eq(2)

    delete "/api/v1/favorites?location=Denver,+CO&api_key=#{user.api_key}"
    #
    # expect(response).to be_successful
    # expect(user.cities.count).to eq(1)
  end
end
