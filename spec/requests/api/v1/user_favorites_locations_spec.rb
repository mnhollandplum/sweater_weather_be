require 'rails_helper'

describe 'User Favorites Locations' do

  it 'user can favorite locations' do

    user = User.create!(email: "test@email.com", password: "password", password_confirmation: "password")

    post "/api/v1/favorites?location=denver,co&api_key=#{user.api_key}"

    # favorite_json= JSON.parse(response.body, symbolize_names: true)
    #
    # expect(favorite_json.status).to eq(201)


end
end
