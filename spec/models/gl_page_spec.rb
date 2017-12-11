require 'rails_helper'

RSpec.describe GlPage, type: :model do
  describe '#calc_distance' do
    let(:glpage) { GlPage.create(latitude: 0, longitude: 0) }
    let(:latitude) { 15 }
    let(:longitude) { 15 }

    before { glpage.calc_distance(latitude, longitude) }
    subject(:distance) { glpage.distance }
    it { expect(distance).to eq 2347.7927573803795 }
  end 
  
  describe '#pldist' do
    let(:latitude) { 15 }
    let(:longitude) { 15 }
    before do
      GlPage.create(latitude: 0, longitude: 0)
      GlPage.create(latitude: 1, longitude: 1)
      GlPage.create(latitude: 2, longitude: 2)
    end
    subject(:glpages) { GlPage.pldist(latitude, longitude) }
    it { expect(glpages.count).to eq 3 }
    it { expect(glpages.map{|glpage| glpage[:distance]}).to eq [2033.0180431004885, 2190.3922613379364, 2347.7927573803795] }
  end
end
