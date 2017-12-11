require 'rails_helper'

RSpec.describe GlPage, type: :model do
  describe '#calc_distance' do
    let(:glpage) { GlPage.create(latitude: 0, longitude: 0) }
    let(:latitude) { 15 }
    let(:longitude) { 15 }

    before { GlPage.calc_distance }
    subject(:distance) { glpage.distance }
    it { expect(distance).to eq 2347.7927573803795 }
  end 
end