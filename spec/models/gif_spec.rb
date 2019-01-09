require 'rails_helper'

  RSpec.describe Gif, type: :model do

    context 'instance methods' do
      it 'can get gif url' do
      keyword = 'cheeseburger'
      gif = Gif.new(keyword)

      expect(gif.gif_url).to be_an_instance_of(String)
    end
  end
end
