require 'rails_helper'

RSpec.describe GlPage, type: :model do
  
  let(:glpage) { GlPage.create(latitude: 0, longitude: 0) }
  
  it "check calc_distance" do
    glpage.calc_distance(15, 15)
    expect(glpage.distance).to eq 2347.7927573803795
  end
end
