require 'rails_helper'

RSpec.describe "spots/index", type: :view do
  before(:each) do
    assign(:spots, [
      Spot.create!(
        :name => "Name",
        :latitude => "Latitude",
        :longitude => "Longitude"
      ),
      Spot.create!(
        :name => "Name",
        :latitude => "Latitude",
        :longitude => "Longitude"
      )
    ])
  end

  it "renders a list of spots" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Latitude".to_s, :count => 2
    assert_select "tr>td", :text => "Longitude".to_s, :count => 2
  end
end
