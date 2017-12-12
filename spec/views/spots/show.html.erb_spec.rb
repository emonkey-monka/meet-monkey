require 'rails_helper'

RSpec.describe "spots/show", type: :view do
  before(:each) do
    @spot = assign(:spot, Spot.create!(
      :name => "Name",
      :latitude => "Latitude",
      :longitude => "Longitude"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Latitude/)
    expect(rendered).to match(/Longitude/)
  end
end
