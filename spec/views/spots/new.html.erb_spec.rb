require 'rails_helper'

RSpec.describe "spots/new", type: :view do
  before(:each) do
    assign(:spot, Spot.new(
      :name => "MyString",
      :latitude => "MyString",
      :longitude => "MyString"
    ))
  end

  it "renders new spot form" do
    render

    assert_select "form[action=?][method=?]", spots_path, "post" do

      assert_select "input[name=?]", "spot[name]"

      assert_select "input[name=?]", "spot[latitude]"

      assert_select "input[name=?]", "spot[longitude]"
    end
  end
end
