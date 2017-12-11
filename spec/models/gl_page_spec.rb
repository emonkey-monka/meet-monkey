require 'rails_helper'

RSpec.describe GlPage, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
  it "check calc_distance" do
      glpage = GlPage.create(latitude: 0, longitude: 0)
      glpage.calc_distance(15, 15)
      expect(glpage.distance).to eq 2347.7927573803795
    end
end
