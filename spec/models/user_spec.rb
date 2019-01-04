require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }

  end
    context 'instance methods' do

      it 'creates api key for user' do

        user_1 = User.create!(email: "test1@email.com", password: "1234", password_confirmation: "1234")

        expect(user_1.api_key).to be_an_instance_of(String)

        user_2 = User.create!(email: "test2@email.com", password: "1234", password_confirmation: "1234")

        expect(user_2.api_key).to be_an_instance_of(String)
        expect(user_2.api_key).should_not eq(user_1.api_key)
      end
  end
end
