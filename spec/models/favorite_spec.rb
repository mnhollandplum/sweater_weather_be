require 'rails_helper'

  RSpec.describe Favorite, type: :model do
    context 'relationships' do
      it {should belong_to :user}
    end

    context 'instance methods' do
      it 'can get the forecast summary for a favorite location' do
      user = User.create(email: "user@test.com", password: "1234", password_confirmation: "1234")
      favorite = Favorite.create(user_id: user.id, location: 'denver,co')

      expect(favorite.current_weather).to eq("Partly Cloudy")

    end
  end
end
