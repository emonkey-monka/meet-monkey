require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#calc_distance' do
    let(:user) { User.create(latitude: 0, longitude: 0) }
    let(:latitude) { 15 }
    let(:longitude) { 15 }

    before { user.calc_distance(latitude, longitude) }
    subject(:distance) { user.distance }
    it { expect(distance).to eq 2347.7927573803795 }
  end 
  
end
